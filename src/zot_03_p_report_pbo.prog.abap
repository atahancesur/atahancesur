MODULE status_0100 OUTPUT.
  SET PF-STATUS '0100'.

  CONCATENATE sy-repid sy-uname sy-cdate sy-uzeit INTO gv_title SEPARATED BY space.  "raporun ismi, raporu ceken kullanicinin adi, rapor tarihi ve rapor saati

  SET TITLEBAR 'GV_TITLE'.

  PERFORM display_alv.

ENDMODULE.
