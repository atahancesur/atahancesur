*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_03_T_PERS...................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_PERS                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_PERS                 .
CONTROLS: TCTRL_ZOT_03_T_PERS
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZOT_03_T_P_AILE.................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_P_AILE               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_P_AILE               .
CONTROLS: TCTRL_ZOT_03_T_P_AILE
            TYPE TABLEVIEW USING SCREEN '0005'.
*...processing: ZOT_03_T_P_ATUR.................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_P_ATUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_P_ATUR               .
CONTROLS: TCTRL_ZOT_03_T_P_ATUR
            TYPE TABLEVIEW USING SCREEN '0007'.
*...processing: ZOT_03_T_P_EGTM.................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_P_EGTM               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_P_EGTM               .
CONTROLS: TCTRL_ZOT_03_T_P_EGTM
            TYPE TABLEVIEW USING SCREEN '0006'.
*...processing: ZOT_03_T_P_ETUR.................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_P_ETUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_P_ETUR               .
CONTROLS: TCTRL_ZOT_03_T_P_ETUR
            TYPE TABLEVIEW USING SCREEN '0008'.
*...processing: ZOT_03_T_P_ILTSM................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_P_ILTSM              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_P_ILTSM              .
CONTROLS: TCTRL_ZOT_03_T_P_ILTSM
            TYPE TABLEVIEW USING SCREEN '0004'.
*...processing: ZOT_03_T_P_ITUR.................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_P_ITUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_P_ITUR               .
CONTROLS: TCTRL_ZOT_03_T_P_ITUR
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZOT_03_T_P_MAST.................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_P_MAST               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_P_MAST               .
CONTROLS: TCTRL_ZOT_03_T_P_MAST
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: ZOT_03_T_UNVAN..................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_UNVAN                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_UNVAN                .
CONTROLS: TCTRL_ZOT_03_T_UNVAN
            TYPE TABLEVIEW USING SCREEN '0009'.
*...processing: ZOT_03_T_URUN...................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_URUN                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_URUN                 .
CONTROLS: TCTRL_ZOT_03_T_URUN
            TYPE TABLEVIEW USING SCREEN '0011'.
*...processing: ZOT_03_T_URUNADI................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_URUNADI              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_URUNADI              .
CONTROLS: TCTRL_ZOT_03_T_URUNADI
            TYPE TABLEVIEW USING SCREEN '0012'.
*...processing: ZOT_03_T_ZMN....................................*
DATA:  BEGIN OF STATUS_ZOT_03_T_ZMN                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_03_T_ZMN                  .
CONTROLS: TCTRL_ZOT_03_T_ZMN
            TYPE TABLEVIEW USING SCREEN '0010'.
*.........table declarations:.................................*
TABLES: *ZOT_03_T_PERS                 .
TABLES: *ZOT_03_T_P_AILE               .
TABLES: *ZOT_03_T_P_ATUR               .
TABLES: *ZOT_03_T_P_EGTM               .
TABLES: *ZOT_03_T_P_ETUR               .
TABLES: *ZOT_03_T_P_ILTSM              .
TABLES: *ZOT_03_T_P_ITUR               .
TABLES: *ZOT_03_T_P_MAST               .
TABLES: *ZOT_03_T_UNVAN                .
TABLES: *ZOT_03_T_URUN                 .
TABLES: *ZOT_03_T_URUNADI              .
TABLES: *ZOT_03_T_ZMN                  .
TABLES: ZOT_03_T_PERS                  .
TABLES: ZOT_03_T_P_AILE                .
TABLES: ZOT_03_T_P_ATUR                .
TABLES: ZOT_03_T_P_EGTM                .
TABLES: ZOT_03_T_P_ETUR                .
TABLES: ZOT_03_T_P_ILTSM               .
TABLES: ZOT_03_T_P_ITUR                .
TABLES: ZOT_03_T_P_MAST                .
TABLES: ZOT_03_T_UNVAN                 .
TABLES: ZOT_03_T_URUN                  .
TABLES: ZOT_03_T_URUNADI               .
TABLES: ZOT_03_T_ZMN                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
