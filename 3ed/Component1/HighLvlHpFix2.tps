OUTER_SET max_lvl = 30
OUTER_SET min_lvl = 11
OUTER_SET con_min = 2
OUTER_SET con_max = 24
OUTER_SET con_base = 10

OUTER_FOR (lvl = min_lvl; lvl <= max_lvl; lvl = lvl + 1) BEGIN
    COPY ~3ed/Feats/HighLvlConHp/HPAP.EFF~ ~override/HPAP%lvl%.EFF~
        SPRINT resource EVALUATE_BUFFER ~HPAP%lvl%~
        WRITE_EVALUATED_ASCII 0x0030 ~%resource%~ #8
        
    COPY ~3ed/Feats/HighLvlConHp/HPAP.SPL~ ~override/HPEF%lvl%.SPL~
        SPRINT resource EVALUATE_BUFFER ~HPAP%lvl%~
        LPF ADD_SPELL_EFFECT INT_VAR opcode=272 target=2 timing=9 duration = 1 parameter1 = 1 parameter2 = 3 STR_VAR resource END 
            
    COPY ~3ed/Feats/HighLvlConHp/HPAP.SPL~ ~override/HPAP%lvl%.SPL~    
        FOR (con = con_min; con <= con_max; con = con + 2) BEGIN
            SPRINT resource EVALUATE_BUFFER ~HP%con%A%lvl%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 timing=0 duration = 1 parameter1 = con parameter2=126 STR_VAR resource END
        END
        
    OUTER_FOR (con = con_min; con <= con_max; con = con + 2) BEGIN
        COPY ~3ed/Feats/HighLvlConHp/HPAP.SPL~ ~override/HP%con%A%lvl%.SPL~
            FOR (con2 = con_min; con2 <= con_max; con2 = con2 + 2) BEGIN
                SPRINT resource EVALUATE_BUFFER ~HP%con2%A%lvl%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=0 duration = 1 STR_VAR resource END
            END
            SET hp_bonus = (con - con_base)/2
            //PATCH_IF con < con_base BEGIN
            //    SET hp_bonus = (con - (con_base + 1))/2
            //END
            SPRINT resource EVALUATE_BUFFER ~HP%con%A%lvl%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode=318 target=2 timing=0 duration = 1 parameter1 = con+2 parameter2=126 STR_VAR resource END
            LPF ADD_SPELL_EFFECT INT_VAR opcode=18 target=2 timing=0 duration = 5 parameter1 = hp_bonus END
    END
END
            
            
         
OUTER_SPRINT feat_name EVALUATE_BUFFER ~HPEF~

LAF ADD_FEATS_LVL INT_VAR min_level=min_lvl max_level=max_lvl d_level=1 feat_name_indexed = 1 feat_name_index_start = min_lvl
    STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
            feat_name caption=~HPCONE~ END





