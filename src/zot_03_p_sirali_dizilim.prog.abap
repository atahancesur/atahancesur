REPORT zot_03_p_sirali_dizilim.

PARAMETERS : p_max  TYPE p,
             p_krlm TYPE p.

DATA: lv_index TYPE i.

START-OF-SELECTION.

*  IF p_max > '100'.
*    cl_demo_output=>display( 'Yuzden buyuk sayi giremezsiniz!' ).
*  ENDIF.


  DO p_max TIMES.
    lv_index = lv_index + 1.
    WRITE : lv_index.

    lv_index = lv_index + 1.
    WRITE : lv_index.
    IF p_max > '100'.
      cl_demo_output=>display( 'Yuzden buyuk sayi giremezsiniz!' ).
    ENDIF.

    IF lv_index MOD p_krlm EQ 0.
      WRITE: /.
    ENDIF.

  ENDDO.

END-OF-SELECTION.
