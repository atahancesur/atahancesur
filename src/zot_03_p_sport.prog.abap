REPORT zot_03_p_sport.

TYPES: BEGIN OF gty_grup1,
         takim_id TYPE i,
         takim    TYPE char20,
         ulke     TYPE char2,
       END OF gty_grup1.

TYPES: BEGIN OF gty_grup2,
         takim_id TYPE i,
         takim    TYPE char20,
         ulke     TYPE char2,
       END OF gty_grup2.

TYPES: BEGIN OF gty_grup3,
         takim_id TYPE i,
         takim    TYPE char20,
         ulke     TYPE char2,
       END OF gty_grup3.

TYPES: BEGIN OF gty_grup4,
         takim_id TYPE i,
         takim    TYPE char20,
         ulke     TYPE char2,
       END OF gty_grup4.

TYPES: BEGIN OF gty_coll,
         takim_id TYPE i,
         takim    TYPE char20,
         ulke     TYPE char2,
       END OF gty_coll.

TYPES: BEGIN OF gty_main,
         takim1 TYPE char20,
         ulke1  TYPE char2,
         takim2 TYPE char20,
         ulke2  TYPE char2,
         takim3 TYPE char20,
         ulke3  TYPE char2,
         takim4 TYPE char20,
         ulke4  TYPE char2,
       END OF gty_main.

DATA: gt_grup1 TYPE TABLE OF gty_grup1,
      gs_grup1 TYPE gty_grup1,
      gt_grup2 TYPE TABLE OF gty_grup2,
      gs_grup2 TYPE gty_grup2,
      gt_grup3 TYPE TABLE OF gty_grup3,
      gs_grup3 TYPE gty_grup3,
      gt_grup4 TYPE TABLE OF gty_grup4,
      gs_grup4 TYPE gty_grup4,
      gt_coll  TYPE TABLE OF gty_coll,
      gs_coll  TYPE gty_coll,
      gt_main  TYPE TABLE OF gty_main,
      gs_main  TYPE gty_main,
      gv_max   TYPE qfranint,
      gv_min   TYPE qfranint.

START-OF-SELECTION.

gv_max = 4.
gv_min = 1.

gs_grup1-takim_id = 1.
gs_grup1-takim    = 'Liverpool'.
gs_grup1-ulke     = 'EN'.
APPEND gs_grup1 TO gt_grup1.

gs_grup1-takim_id = 2.
gs_grup1-takim    = 'Bayern Münih'.
gs_grup1-ulke     = 'DE'.
APPEND gs_grup1 TO gt_grup1.

gs_grup1-takim_id = 3.
gs_grup1-takim    = 'İnter'.
gs_grup1-ulke     = 'IT'.
APPEND gs_grup1 TO gt_grup1.

gs_grup1-takim_id = 4.
gs_grup1-takim    = 'PSG'.
gs_grup1-ulke     = 'FR'.
APPEND gs_grup1 TO gt_grup1.

gs_grup2-takim_id = 1.
gs_grup2-takim    = 'Manchester City'.
gs_grup2-ulke     = 'EN'.
APPEND gs_grup2 TO gt_grup2.

gs_grup2-takim_id = 2.
gs_grup2-takim    = 'PSV'.
gs_grup2-ulke     = 'NE'.
APPEND gs_grup2 TO gt_grup2.


gs_grup2-takim_id = 3.
gs_grup2-takim    = 'Port'.
gs_grup2-ulke     = 'PO'.
APPEND gs_grup2 TO gt_grup2.

gs_grup2-takim_id = 4.
gs_grup2-takim    = 'Real Madrid'.
gs_grup2-ulke     = 'Es'.
APPEND gs_grup2 TO gt_grup2.

gs_grup3-takim_id = 1.
gs_grup3-takim    = 'Dortmund'.
gs_grup3-ulke     = 'DE'.
APPEND gs_grup3 TO gt_grup3.

gs_grup3-takim_id = 2.
gs_grup3-takim    = 'Galatasaray'.
gs_grup3-ulke     = 'TR'.
APPEND gs_grup3 TO gt_grup3.

gs_grup3-takim_id = 3.
gs_grup3-takim    = 'Marsilia'.
gs_grup3-ulke     = 'FR'.
APPEND gs_grup3 TO gt_grup3.

gs_grup3-takim_id = 4.
gs_grup3-takim    = 'Ajax'.
gs_grup3-ulke     = 'NE'.
APPEND gs_grup3 TO gt_grup3.

gs_grup4-takim_id = 1.
gs_grup4-takim    = 'AEK'.
gs_grup4-ulke     = 'GR'.
APPEND gs_grup4 TO gt_grup4.

gs_grup4-takim_id = 2.
gs_grup4-takim    = 'Roma'.
gs_grup4-ulke     = 'IT'.
APPEND gs_grup4 TO gt_grup4.

gs_grup4-takim_id = 3.
gs_grup4-takim    = 'STA Bükreş'.
gs_grup4-ulke     = 'RO'.
APPEND gs_grup4 TO gt_grup4.

gs_grup4-takim_id = 4.
gs_grup4-takim    = 'Atletico Madrid'.
gs_grup4-ulke     = 'ES'.
APPEND gs_grup4 TO gt_grup4.

APPEND LINES OF gt_grup1 TO gt_coll.
APPEND LINES OF gt_grup2 TO gt_coll.
APPEND LINES OF gt_grup3 TO gt_coll.
APPEND LINES OF gt_grup4 TO gt_coll.

BREAK ottozturk.

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
      EXPORTING
        ran_int_max = gv_max
        ran_int_min = gv_min.
