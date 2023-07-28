REPORT zot_03_p_flight.

DATA : gs_outputparams TYPE  sfpoutputparams,
       gv_name         TYPE fpname,
       gv_funcname     TYPE  funcname,
       gs_sfpdocarams  TYPE  sfpdocparams,
       gs_formoutput   TYPE  fpformoutput.



*SELECTION-SCREEN BEGIN OF BLOCK blk1 WITH FRAME TITLE text-000 NO INTERVALS.
*
*    PARAMETERS :     p_bcode TYPE char10 OBLIGATORY.
*
*  SELECTION-SCREEN END OF BLOCK blk1.



START-OF-SELECTION.

gs_outputparams-nodialog = abap_on.
gs_outputparams-preview = abap_on.
gs_outputparams-dest = 'LP01'.

CALL FUNCTION 'FP_JOB_OPEN'
  CHANGING
    ie_outputparams = gs_outputparams
  EXCEPTIONS
    cancel          = 1
    usage_error     = 2
    system_error    = 3
    internal_error  = 4
    OTHERS          = 5.



gv_name = 'ZOT_03_AF_FLIGHT'.

CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
  EXPORTING
    i_name     = gv_name
  IMPORTING
    e_funcname = gv_funcname.

CALL FUNCTION gv_funcname
  EXPORTING
    /1bcdwb/docparams = gs_sfpdocarams
*   p_bcode                  =    p_bcode
  IMPORTING
   /1BCDWB/FORMOUTPUT       = gs_formoutput
  EXCEPTIONS
    usage_error       = 1
    system_error      = 2
    internal_error    = 3
    OTHERS            = 4.

CALL FUNCTION 'FP_JOB_CLOSE'
   EXCEPTIONS
     usage_error          = 1
     system_error         = 2
     internal_error       = 3
     OTHERS               = 4.
