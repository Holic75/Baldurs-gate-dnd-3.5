

OUTER_SET max_lvl = 30
OUTER_SET min_bonus_val = 0 - 4
OUTER_SPRINT clab_line ~CHPFIX    ****    ****    ****    ****    ****    ****    ****    ****     ****    ****~
OUTER_FOR (i = 11; i<=max_lvl; i = i + 1) BEGIN
    MKDIR ~3ed/Feats/PersistentAbilities/StatExclusiveProgressiveBonus/CHP%i%~
    COPY ~3ed/Feats/PersistentAbilities/StatExclusiveProgressiveBonus/CHP/CHP.SPL~ ~3ed/Feats/PersistentAbilities/StatExclusiveProgressiveBonus/CHP%i%/CHP%i%.SPL~ 
    OUTER_SPRINT ability_name EVALUATE_BUFFER ~CHP%i%~
    LAF ADD_PSEPB_FEAT INT_VAR min_val=2 max_val=25 step=2 abi_g=132 min_bonus_val bonus_step = 1 STR_VAR ability_name END
    OUTER_SPRINT clab_line EVALUATE_BUFFER ~%clab_line%    AP_CHP%i%FT~
    DELETE ~3ed/Feats/PersistentAbilities/StatExclusiveProgressiveBonus/CHP%i%~
END

COPY_EXISTING_REGEXP GLOB ~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ ~override~
    COUNT_2DA_ROWS 20 "nrows"
    COUNT_2DA_COLS "ncols"   
    INSERT_2DA_ROW nrows 20 ~%clab_line%~




