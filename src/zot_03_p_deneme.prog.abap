REPORT zot_03_p_deneme.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*DATA: BEGIN OF line,
*            text(6) TYPE c,
*            xtext TYPE xstring,
*          END OF line.
*
*    DATA itab LIKE HASHED TABLE OF line WITH UNIQUE KEY text.
*
*    DATA(out) = cl_demo_output=>new( ).
*
*    line-text = 'Muller'(001).
*    CONVERT TEXT line-text INTO SORTABLE CODE line-xtext.
*    INSERT line INTO TABLE itab.
*
*    line-text = 'Meller'(002).
*    CONVERT TEXT line-text INTO SORTABLE CODE line-xtext.
*    INSERT line INTO TABLE itab.
*
*    line-text = 'Moller'(003).
*    CONVERT TEXT line-text INTO SORTABLE CODE line-xtext.
*    INSERT line INTO TABLE itab.
*
*    line-text = 'Miller'(004).
*    CONVERT TEXT line-text INTO SORTABLE CODE line-xtext.
*    INSERT line INTO TABLE itab.
*
*    SORT itab.
*    out->write_data( itab ).
*
*    out->display( ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*PARAMETERS: p1 TYPE char6,
*            p2 TYPE char6,
*            p3 TYPE char6,
*            p4 TYPE char6,
*            p5 TYPE char6.
*
*TYPES: BEGIN OF line,
*         text(6) TYPE c,
*         xtext   TYPE xstring,
*       END OF line.
*
*DATA: itab TYPE TABLE OF line,
*      wa   TYPE line.  "work area
*
*DATA(out) = cl_demo_output=>new( ).
*
**line-text = ''(001).
*wa-text = p1.
*CONVERT TEXT p1 INTO SORTABLE CODE wa-xtext.
*INSERT wa INTO TABLE itab.
*
**line-text = 'Muller'(002).
*wa-text = p2.
*CONVERT TEXT p2 INTO SORTABLE CODE wa-xtext.
*INSERT wa INTO TABLE itab.
*
**line-text = 'Moller'(003).
*wa-text = p3.
*CONVERT TEXT p3 INTO SORTABLE CODE wa-xtext.
*INSERT wa INTO TABLE itab.
*
**line-text = 'Miller'(004).
*wa-text = p4.
*CONVERT TEXT p4 INTO SORTABLE CODE wa-xtext.
*INSERT wa INTO TABLE itab.
*
*wa-text = p5.
*CONVERT TEXT p5 INTO SORTABLE CODE wa-xtext.
*INSERT wa INTO TABLE itab.
*
*LOOP AT itab INTO wa.
*
*  READ TABLE itab INTO wa WITH KEY xtext = wa-xtext.
*
*  cl_demo_output=>display( wa ).
*
*ENDLOOP.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*IF wa-xtext = wa-xtext .
*  WRITE : p1 && '='  && p2.
*ENDIF.

*IF p1 = p3.
*  WRITE : p1 && '='  && p3.
*ENDIF.
*
*IF p1 = p4.
*  WRITE : p1 && '='  && p4.
*ENDIF.
*
*IF p1 = p5.
*  WRITE : p1 && '='  && p5.
*ENDIF.
*
*IF p2 = p3.
*  WRITE : p2 && '='  && p3.
*ENDIF.
*
*IF p2 = p4.
*  WRITE : p2 && '='  && p4.
*ENDIF.
*
*IF p2 = p5.
*  WRITE : p2 && '='  && p5.
*ENDIF.
*
*IF p3 = p4.
*  WRITE : p3 && '='  && p4.
*ENDIF.
*
*IF p3 = p5.
*  WRITE : p3 && '='  && p5.
*ENDIF.
*
*IF p4 = p5.
*  WRITE : p4 && '='  && p5.
*ENDIF.

*cl_demo_output=>display( itab ).

*
*SORT itab.
*out->write_data( itab ).
*
*SORT itab BY xtext.
*out->write_data( itab ).

*SORT itab AS TEXT.
*out->write_data( itab ).

*LOOP AT itab INTO wa.

*ENDLOOP.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

DATA: class_convert TYPE REF TO cl_abap_conv_in_ce,
      ascii        TYPE x,
      char(10)  TYPE c.

ascii = '41'. "hurfu A

class_convert = cl_abap_conv_in_ce=>create( encoding = 'UTF-8' ).

class_convert->convert( EXPORTING input = ascii
                        IMPORTING data  = char ).

WRITE: / char.
