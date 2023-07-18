REPORT zot_03_p_internal_tables.

TYPES: BEGIN OF lty_menge_topla,
         matkl TYPE matkl,
         menge TYPE menge_d,
       END OF lty_menge_topla.

DATA: lt_material        TYPE TABLE OF zot_00_t_materia,
      lt_material_z      TYPE TABLE OF zot_00_t_materia,
      lt_material_merge  TYPE TABLE OF zot_00_t_materia,
      lt_material_toplam TYPE TABLE OF zot_00_t_materia,
      ls_material        TYPE zot_00_t_materia.

START-OF-SELECTION.

  SELECT *
  INTO TABLE lt_material_z
  FROM zot_00_t_materia.

  lt_material = VALUE #( BASE lt_material ( matnr = '01'
                                            maktx = 'Takim Cantasi'
                                            matkl = 'C'
                                            menge = 5
                                            meins = 'ST' )

                                            ( matnr = '02'
                                            maktx = 'Cekic'
                                            matkl = 'C'
                                            menge = 5
                                            meins = 'ST' )

                                            ( matnr = '03'
                                            maktx = 'Rulman'
                                            matkl = 'C'
                                            menge = 5
                                            meins = 'ST' )

                                            ( matnr = '04'
                                            maktx = 'Civi'
                                            matkl = 'C'
                                            menge = 5
                                            meins = 'ST' )

                                            ( matnr = '05'
                                            maktx = 'Kilit'
                                            matkl = 'C'
                                            menge = 10
                                            meins = 'ST' )
                                            ).

  LOOP AT lt_material_z INTO DATA(ls_material_z_degistir).
    READ TABLE lt_material INTO DATA(ls_material_degistir) WITH KEY meins = ls_material_z_degistir-meins. "Ölçü birimleri eşleşiyorsa z'li tabloyadaki menge alanına 10 ekleniyor.

    IF sy-subrc EQ 0.
      ls_material_z_degistir-menge += 10.
      MODIFY lt_material_z FROM ls_material_z_degistir.
    ENDIF.

    CLEAR ls_material_z_degistir.
  ENDLOOP.

  LOOP AT lt_material_z INTO DATA(ls_material_merge).   "benim yazdigim tablo ile zot_00_t_materia tablosunun birlstigi kısım.
    APPEND ls_material_merge TO lt_material_merge.
  ENDLOOP.

  LOOP AT lt_material INTO DATA(ls_material_merge2).
    APPEND ls_material_merge2 TO lt_material_merge. "kendi verilerimin eklendigi yer
  ENDLOOP.

  DATA: lt_menge_collect TYPE TABLE OF lty_menge_topla.  "matkl menge alanlarının toplamının saklandığı internal table.
  DATA: ls_menge_collect TYPE lty_menge_topla.

  LOOP AT lt_material_merge INTO DATA(ls_menge).
    ls_menge_collect = VALUE #( matkl = ls_menge-matkl
                                menge = ls_menge-menge ).

    COLLECT ls_menge_collect INTO lt_menge_collect. "matl leri ortak olan mengeleri topluyoruz
    CLEAR ls_menge_collect.
  ENDLOOP.


  DELETE lt_material_merge WHERE menge < 10. "iki tabloda da mengeleri 10 dan kucuk olanlari silme islemi


  SORT lt_material_merge BY menge ASCENDING. "mengeye gore siralama yontemi
  SORT lt_menge_collect BY menge DESCENDING.

  cl_demo_output=>display( lt_material_merge ).
  cl_demo_output=>display( lt_menge_collect ).


END-OF-SELECTION.
