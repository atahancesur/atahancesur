FORM get_data .

  IF r_rad1 EQ abap_true.

    SELECT banfn, "Purchase requisition number
           bnfpo, "Item number of purchase requisition
           matkl, "Material Group
           matnr, "Material Number
           menge, "Quantity
           meins  "Base Unit of Measure

     FROM eban INTO TABLE @gt_eban WHERE banfn IN @s_banfn AND bnfpo IN @s_bnfpo.

  ELSEIF r_rad2 EQ abap_true.

*EKPO icin:

    SELECT ebeln, "Purchasing Document Number
           ebelp, "Item Number of Purchasing Document
           matkl, "Material Group
           matnr, "Material Number
           menge, "Quantity
           meins  "Base Unit of Measure
    FROM ekpo INTO TABLE @gt_ekpo WHERE ebeln IN @s_ebeln AND matkl IN @s_matkl.

  ENDIF.

  LOOP AT gt_eban ASSIGNING <gfs_eban>.

    IF <gfs_eban>-menge > 10.

      <gfs_eban>-line_color = 'C500'.

    ENDIF.

  ENDLOOP.

  LOOP AT gt_ekpo ASSIGNING <gfs_ekpo>.

    IF <gfs_ekpo>-menge > 10.

      <gfs_ekpo>-line_color = 'C500'.

    ENDIF.

  ENDLOOP.

ENDFORM.

FORM set_fcat .
  IF r_rad1 EQ abap_true.

    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_03_S_EBAN'
      CHANGING
        ct_fieldcat      = gt_fcat.

    IF sy-subrc <> 0.

    ENDIF.

    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_08_S_EKPO'
      CHANGING
        ct_fieldcat      = gt_fcat.
    IF sy-subrc <> 0.

    ENDIF.

  ENDIF.

ENDFORM.

FORM display_alv .

  CREATE OBJECT go_custom
    EXPORTING
      container_name = 'CC_ALV'.

  CREATE OBJECT go_grid
    EXPORTING
      i_parent = go_custom.

  IF r_rad1 EQ abap_true.

    CALL METHOD go_grid->set_table_for_first_display
      EXPORTING
        i_structure_name = 'ZOT_03_S_EBAN'
        is_layout        = gs_layout
      CHANGING
        it_outtab        = gt_eban
        it_fieldcatalog  = gt_fcat.

  ELSEIF r_rad2 EQ abap_true.

    CALL METHOD go_grid->set_table_for_first_display
      EXPORTING
        i_structure_name = 'ZOT_03_S_EKPO'
        is_layout        = gs_layout
      CHANGING
        it_outtab        = gt_ekpo
        it_fieldcatalog  = gt_fcat.

  ENDIF.

ENDFORM.

FORM set_layout .

  CLEAR: gs_layout.
  gs_layout-info_fname = 'LINE_COLOR'.

ENDFORM.
