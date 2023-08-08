TABLES: vbak,
        vbap.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_vbeln FOR vbak-vbeln NO INTERVALS,
                  s_kunnr FOR vbak-kunnr NO INTERVALS,
                  s_auart FOR vbak-auart NO INTERVALS,
                  s_audat FOR vbak-audat NO INTERVALS.

SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-002.

  SELECT-OPTIONS: s_matnr FOR vbap-matnr NO INTERVALS,
                  s_werks FOR vbap-werks NO INTERVALS,
                  s_pstyv FOR vbap-pstyv NO INTERVALS,
                  s_matkl FOR vbap-matkl NO INTERVALS,
                  s_charg FOR vbap-charg NO INTERVALS.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK c1 WITH FRAME TITLE TEXT-003.

PARAMETERS: c_box1 AS CHECKBOX,
            c_box2 AS CHECKBOX,
            c_box3 AS CHECKBOX,
            c_box4 AS CHECKBOX,
            c_box5 AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK c1.

DATA: go_custom TYPE REF TO cl_gui_custom_container,
      go_grid   TYPE REF TO cl_gui_alv_grid,
      gt_vbak   TYPE TABLE OF zot_03_s_siparis,
      gt_vbap   TYPE TABLE OF zot_03_s_siparis,
      gt_fcat   TYPE lvc_t_fcat,
      gs_fcat   TYPE lvc_s_fcat,
      gs_layout TYPE lvc_s_layo,
      gv_title  TYPE char50.

FIELD-SYMBOLS: <gfs_siparis> TYPE zot_03_s_siparis.
