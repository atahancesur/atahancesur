REPORT zot_03_p_zmn.

DATA: lt_zmn TYPE TABLE OF zot_03_t_zmn,
      ls_zmn TYPE  zot_03_t_zmn.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS s_id FOR ls_zmn-indx.

SELECTION-SCREEN END OF BLOCK b1.


DATA: lv_tarih1     TYPE dats,
      lv_tarih2     TYPE dats,
      lv_tarih_fark TYPE i,
      lv_saat1      TYPE tims,
      lv_saat2      TYPE tims,
      lv_saat_fark  TYPE i,
      lv_yil        TYPE i,
      lv_ay         TYPE i,
      lv_gun        TYPE i,
      lv_saat       TYPE i,
      lv_dk         TYPE i,
      lv_sn         TYPE i.

START-OF-SELECTION.

  SELECT *
           INTO TABLE lt_zmn
           FROM zot_03_t_zmn
           WHERE indx IN s_id.

  LOOP AT lt_zmn INTO ls_zmn.

    lv_tarih1 = ls_zmn-bslngctrh.
    lv_tarih2 = ls_zmn-bitistrh.
    lv_saat1 = ls_zmn-bslngcsaat.
    lv_saat2 = ls_zmn-bitissaat.

    lv_tarih_fark = lv_tarih2 - lv_tarih1.
    lv_saat_fark = lv_saat2 - lv_saat1.

    WRITE: | { ls_zmn-indx }. IDye ait kayitta; |.

    IF lv_saat1 > lv_saat2.
      lv_tarih_fark = lv_tarih_fark - 1.
      lv_saat_fark = 86400 - lv_saat1 + lv_saat2.

    ELSE.
      lv_saat_fark = lv_saat2 - lv_saat1.

    ENDIF.

    lv_yil = lv_tarih_fark DIV 365.
    lv_tarih_fark = lv_tarih_fark MOD 365.
    lv_ay = lv_tarih_fark DIV 30.
    lv_tarih_fark = lv_tarih_fark MOD 365.
    lv_gun = lv_tarih_fark MOD 30.

    lv_sn = lv_saat_fark MOD 60.
    lv_dk = lv_saat_fark / 60.
    lv_saat = lv_saat_fark / 3600.


    IF lv_yil NE 0.
      WRITE: | { lv_yil } Yil|.
    ENDIF.

    IF lv_ay NE 0.
      WRITE: | { lv_ay } Ay|.
    ENDIF.
    IF lv_gun NE 0.
      WRITE: | { lv_gun } Gun|.
    ENDIF.

    IF lv_saat NE 0.
      WRITE: | { lv_saat } Saat|.
    ENDIF.

    IF lv_dk NE 0.
      WRITE: | { lv_dk } Dakika|.
    ENDIF.

    IF lv_sn NE 0.
      WRITE: | { lv_sn } Saniye|.
      WRITE : | Fark Vardir. |.
    ENDIF.

    WRITE: /.

  ENDLOOP.

END-OF-SELECTION.
