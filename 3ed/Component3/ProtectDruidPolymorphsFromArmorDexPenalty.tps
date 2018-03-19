COPY_EXISTING_REGEXP GLOB ~WP_+.*\.itm~ ~override~ 
	LPF ADD_ITEM_EQEFFECT INT_VAR  opcode = 206 target = 1  power = 0  parameter1 = 0   parameter2 = 0  duration=1  timing = 2  resist_dispel = 0   probability1 = 100  probability2 = 0  STR_VAR  resource = ~ARMDEX10~  END
	LPF ADD_ITEM_EQEFFECT INT_VAR  opcode = 206 target = 1  power = 0  parameter1 = 0   parameter2 = 0  duration=1  timing = 2  resist_dispel = 0   probability1 = 100  probability2 = 0  STR_VAR  resource = ~ARMDEX12~  END
	LPF ADD_ITEM_EQEFFECT INT_VAR  opcode = 206 target = 1  power = 0  parameter1 = 0   parameter2 = 0  duration=1  timing = 2  resist_dispel = 0   probability1 = 100  probability2 = 0  STR_VAR  resource = ~ARMDEX14~  END
	LPF ADD_ITEM_EQEFFECT INT_VAR  opcode = 206 target = 1  power = 0  parameter1 = 0   parameter2 = 0  duration=1  timing = 2  resist_dispel = 0   probability1 = 100  probability2 = 0  STR_VAR  resource = ~ARMDEX16~  END
	LPF ADD_ITEM_EQEFFECT INT_VAR  opcode = 206 target = 1  power = 0  parameter1 = 0   parameter2 = 0  duration=1  timing = 2  resist_dispel = 0   probability1 = 100  probability2 = 0  STR_VAR  resource = ~ARMDEX18~  END
	LPF ADD_ITEM_EQEFFECT INT_VAR  opcode = 206 target = 1  power = 0  parameter1 = 0   parameter2 = 0  duration=1  timing = 2  resist_dispel = 0   probability1 = 100  probability2 = 0  STR_VAR  resource = ~ARMDEX20~  END
    
    //remove additional attacks (if necessary)
    LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 1 RET found = found_match END
    
    PATCH_IF (found) BEGIN
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 321 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONA~ END
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 206 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONA~ END 
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 321 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONB~ END
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 206 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONB~ END 
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 321 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONC~ END
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 206 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONC~ END 
        LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 1 parameter2 = 1 END  //set attack to value (instead of final set)
    END
