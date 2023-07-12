*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_03_T_PERS...................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_PERS                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_PERS                 .
CONTROLS: TCTRL_ZOT_03_T_PERS
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZOT_03_T_P_ITUR.................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_P_ITUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_P_ITUR               .
CONTROLS: TCTRL_ZOT_03_T_P_ITUR
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *ZOT_03_T_PERS                 .
TABLES: *ZOT_03_T_P_ITUR               .
TABLES: ZOT_03_T_PERS                  .
TABLES: ZOT_03_T_P_ITUR                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
