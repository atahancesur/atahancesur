REPORT zot_03_p_odev3.

INCLUDE zot_03_p_dialog_top.
INCLUDE zot_03_p_dialog_pbo.
INCLUDE zot_03_p_dialog_pai.
INCLUDE zot_03_p_dialog_frm.


START-OF-SELECTION.

SELECT * FROM zot_03_t_teslimt
  INTO TABLE gt_teslimat.
  IF sy-subrc IS INITIAL.
    SORT gt_teslimat.
  ENDIF.

CALL SCREEN 0100.
