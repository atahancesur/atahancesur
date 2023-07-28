MODULE user_command_0100 INPUT.

  CASE sy-ucomm. " tıklanan veya kullanılan herhangi bir ekran öğesinin işlev kodlarını içerecektir.
    WHEN '&BACK'.

      SET SCREEN 0.

    WHEN '&SAVE'.

      BREAK otacesur.

  ENDCASE.

ENDMODULE.
