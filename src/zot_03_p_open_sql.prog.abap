*&---------------------------------------------------------------------*
*& Report zot_03_p_open_sql
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOT_03_P_OPEN_SQL.

*DATA gv_matnr TYPE matnr.
*
*DATA matnr TYPE matnr.

DATA GV_BANFN TYPE EBAN-BANFN.
DATA GS_EBAN TYPE EBAN.
DATA GT_EBAN TYPE TABLE OF EBAN.

START-OF-SELECTION.

  SELECT SINGLE BANFN
  FROM EBAN
  WHERE BANFN NE @SPACE
  INTO @GV_BANFN.

  WRITE :/ GV_BANFN.
