OUTER_SET max_lvl = 30
OUTER_SET min_lvl = 11
OUTER_SET con_min = 2
OUTER_SET con_max = 24
OUTER_SET con_base = 10

OUTER_FOR (lvl = min_lvl; lvl <= max_lvl; lvl = lvl + 1) BEGIN
    OUTER_FOR (con = con_min; con <= con_max; con = con + 2) BEGIN
        //eff file
        COPY ~3ed/Feats/HighLvlConHp/HPAP.EFF~ ~override/HP%con%A%lvl%.EFF~
            SPRINT resource EVALUATE_BUFFER ~HP%con%A%lvl%~
            WRITE_EVALUATED_ASCII 0x0030 ~%resource%~ #8
        //initial ability applying eff every second
        COPY ~3ed/Feats/HighLvlConHp/HPAP.SPL~ ~override/HP%con%E%lvl%.SPL~
            SPRINT resource EVALUATE_BUFFER ~HP%con%A%lvl%~
            //LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 timing=0 duration = 1 STR_VAR resource END
            LPF ADD_SPELL_EFFECT INT_VAR opcode=272 target=2 timing=9 duration = 1 parameter1 = 1 parameter2 = 3 STR_VAR resource END      
            
        //bonus hp
        ACTION_IF (con < con_max) BEGIN
            COPY ~3ed/Feats/HighLvlConHp/HPBN.SPL~ ~override/HP%con%B%lvl%.SPL~
                SET new_con = con + 2
                SPRINT resource EVALUATE_BUFFER ~HP%con%E%lvl%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=0 duration = 1 STR_VAR resource END //remove effect application
                SPRINT resource EVALUATE_BUFFER ~HP%new_con%E%lvl%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 timing=0 duration = 1 STR_VAR resource END //add next value effect application
        END
        //minus hp
        ACTION_IF (con > con_min) BEGIN
            COPY ~3ed/Feats/HighLvlConHp/HPRM.SPL~ ~override/HP%con%R%lvl%.SPL~
                SET new_con = con - 2
                SPRINT resource EVALUATE_BUFFER ~HP%con%E%lvl%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=0 duration = 1 STR_VAR resource END //remove effect application
                SPRINT resource EVALUATE_BUFFER ~HP%new_con%E%lvl%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 timing=0 duration = 1 STR_VAR resource END //add next value effect application
        END
        
        //ability
        COPY ~3ed/Feats/HighLvlConHp/HPAP.SPL~ ~override/HP%con%A%lvl%.SPL~
            PATCH_IF (con < con_max) BEGIN
                SPRINT resource EVALUATE_BUFFER ~HP%con%B%lvl%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 timing=0 duration = 1 parameter1=con+2 parameter2=126 STR_VAR resource END // give hp
            END
            PATCH_IF (con > con_min) BEGIN
                SPRINT resource EVALUATE_BUFFER ~HP%con%R%lvl%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 timing=0 duration = 1 parameter1=con parameter2=127 STR_VAR resource END // remove hp
            END
            //SPRINT resource EVALUATE_BUFFER ~HP%con%A%lvl%~
            //LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=2 timing=0 duration = 1 STR_VAR resource END
    END
END

OUTER_SPRINT feat_name EVALUATE_BUFFER ~HP%con_base%E~

LAF ADD_FEATS_LVL INT_VAR min_level=min_lvl max_level=max_lvl d_level=1 feat_name_indexed = 1 feat_name_index_start = min_lvl
    STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
            feat_name caption=~HPCONE~ END





