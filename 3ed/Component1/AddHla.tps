

	COPY ~3ed/Classes/Epic~ ~override~
        LPF ADD_FEATS_2DA   STR_VAR clab=~CLABFI01\.2DA~ caption=~FTR_EP~ 2DA_file = ~FTR_EPIC~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCREF.SPL~  END
        LPF ADD_FEATS_2DA   STR_VAR clab=~CLABFI01\.2DA~ caption=~F_M_EP~ 2DA_file = ~F_M_EPIC~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCREFM.SPL~  END
        LPF ADD_FEATS_2DA   STR_VAR clab=~\(\(CLABTH01\)\|\(CLABTH02\)\|\(CLABTH03\)\|\(CLABTH04\)\)\.2DA~ caption=~THF_EP~ 2DA_file = ~THF_EPIC~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCRET.SPL~  END
        LPF ADD_FEATS_2DA   STR_VAR clab=~CLABMA.+\.2DA~ caption=~WIZ_EP~ 2DA_file = ~WIZ_EPIC~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCREW.SPL~  END
        LPF ADD_FEATS_2DA   STR_VAR clab=~\(\(CLABPR.+\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ caption=~CLR_EP~ 2DA_file = ~CLR_EPIC~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCREC.SPL~  END
        LPF ADD_FEATS_2DA   STR_VAR clab=~\(CLABDR.+\)\.2DA~ caption=~DRD_EP~ 2DA_file = ~DRD_EPIC~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCRED.SPL~  END
        LPF ADD_FEATS_2DA   STR_VAR clab=~CLABSH.+\.2DA~ caption=~SHM_EP~ 2DA_file = ~SHM_EPIC~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCRESH.SPL~  END
                                    