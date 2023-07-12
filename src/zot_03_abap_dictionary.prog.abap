REPORT ZOT_03_ABAP_DICTIONARY.
DATA: LS_PERSONEL TYPE ZOT_03_S_PERSONEL,
      LT_PERSONEL TYPE TABLE OF ZOT_03_S_PERSONEL.     "structure tipinde tablo yapiyor
*       ls_personel_n TYPE zot_03_tt_personel,          "tablo tipinda satir yapiyor
*       lt_personel_n TYPE TABLE OF zot_03_tt_personel. "tablo tipinda tablo yapiyor


LT_PERSONEL = VALUE #( ( ID        = 1
                         AD        = 'Atahan Cesur'
                         YAS       = 22
                         DEPARTMAN = 'ABAP'
                         UNVAN     = 'Stajyer'
                         EKIP      = VALUE ZOT_03_TT_EKIP( ( ID = 2
                                                             AD = 'Taha Balik' ) )
                     ) ).

BREAK ZOT_03.
