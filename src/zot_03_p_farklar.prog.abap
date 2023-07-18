REPORT zot_03_p_farklar.

DATA: edays   LIKE vtbbewe-atage,  "number of days vtbbewe-atage
      emonths LIKE vtbbewe-atage,
      eyears  LIKE vtbbewe-atage.

PARAMETERS: fromdate LIKE vtbbewe-dbervon,  "??
            todate   LIKE vtbbewe-dberbis DEFAULT sy-datum. "end of calculation period vtbbewe-dberbis

CALL FUNCTION 'FIMA_DAYS_AND_MONTHS_AND_YEARS' "iki takvim arasindaki gun ay ve yillari belirtir
  EXPORTING
    i_date_from    = fromdate
    i_date_to      = todate
    i_flg_separate = ' '
  IMPORTING
    e_days         = edays
    e_months       = emonths
    e_years        = eyears.

edays = edays .
WRITE:/ 'Gunler Arasindaki Fark: ', edays.
WRITE:/ 'Aylar Arasindaki Fark: ', emonths.
WRITE:/ 'Yillar Arasindaki Fark:  ', eyears.

INITIALIZATION.
  fromdate = sy-datum - 60 .
