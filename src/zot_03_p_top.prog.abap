*&---------------------------------------------------------------------*
*& Include          ZOT_03_P_TOP
*&---------------------------------------------------------------------*

DATA: go_alv  TYPE REF TO cl_gui_alv_grid,
      go_cont TYPE REF TO cl_gui_custom_container.

DATA: gt_odev2 TYPE TABLE OF ZOT_03_S_PERSONEL_ALV,
      gt_fcat  TYPE lvc_t_fcat,
      gs_fcat  TYPE lvc_s_fcat.

TABLES: zot_03_t_p_mast, zot_03_t_p_iltsm.

DATA: "lt_salv TYPE TABLE OF lty_salv,
      go_salv TYPE REF TO cl_salv_table.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS s_id FOR zot_03_t_p_mast-personel_no.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS: p_val1 TYPE char60,
              p_val2 TYPE char60.

SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.


  PARAMETERS: p_ekle   RADIOBUTTON GROUP g1,
              p_sil    RADIOBUTTON GROUP g1,
              p_gnclle RADIOBUTTON GROUP g1,
              p_gstr   RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b3.



START-OF-SELECTION.

  SELECT z1~personel_no,
         concat_with_space( z1~adi, z1~soyadi, 1 ) AS adi,
         z1~cinsiyeti,
         z1~dogum_yeri,
         z1~dogum_tarihi,
         z1~medeni_hali,
         z1~cocuk_sayisi,
         z1~uyruk
*         z2~iletisim_tur

    FROM zot_03_t_p_mast AS z1
    INNER JOIN zot_03_t_p_iltsm AS z2 ON z1~personel_no = z2~personel_no
    INTO CORRESPONDING FIELDS OF TABLE @gt_odev2.


DATA lt_main_modify TYPE TABLE OF zot_03_t_p_mast.

START-OF-SELECTION.

  IF p_ekle = abap_true.
    IF p_val1 IS INITIAL.
      cl_demo_output=>display( 'Personel ID girmelisiniz.' ).
    ELSEIF p_val2 IS INITIAL.
      cl_demo_output=>display( 'Ad kısmı boş bırakılamaz.' ).
    ELSE.
      SELECT SINGLE COUNT( * )
       FROM zot_03_t_p_mast
       WHERE personel_no = p_val1.
      IF sy-subrc = 0.
        cl_demo_output=>display( 'Girdiginiz Personel ID zaten daha önceden olusturulmus. Varolan Personel ID silinebilir ya da ilgili Personel ID guncellenebilir.' ).
      ELSE.
        APPEND VALUE #( personel_no = p_val1
                        adi = p_val2 ) TO lt_main_modify.
        MODIFY zot_03_t_p_mast FROM TABLE lt_main_modify.
        cl_demo_output=>display( 'İşlem Başarılı!' ).
      ENDIF.
    ENDIF.

  ELSEIF p_gnclle = abap_true.
    IF p_val1 IS INITIAL.
      cl_demo_output=>display( 'Personel ID giriniz!' ).
    ELSEIF p_val2 IS INITIAL.
      cl_demo_output=>display( 'Ad kısmı bos birakilamaz.' ).
    ELSE.
      SELECT SINGLE COUNT( * )
         FROM zot_03_t_p_mast
         WHERE personel_no = p_val1.
      IF sy-subrc = 0.
        UPDATE zot_03_t_p_mast SET personel_no = p_val2
        WHERE personel_no = p_val1.
        COMMIT WORK AND WAIT.
        cl_demo_output=>display( 'Isleminiz Basarili.' ).
      ELSE.
        cl_demo_output=>display( 'Girdiginiz IDye sahip bir personel bulunmamaktadır!' ).
      ENDIF.
    ENDIF.

  ELSEIF p_sil = abap_true.
    IF zot_03_t_p_mast-personel_no IS INITIAL.
      cl_demo_output=>display( 'Personel ID giriniz!' ).
    ELSE.
      SELECT SINGLE COUNT( * )
         FROM zot_03_t_p_mast
         WHERE personel_no = s_id.
      IF sy-subrc = 0.
        DELETE FROM zot_03_t_p_mast WHERE personel_no = s_id.
        COMMIT WORK AND WAIT.
        cl_demo_output=>display( 'Isleminiz Basarili.' ).
      ELSE.
        cl_demo_output=>display( 'Girdiginiz IDye sahip bir personel bulunmamaktadır!' ).
      ENDIF.
    ENDIF.

    ELSE.
    SELECT adi
    FROM zot_03_t_p_mast
    INTO TABLE @DATA(odev1).
    IF sy-subrc = 0.
      cl_demo_output=>display( odev1 ).
    ELSE.
      cl_demo_output=>display( 'Tabloda boyle bir personel bulunmamaktadır!' ).
    ENDIF.

  ENDIF.
