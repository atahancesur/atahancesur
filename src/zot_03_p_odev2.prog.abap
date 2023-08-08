*&---------------------------------------------------------------------*
*& Report ZOT_03_P_ODEV2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_03_p_odev2.

INCLUDE zot_03_p_top.
INCLUDE zot_03_p_pbo.
INCLUDE zot_03_p_pai.
INCLUDE zot_03_p_frm.

TABLES: zot_03_t_p_mast, zot_03_t_p_iltsm.

*TYPES: BEGIN OF lty_salv,
*
*         personel_no  TYPE zot_03_e_personel_no,
*         adi          TYPE zot_03_e_adi,
*         soyadi       TYPE zot_03_e_soyadi,
*         cinsiyeti    TYPE zot_03_e_cinsiyeti,
*         dogum_yeri   TYPE zot_03_e_dogum_yeri,
*         dogum_tarihi TYPE zot_03_e_dogum_tarihi,
*         medeni_hali  TYPE zot_03_e_medeni_hali,
*         cocuk_sayisi TYPE zot_03_e_cocuk_sayisi,
*         uyruk        TYPE land1,
*         iletisim_tur TYPE zot_03_e_iletisim_turu,
*
*       END OF lty_salv.

DATA: "lt_salv TYPE TABLE OF lty_salv,
      go_salv TYPE REF TO cl_salv_table.


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

  PERFORM set_fcat.

  CALL SCREEN 0100.
