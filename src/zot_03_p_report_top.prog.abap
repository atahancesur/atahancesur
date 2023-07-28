TABLES: eban,       "EBAN is a standard Purchasing Transparent Table in SAP MM application, which stores Purchase Requisition data.
        ekko,       "EKKO (Purchasing Document Header)
        ekpo.       "EKPO is a standard Purchasing Transparent Table in SAP MM application, which stores Purchasing Document Item data

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_banfn FOR eban-banfn NO INTERVALS, "Purchase Requisition- Purchase requisition number
                  s_bnfpo FOR eban-bnfpo NO INTERVALS. "Purchase Requisition- Item number of purchase requisition

SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-002.

  SELECT-OPTIONS: s_ebeln   FOR ekko-ebeln NO INTERVALS, "Purchasing Document Header- Purchasing Document Number
                  s_matkl   FOR ekpo-matkl NO INTERVALS. "Purchasing Document Item- Material Group

SELECTION-SCREEN END OF BLOCK b1.

PARAMETERS: r_rad1 RADIOBUTTON GROUP g1,
            r_rad2 RADIOBUTTON GROUP g1.

DATA: go_custom TYPE REF TO cl_gui_custom_container,
      go_grid   TYPE REF TO cl_gui_alv_grid,
      gt_eban   TYPE TABLE OF zot_03_s_eban,
      gs_eban   TYPE zot_03_s_eban,
      gt_ekpo   TYPE TABLE OF zot_03_s_ekpo,
      gs_ekpo   TYPE zot_03_s_ekpo,
      gt_fcat   TYPE lvc_t_fcat,
      gs_fcat   TYPE lvc_s_fcat,
      gs_layout TYPE lvc_s_layo,
      gv_title  TYPE char50.


FIELD-SYMBOLS: <gfs_eban> TYPE zot_03_s_eban,
               <gfs_ekpo> TYPE zot_03_s_ekpo.
