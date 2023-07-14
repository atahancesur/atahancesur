REPORT zot_03_calculator.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_val1 TYPE i OBLIGATORY,
              p_val2 TYPE i OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.


SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.


  PARAMETERS: p_topla RADIOBUTTON GROUP g1,
              p_cikar RADIOBUTTON GROUP g1,
              p_carp  RADIOBUTTON GROUP g1,
              p_bol   RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b2.

DATA: p_sonuc TYPE p DECIMALS 3.

START-OF-SELECTION.
  IF p_topla = 'X'.
    p_sonuc = p_val1 + p_val2.
  ELSEIF p_cikar = 'X'.
    p_sonuc = p_val1 - p_val2.
  ELSEIF p_bol = 'X'.
    TRY.
        p_sonuc = p_val1 / p_val2.
      CATCH cx_sy_zerodivide.
        MESSAGE 'Sifira bolemezsin' TYPE 'I'.
        DATA(lv_flag) = 'X' .
    ENDTRY.
  ELSE.
    p_sonuc = p_val1 * p_val2.
  ENDIF.

  IF lv_flag NE 'X'.
    MESSAGE | {  p_sonuc } | TYPE 'I'.
  ENDIF.
