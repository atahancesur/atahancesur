FORM display_alv .

  CREATE OBJECT go_cont
    EXPORTING
      container_name = 'CC_ALV'.

  CREATE OBJECT go_alv
    EXPORTING
      i_parent = go_cont.



  CALL METHOD go_alv->set_table_for_first_display
    EXPORTING
      i_buffer_active               = abap_true                 " Buffering Active
*      i_bypassing_buffer            =                  " Switch Off Buffer
*      i_consistency_check           =                  " Starting Consistency Check for Interface Error Recognition
*      i_structure_name              =                  " Internal Output Table Structure Name
*      is_variant                    =                  " Layout
*      i_save                        =                  " Save Layout
*      i_default                     = 'X'              " Default Display Variant
*      is_layout                     =                  " Layout
*      is_print                      =                  " Print Control
*      it_special_groups             =                  " Field Groups
*      it_toolbar_excluding          =                  " Excluded Toolbar Standard Functions
*      it_hyperlink                  =                  " Hyperlinks
*      it_alv_graphics               =                  " Table of Structure DTC_S_TC
*      it_except_qinfo               =                  " Table for Exception Quickinfo
*      ir_salv_adapter               =                  " Interface ALV Adapter
    CHANGING
      it_outtab                     =   gt_odev2               " Output Table
      it_fieldcatalog               =   gt_fcat                " Field Catalog
*      it_sort                       =                  " Sort Criteria
*      it_filter                     =                  " Filter Criteria
    EXCEPTIONS
      invalid_parameter_combination = 1                " Wrong Parameter
      program_error                 = 2                " Program Errors
      too_many_lines                = 3                " Too many Rows in Ready for Input Grid
      others                        = 4
    .
  IF SY-SUBRC <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*     WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.



ENDFORM.


FORM set_fcat .


     CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'ZOT_03_S_PERSONEL_ALV'
      CHANGING
        ct_fieldcat            = gt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
*  CLEAR: gs_fcat.
*  gs_fcat-cfieldname = 'personel_no'.
*  gs_fcat-scrtext_s = 'ID'.
*  gs_fcat-scrtext_m = 'ID'.
*  gs_fcat-scrtext_l = 'ID'.
*  gs_fcat-key = abap_true.
*  APPEND gs_fcat TO gt_fcat.
*
*  CLEAR: gs_fcat.
*  gs_fcat-cfieldname = 'adi'.
*  gs_fcat-scrtext_s = 'Ad Soyad'.
*  gs_fcat-scrtext_m = 'Adi Soyadi'.
*  gs_fcat-scrtext_l = 'Adi Soyadi'.
*  APPEND gs_fcat TO gt_fcat.
*
*  CLEAR: gs_fcat.
*  gs_fcat-cfieldname = 'cinsiyeti'.
*  gs_fcat-scrtext_s = 'Cinsiyet'.
*  gs_fcat-scrtext_m = 'Cinsiyet'.
*  gs_fcat-scrtext_l = 'Cinsiyet'.
*  APPEND gs_fcat TO gt_fcat.
*
*  CLEAR: gs_fcat.
*  gs_fcat-cfieldname = 'dogum_yeri'.
*  gs_fcat-scrtext_s = 'D.Yeri'.
*  gs_fcat-scrtext_m = 'Dogum Yeri'.
*  gs_fcat-scrtext_l = 'Dogum Yeri'.
*  APPEND gs_fcat TO gt_fcat.
*
*  CLEAR: gs_fcat.
*  gs_fcat-cfieldname = 'dogum_tarihi'.
*  gs_fcat-scrtext_s = 'D.Tarihi'.
*  gs_fcat-scrtext_m = 'Dogum Tarihi'.
*  gs_fcat-scrtext_l = 'Dogum Tarihi'.
*  APPEND gs_fcat TO gt_fcat.
*
*  CLEAR: gs_fcat.
*  gs_fcat-cfieldname = 'medeni_hali'.
*  gs_fcat-scrtext_s = 'M.Hali'.
*  gs_fcat-scrtext_m = 'Medeni Hali'.
*  gs_fcat-scrtext_l = 'Medeni Hali'.
*  APPEND gs_fcat TO gt_fcat.
*
*  CLEAR: gs_fcat.
*  gs_fcat-cfieldname = 'cocuk_sayisi'.
*  gs_fcat-scrtext_s = 'Cocuk S.'.
*  gs_fcat-scrtext_m = 'Cocuk Sayisi'.
*  gs_fcat-scrtext_l = 'Cocuk Sayisi'.
*  APPEND gs_fcat TO gt_fcat.
*
*  CLEAR: gs_fcat.
*  gs_fcat-cfieldname = 'uyruk'.
*  gs_fcat-scrtext_s = 'Uyruk'.
*  gs_fcat-scrtext_m = 'Uyruk'.
*  gs_fcat-scrtext_l = 'Uyruk'.
*  APPEND gs_fcat TO gt_fcat.

ENDFORM.
