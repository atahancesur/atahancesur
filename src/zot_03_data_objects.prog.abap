REPORT ZOT_03_DATA_OBJECTS.

*DATA: GV_OGRENCI_ADI(6) TYPE C,         "predefined
*      GV_OGRENCI_SOYADI TYPE CHAR12,    "data element
*      GV_TARIH          TYPE SY-DATUM.  "sistem tarihi
*
*GV_OGRENCI_ADI    = 'Atahan'.
*GV_OGRENCI_SOYADI = 'Cesur'.
*GV_TARIH          = SY-DATUM.
*
*CL_DEMO_OUTPUT=>WRITE( GV_OGRENCI_ADI ).
*CL_DEMO_OUTPUT=>WRITE( GV_OGRENCI_SOYADI ).
*CL_DEMO_OUTPUT=>WRITE( GV_TARIH ).
*
*TYPES: GTY_CHAR TYPE C LENGTH 50.
*DATA: GV_NW TYPE GTY_CHAR.
*
*DATA: GV_LANGU TYPE SY-LANGU.
*GV_LANGU = SY-LANGU.
*
*IF GV_LANGU = 'T'.
*  CL_DEMO_OUTPUT=>WRITE( |Merhaba Dunya| ).
*ELSEIF GV_LANGU EQ 'E'.
*  CL_DEMO_OUTPUT=>WRITE( |Hello World| ).
*ELSE.
*  CL_DEMO_OUTPUT=>WRITE( |Dil bilmiyorum| ).
*ENDIF.
*
*CASE GV_LANGU.
*  WHEN 'E'.
*    CL_DEMO_OUTPUT=>WRITE( |Hello World| ).
*  WHEN 'T'.
*    CL_DEMO_OUTPUT=>WRITE( |Merhaba Dunya| ).
*  WHEN OTHERS.
*    CL_DEMO_OUTPUT=>WRITE( |Dil bilmiyorum| ).
*ENDCASE.
*
*DATA: GV_TEXT1 TYPE CHAR12.
*GV_TEXT1 = 'Hello World'.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*DATA: LV_NUMBER1 TYPE I VALUE 10,
*      LV_NUMBER2 TYPE I VALUE 5.
*
*DATA(LV_TOPLAMA) = LV_NUMBER1 + LV_NUMBER2.
*DATA(LV_CIKARMA) = LV_NUMBER1 - LV_NUMBER2.
*DATA(LV_CARPMA)  = LV_NUMBER1 * LV_NUMBER2.
*DATA(LV_BOLME)   = LV_NUMBER1 / LV_NUMBER2.
*
*CL_DEMO_OUTPUT=>WRITE( |{ LV_NUMBER1 } + { LV_NUMBER2 } = { LV_TOPLAMA } | ).
*CL_DEMO_OUTPUT=>WRITE( |{ LV_NUMBER1 } - { LV_NUMBER2 } = { LV_CIKARMA } | ).
*CL_DEMO_OUTPUT=>WRITE( |{ LV_NUMBER1 } * { LV_NUMBER2 } = { LV_CARPMA } | ).
*CL_DEMO_OUTPUT=>WRITE( |{ LV_NUMBER1 } / { LV_NUMBER2 } = { LV_BOLME } | ).
*
*CL_DEMO_OUTPUT=>WRITE( |Clear isleminden once lv_bolme'nin degeri: { LV_BOLME } | ).
*CLEAR LV_BOLME.
*CL_DEMO_OUTPUT=>WRITE( |Clear isleminden sonra lv_bolme'nin degeri: { LV_BOLME } | ).
*
*LV_NUMBER2 = 0.
*
*TRY.
*    LV_BOLME  = LV_NUMBER1 / LV_NUMBER2.
*  CATCH CX_SY_ZERODIVIDE.
*    CL_DEMO_OUTPUT=>WRITE( |Sifira bolme islemi yapilamaz| ).
*  CATCH CX_SY_ARITHMETIC_OVERFLOW.
*    CL_DEMO_OUTPUT=>WRITE( |Aritmetik overflow| ).
*ENDTRY.
*
*CL_DEMO_OUTPUT=>DISPLAY(  ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*DATA: LV_NUMBER1 TYPE I VALUE 10,
*      LV_NUMBER2 TYPE I VALUE 5,
*      LV_OP      TYPE C VALUE '+',
*      LV_RESULT  TYPE I.
*
*CALL FUNCTION 'ZOT_03_DO_MATH_OPS'
*  EXPORTING
*    IV_NUMBER1       = LV_NUMBER1
*    IV_NUMBER2       = LV_NUMBER2
*    IV_OPERATION     = LV_OP
*  IMPORTING
*    EV_RESULT        = LV_RESULT.
**  EXCEPTIONS
**    CX_SY_ZERODIVIDE = 1.
*
*CL_DEMO_OUTPUT=>WRITE( |{ lv_number1 } + { lv_number2 } = { lv_result }| ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*DATA(LO_MATH_OPS) = NEW ZCL_OT_03_MATH_OPS(  ).
*
*LO_MATH_OPS->CALCULATE_RESULT(
*EXPORTING
*IV_NUMBER1 = LV_NUMBER1
*IV_NUMBER2 = LV_NUMBER2
*IV_OPERATION = LV_OP
*IMPORTING
*EV_RESULT = DATA(LV_RESULT)
*),
*
*CL_DEMO_OUTPUT=>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*TYPES: GTY_TIP TYPE C LENGTH 12.
*
*TYPES: BEGIN OF GTY_KOMPLEX,
*         ALAN1 TYPE C LENGTH 10,
*         ALAN2 TYPE C LENGTH 12,
*         ALAN3 TYPE I,
*       END OF GTY_KOMPLEX.
*
*TYPES: BEGIN OF GTY_STUDENT,
*         NAME  TYPE C LENGTH 10,
*         AGE   TYPE I,
*         ID    TYPE C LENGTH 10,
*         BOLUM TYPE C LENGTH 20,
*       END OF GTY_STUDENT.
*
*DATA: GV_ALAN1   TYPE GTY_TIP,
*      GS_KOMPLEX TYPE GTY_KOMPLEX,
*      GV_ALAN2   TYPE GTY_KOMPLEX-ALAN2,
*      GT_KOMPLEX TYPE TABLE OF GTY_KOMPLEX.
*
*GV_ALAN1 = 'Hello World'.
*
*GS_KOMPLEX-ALAN1 = 'One'.
*GS_KOMPLEX-ALAN2 = 'Talent'.
*GS_KOMPLEX-ALAN3 = 23.
*
*GT_KOMPLEX = VALUE #( ( ALAN1 = 'Atahan'
*                        ALAN2 = 'Cesur'
*                        ALAN3 = 01  )
*
*                       ( ALAN1 = 'Berkan'
*                        ALAN2 = 'Deniz'
*                        ALAN3 = 02 )
*
*                       ( ALAN1 = 'Ceyhun'
*                        ALAN2 = 'Eflatun'
*                        ALAN3 = 03 ) ).
*
*APPEND VALUE #( ALAN1 = 'Deniz'
*                ALAN2 = `Fatsa`
*                ALAN3 = 04 ) TO GT_KOMPLEX.
*
*APPEND VALUE #( ALAN1 = 'Fatma'
*                ALAN2 = `Goz`
*                ALAN3 = 05 ) TO GT_KOMPLEX.
*
*APPEND GS_KOMPLEX TO GT_KOMPLEX.
*
*CLEAR gs_komplex.
*
*GS_KOMPLEX-ALAN1 = 'Eyyup'.
*GS_KOMPLEX-ALAN2 = 'Kaya'.
*GS_KOMPLEX-ALAN3 = 06.
*APPEND GS_KOMPLEX TO GT_KOMPLEX.
*CLEAR gs_komplex.
*
*
*CL_DEMO_OUTPUT=>WRITE( gt_komplex ).
*
*
*CL_DEMO_OUTPUT=>DISPLAY(  ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
    PARAMETERS: p_val1 TYPE i,
                p_val2 TYPE i.
SELECTION-SCREEN END OF BLOCK b1.


SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-002.


PARAMETERS: p_topla RADIOBUTTON GROUP g1,
            p_cikar RADIOBUTTON GROUP g1,
            p_carp RADIOBUTTON GROUP g1,
            p_bol RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b2.

DATA: p_sonuc TYPE c,
      flag TYPE int1 VALUE 0.

INITIALIZATION.
    p_topla = 'Topla'.
    p_cikar = 'Cikart'.
    p_carp = 'Carp'.
    p_bol = 'Bol'.


AT SELECTION-SCREEN.
    CASE sy-ucomm.
        WHEN 'Topla'.
            flag = 1.
            p_sonuc = p_val1 + p_val2.
        WHEN 'Cikart'.
            flag = 1.
            p_sonuc = p_val1 - p_val2.
        WHEN 'Bol'.
            IF ( p_val2 <> 0 ).
            flag = 1.
            p_sonuc = p_val1 / p_val2.
        ELSE.
            flag = 2.
        ENDIF.
        WHEN 'Carp'.
            flag = 1.
            p_sonuc = p_val1 * p_val2.
     ENDCASE.

START-OF-SELECTION.
   IF p_val1 IS NOT INITIAL OR p_val2 IS NOT INITIAL.

     IF flag = 1.
       WRITE: p_sonuc.
     ELSEIF flag = 2.
       WRITE: 'Sayiyi sifir ile bolemezsin'.
     ELSEIF flag = 0.
       MESSAGE 'Istedginiz islem icin herhangi bir butona tiklayin!' TYPE 'I'.
     ENDIF.
   ELSE.
     MESSAGE 'Hesaplamak icin iki adet girdi yazin!' TYPE 'I'.
   ENDIF.
END-OF-SELECTION.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
