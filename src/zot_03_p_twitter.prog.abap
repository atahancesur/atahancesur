REPORT zot_03_p_twitter.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE char60,
              p_val2 TYPE char60.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS: p_tw_at  RADIOBUTTON GROUP g1,
              p_tw_dgs RADIOBUTTON GROUP g1,
              p_tw_sil RADIOBUTTON GROUP g1,
              p_tw_gst RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b2.

DATA lt_main_modify TYPE TABLE OF zot_03_t_tweet.

START-OF-SELECTION.

  IF p_tw_at = abap_true.
    IF p_val1 IS INITIAL.
      cl_demo_output=>display( 'Tweet-ID girmelisiniz.' ).
    ELSEIF p_val2 IS INITIAL.
      cl_demo_output=>display( 'Tweet kısmı boş bırakılamaz.' ).
    ELSE.
      SELECT SINGLE COUNT( * )
       FROM zot_03_t_tweet
       WHERE tweet_id = p_val1.
      IF sy-subrc = 0.
        cl_demo_output=>display( 'Girdiğiniz Tweet ID zaten daha önceden oluşturulmuş. Varolan ID silinebilir ya da ilgili ID Tweet değiştirilebilir.' ).
      ELSE.
        APPEND VALUE #( tweet_id = p_val1
                      tweet = p_val2 ) TO lt_main_modify.
        MODIFY zot_03_t_tweet FROM TABLE lt_main_modify.
        cl_demo_output=>display( 'İşlem Başarılı!' ).
      ENDIF.
    ENDIF.

  ELSEIF p_tw_dgs = abap_true.
    IF p_val1 IS INITIAL.
      cl_demo_output=>display( 'Tweet ID giriniz!' ).
    ELSEIF p_val2 IS INITIAL.
      cl_demo_output=>display( 'Tweet kısmı bos birakilamaz.' ).
    ELSE.
      SELECT SINGLE COUNT( * )
         FROM zot_03_t_tweet
         WHERE tweet_id = p_val1.
      IF sy-subrc = 0.
        UPDATE zot_03_t_tweet SET tweet = p_val2
        WHERE tweet_id = p_val1.
        COMMIT WORK AND WAIT.
        cl_demo_output=>display( 'Isleminiz Basarili.' ).
      ELSE.
        cl_demo_output=>display( 'Girdiginiz IDye sahip bir Tweet bulunmamaktadır!' ).
      ENDIF.
    ENDIF.

  ELSEIF p_tw_sil = abap_true.
    IF p_val1 IS INITIAL.
      cl_demo_output=>display( 'Tweet ID giriniz!' ).
    ELSE.
      SELECT SINGLE COUNT( * )
         FROM zot_03_t_tweet
         WHERE tweet_id = p_val1.
      IF sy-subrc = 0.
        DELETE FROM zot_03_t_tweet WHERE tweet_id = p_val1.
        COMMIT WORK AND WAIT.
        cl_demo_output=>display( 'Isleminiz Basarili.' ).
      ELSE.
        cl_demo_output=>display( 'Girdiginiz IDye sahip bir Tweet bulunmamaktadır!' ).
      ENDIF.
    ENDIF.

  ELSE.
    SELECT tweet
    FROM zot_03_t_tweet
    INTO TABLE @DATA(abapitter).
    IF sy-subrc = 0.
      cl_demo_output=>display( abapitter ).
    ELSE.
      cl_demo_output=>display( 'Tabloda boyle bir veri bulunmamaktadır!' ).
    ENDIF.

  ENDIF.
