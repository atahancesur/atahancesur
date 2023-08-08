REPORT zot_03_p_odev1.

TABLES: zot_03_t_p_mast, zot_03_t_p_iltsm.

TYPES: BEGIN OF lty_salv,

         personel_no  TYPE zot_03_e_personel_no,
         adi          TYPE zot_03_e_adi,
         soyadi       TYPE zot_03_e_soyadi,
         cinsiyeti    TYPE zot_03_e_cinsiyeti,
         dogum_yeri   TYPE zot_03_e_dogum_yeri,
         dogum_tarihi TYPE zot_03_e_dogum_tarihi,
         medeni_hali  TYPE zot_03_e_medeni_hali,
         cocuk_sayisi TYPE zot_03_e_cocuk_sayisi,
         uyruk        TYPE land1,
         iletisim_tur TYPE zot_03_e_iletisim_turu,

       END OF lty_salv.

DATA: lt_salv TYPE TABLE OF lty_salv,
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


  SELECT z1~personel_no,
         concat_with_space( z1~adi, z1~soyadi, 1 ) AS adi,
         z1~cinsiyeti,
         z1~dogum_yeri,
         z1~dogum_tarihi,
         z1~medeni_hali,
         z1~cocuk_sayisi,
         z1~uyruk,
         z2~iletisim_tur

    FROM zot_03_t_p_mast AS z1
    INNER JOIN zot_03_t_p_iltsm AS z2 ON z1~personel_no = z2~personel_no
    WHERE z1~personel_no IN @s_id
    INTO TABLE @DATA(lt_data).

  cl_salv_table=>factory(
    IMPORTING
      r_salv_table = go_salv
    CHANGING
      t_table      = lt_data
  ).

  DATA: lo_display TYPE REF TO cl_salv_display_settings.

  lo_display = go_salv->get_display_settings( ).
  lo_display->set_list_header( value = 'SALV Odev 1' ).
  lo_display->set_striped_pattern( value = 'X' ).

  DATA: lo_cols TYPE REF TO cl_salv_columns.

  lo_cols = go_salv->get_columns( ).
  lo_cols->set_optimize( value = 'X' ).

  DATA: lo_col TYPE REF TO cl_salv_column.

  TRY.
      lo_col =  lo_cols->get_column( columnname = 'PERSONEL_NO' ).
    CATCH cx_salv_not_found INTO DATA(lv_msg).
      MESSAGE lv_msg->get_text( ) TYPE 'I' DISPLAY LIKE 'E'.
  ENDTRY.
  lo_col->set_short_text('Pers.ID').
  lo_col->set_medium_text('Personel ID').
  lo_col->set_long_text('Personel ID').

  TRY.
      lo_col =  lo_cols->get_column( columnname = 'ADI' ).
    CATCH cx_salv_not_found .
  ENDTRY.
  lo_col->set_short_text( value = 'Ad Soyad' ).
  lo_col->set_medium_text( value = 'Adi Soyadi' ).
  lo_col->set_long_text( value = 'Adi Soyadi' ).

*  TRY.
*      lo_col =  lo_cols->get_column( columnname = 'SOYADI' ).
*    CATCH cx_salv_not_found .
*  ENDTRY.
*  lo_col->set_short_text( value = 'Soyadi' ).
*  lo_col->set_medium_text( value = 'Soyadi' ).
*  lo_col->set_long_text( value = 'Soyadi' ).

  TRY.
      lo_col =  lo_cols->get_column( columnname = 'CINSIYETI' ).
    CATCH cx_salv_not_found .
  ENDTRY.
  lo_col->set_short_text( value = 'Cins.' ).
  lo_col->set_medium_text( value = 'Cinsiyeti' ).
  lo_col->set_long_text( value = 'Cinsiyeti' ).

  TRY.
      lo_col =  lo_cols->get_column( columnname = 'DOGUM_TARIHI' ).
    CATCH cx_salv_not_found .
  ENDTRY.
  lo_col->set_short_text( value = 'D.Tarihi' ).
  lo_col->set_medium_text( value = 'Dogum Tarih.' ).
  lo_col->set_long_text( value = 'Dogum Tarihi' ).

  TRY.
      lo_col =  lo_cols->get_column( columnname = 'MEDENI_HALI' ).
    CATCH cx_salv_not_found .
  ENDTRY.
  lo_col->set_short_text( value = 'MedeniHali' ).
  lo_col->set_medium_text( value = 'Medeni Hali' ).
  lo_col->set_long_text( value = 'Medeni Hali' ).

  TRY.
      lo_col =  lo_cols->get_column( columnname = 'COCUK_SAYISI' ).
    CATCH cx_salv_not_found .
  ENDTRY.
  lo_col->set_short_text( value = 'Cocuk S.' ).
  lo_col->set_medium_text( value = 'Cocuk Sayisi' ).
  lo_col->set_long_text( value = 'Cocuk Sayisi' ).

  TRY.
      lo_col =  lo_cols->get_column( columnname = 'DOGUM_YERI' ).
    CATCH cx_salv_not_found .
  ENDTRY.
  lo_col->set_short_text( value = 'D.Yeri' ).
  lo_col->set_medium_text( value = 'Dogum Yeri' ).
  lo_col->set_long_text( value = 'Dogum Yeri' ).

  TRY.
      lo_col =  lo_cols->get_column( columnname = 'ILETISIM_TUR' ).
    CATCH cx_salv_not_found .
  ENDTRY.
  lo_col->set_short_text( value = 'IltsmTur' ).
  lo_col->set_medium_text( value = 'Iletism Tur' ).
  lo_col->set_long_text( value = 'Iletisim Turu' ).

  TRY.
      lo_col =  lo_cols->get_column( columnname = 'UYRUK' ).
    CATCH cx_salv_not_found .
  ENDTRY.
  lo_col->set_short_text( value = 'Uyruk' ).
  lo_col->set_medium_text( value = 'Uyruk' ).
  lo_col->set_long_text( value = 'Uyruk' ).

  go_salv->display( ).

END-OF-SELECTION.
