REPORT zot_03_p_nested.

DATA(lt_ogr) = VALUE zot_03_tt_ogr_not( ( ogr_id        = 1001
                                          ogr_ad        = 'Oner Ozturk'
                                          ogr_dt        = '24.11.2000'
                                          ogr_bolum     = 'Muhendislik'

                                          ogr_sinif = VALUE zot_03_s_sinif( sinif_1 = VALUE zot_03_s_ders( ders_1 = VALUE zot_03_s_not( vize_1 = '45'
                                                                                                                                        vize_2 = '35'
                                                                                                                                        final  = '20'
                                                                                                                                        btnlm  = '75' ) ) ) ) ).

cl_demo_output=>display( lt_ogr ).
