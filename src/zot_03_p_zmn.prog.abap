REPORT zot_03_p_zmn.

DATA: lt_zmn TYPE TABLE OF zot_03_t_zmn,
      ls_zmn TYPE  zot_03_t_zmn.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS s_id FOR ls_zmn-indx.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  SELECT *
           INTO TABLE lt_zmn
           FROM zot_03_t_zmn
           WHERE indx IN s_id.

  LOOP AT lt_zmn INTO ls_zmn.

    DATA: gv_tarih1     TYPE dats,
          gv_tarih2     TYPE dats,
          gv_tarih_fark TYPE i,
          gv_saat1      TYPE tims,
          gv_saat2      TYPE tims,
          gv_saat_fark  TYPE i,
          gv_yil        TYPE i,
          gv_ay         TYPE i,
          gv_gun        TYPE i,
          gv_saat       TYPE i,
          gv_dk         TYPE i,
          gv_sn         TYPE i.

    gv_tarih1 = ls_zmn-bslngctrh.
    gv_tarih2 = ls_zmn-bitistrh.
*    gv_saat1 = ls_zmn-bslngcsaat.
    gv_saat2 = ls_zmn-bitissaat.

    gv_tarih_fark = gv_tarih2 - gv_tarih1.
    gv_saat_fark = gv_saat2 - gv_saat1.


    WRITE: | { ls_zmn-indx }. INDX AIT KAYITTA; |.

    IF gv_tarih1 > gv_tarih2.
      WRITE: 'Ilk tarih ikinci tarihten buyuk olamaz!'.

    ELSEIF gv_saat1 > gv_saat2.
      WRITE: 'Ilk saat ikinci saatten buyuk olamaz!'.

    ELSEIF gv_tarih1 = gv_tarih2 AND gv_saat1 = gv_saat2.
      WRITE: 'Zaman farki yoktur!'.

    ELSE.

      IF gv_saat1 > gv_saat2.
        gv_tarih_fark = gv_tarih_fark - 1.
        gv_saat_fark = 86400 - gv_saat1 + gv_saat2.

      ELSE.
        gv_saat_fark = gv_saat2 - gv_saat1.

      ENDIF.

    ENDIF.

    gv_yil = gv_tarih_fark DIV 365.
    gv_tarih_fark = gv_tarih_fark MOD 365.
    gv_ay = gv_tarih_fark DIV 30.
    gv_tarih_fark = gv_tarih_fark MOD 365.
    gv_gun = gv_tarih_fark MOD 30.

    gv_sn = gv_saat_fark MOD 60.
    gv_dk = gv_saat_fark / 60 MOD 60.
    gv_saat = gv_saat_fark / 3600.


    IF gv_yil NE 0.
      WRITE: | { gv_yil } YIL|.
    ENDIF.

    IF gv_ay NE 0.
      WRITE: | { gv_ay } AY|.
    ENDIF.
    IF gv_gun NE 0.
      WRITE: | { gv_gun } GUN|.
    ENDIF.

    IF gv_saat NE 0.
      WRITE: | { gv_saat } SAAT|.
    ENDIF.

    IF gv_dk NE 0.
      WRITE: | { gv_dk } DAKIKA|.
    ENDIF.

    IF gv_sn NE 0.
      WRITE: | { gv_sn } SANIYE|.
      WRITE : | Fark Vardir. |.
    ENDIF.

    WRITE: /.

  ENDLOOP.

END-OF-SELECTION.
