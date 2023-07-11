FUNCTION ZOT_03_DO_MATH_OPS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_NUMBER1) TYPE  I
*"     VALUE(IV_NUMBER2) TYPE  I
*"     VALUE(IV_OPERATION) TYPE  I
*"  EXPORTING
*"     REFERENCE(EV_RESULT) TYPE  I
*"  RAISING
*"      CX_SY_ZERODIVIDE
*"     RESUMABLE(CX_SY_ASSIGN_CAST_ERROR)
*"----------------------------------------------------------------------
  CASE IV_OPERATION.
    WHEN '+'.
    EV_RESULT = IV_NUMBER1 + IV_NUMBER2.
    WHEN '-'.
    EV_RESULT = IV_NUMBER1 - IV_NUMBER2.
    WHEN '*'.
    EV_RESULT = IV_NUMBER1 * IV_NUMBER2.
    WHEN '/'.
    EV_RESULT = IV_NUMBER1 / IV_NUMBER2.
  ENDCASE.

ENDFUNCTION.
