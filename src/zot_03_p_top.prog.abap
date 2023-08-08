*&---------------------------------------------------------------------*
*& Include          ZOT_03_P_TOP
*&---------------------------------------------------------------------*

DATA: go_alv  TYPE REF TO cl_gui_alv_grid,
      go_cont TYPE REF TO cl_gui_custom_container.

DATA: gt_odev2 TYPE TABLE OF ZOT_03_S_PERSONEL_ALV,
      gt_fcat  TYPE lvc_t_fcat,
      gs_fcat  TYPE lvc_s_fcat.
