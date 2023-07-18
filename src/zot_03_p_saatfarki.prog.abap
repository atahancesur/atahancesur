REPORT zot_03_p_saatfarki.

DATA: time_1 TYPE T.
      time_1 = SY-UZEIT.

Write /(60) time_1 USING EDIT MASK
'Su anki zaman: __:__:__'.

time_1 = time_1 + 90.

Write /(60) time_1 USING EDIT MASK
'90 dakika sonra zaman su sekilde olacak: __:__:__'.
