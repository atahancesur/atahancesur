REPORT zot_03_p_compare.

* PARAMETERS: p_char type c.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p1 TYPE char6 OBLIGATORY,
              p2 TYPE char6 OBLIGATORY,
              p3 TYPE char6 OBLIGATORY,
              p4 TYPE char6 OBLIGATORY,
              p5 TYPE char6 OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

IF p1 CO p2 .     "CO komutu birbirinin icinde olup olmadigini bakiyor. Contains Only.
  WRITE: / p1 , p2.
ENDIF.

IF p1 CO p3.
  WRITE: / p1 , p3.
ENDIF.

IF p1 CO p4.
  WRITE: / p1 , p4.
ENDIF.

IF p1 CO p5.
  WRITE : / p1 , p5..
ENDIF.

IF p2 CO p3.
  WRITE : / p2 , p3.
ENDIF.

IF p2 CO p4.
  WRITE : / p2 , p4.
ENDIF.

IF p2 CO p5.
  WRITE : / p2 , p5.
ENDIF.

IF p3 CO p4.
  WRITE : / p3 , p4.
ENDIF.

IF p3 CO p5.
  WRITE : / p3 , p5.
ENDIF.

IF p4 CO p5.
  WRITE : / p4 , p5.
ENDIF.

IF p1 CN p2 AND p1 CN p3 AND p1 CN p4 AND p1 CN p5. "Contains Not Only; True if a logical expression with CO is false
  WRITE: / p1.
ENDIF.

IF p2 CN p1 AND p2 CN p3 AND p2 CN p4 AND p2 CN p5.
  WRITE: / p2.
ENDIF.

IF p3 CN p1 AND p3 CN p2 AND p3 CN p4 AND p3 CN p5.
  WRITE: / p3.
ENDIF.

IF p4 CN p1 AND p4 CN p2 AND p4 CN p3 AND p4 CN p5.
  WRITE: / p4.
ENDIF.

IF p5 CN p1 AND p5 CN p2 AND p5 CN p3 AND p5 CN p4.
  WRITE: / p5.
ENDIF.


*SEARCH sy-abcde FOR p1.
*
*IF p1 EQ p2.
*  WRITE: ''.
*ENDIF.
*
*IF  EQ 0.
*  WRITE: ''.
*ELSE.
*  WRITE: ''.
*ENDIF.


*DATA my_string TYPE string VALUE 'morning day evening day hello age day morning'.
*DATA itab TYPE TABLE OF string.
*
*DATA: BEGIN OF itab2 OCCURS 0,
*        words TYPE string,
*        count TYPE int4,
*      END OF itab2.
*
*REFRESH itab.
*SPLIT my_string AT space INTO TABLE itab.
*
*"Counting duplicated words
*REFRESH itab2.
*LOOP AT itab INTO DATA(ls_itab).
*  CLEAR itab2.
*  itab2-words = ls_itab.
*  itab2-count = 1.
*  COLLECT itab2.
*ENDLOOP.
*
*"Read or loop with itab2 with condition
*LOOP AT itab2 WHERE count > 1.
*  WRITE: / itab2-words, itab2-count.
*ENDLOOP.

*SEARCH sy-abcde FOR abder .
*
*IF abder EQ 0.
*  WRITE: 'Bulundu'.
*ELSE.
* WRITE: 'Bulunmadi'.
*ENDIF.
