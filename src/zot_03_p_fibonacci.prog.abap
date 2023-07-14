REPORT zot_03_p_fibonacci.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_max TYPE p,
              p_krlm TYPE p.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  DATA: gv_max  TYPE i,
        gv_krlm TYPE i,
        input1  TYPE i,
        input2  TYPE i,
        gv_tmp  TYPE i.

  gv_max = p_max.
  gv_krlm = p_krlm.
  input1 = 1.
  input2 = 2.

  IF p_max IS INITIAL.
    cl_demo_output=>display( 'Maksimum Sayı kısmı boş bırakılamaz!' ).
  ELSEIF p_krlm IS INITIAL.
    cl_demo_output=>display( 'Kırılım Sayısı boş bırakılamaz!' ).
  ELSEIF  abap_false => p_max.
    cl_demo_output=>display( 'Maksimum sayı 0 veya 0dan küçük bir değer olamaz.' ).
  ELSEIF  abap_false => p_krlm.
    cl_demo_output=>display( 'Kırılım noktası 0 veya 0dan küçük bir değer olamaz.' ).
  ELSE.

    WHILE gv_max => input1 .
      WRITE: input1.
      gv_tmp = input1.
      input1 = input2.
      input2 = gv_tmp + input2.
      IF sy-index MOD gv_krlm = 0.
        WRITE:/.
      ENDIF.
    ENDWHILE.
  ENDIF.
