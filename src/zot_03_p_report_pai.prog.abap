MODULE user_command_0100 INPUT.

  CASE sy-ucomm.
    WHEN '&BACK'.

      SET SCREEN 0.

    WHEN '&SAVE'.

      BREAK otacesur.

  ENDCASE.

ENDMODULE.
