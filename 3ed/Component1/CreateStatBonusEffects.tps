
ACTION_DEFINE_ASSOCIATIVE_ARRAY stat_opcode BEGIN
    ~STR~ => 44
    ~INT~ => 19
    ~CHA~ => 6
    ~CON~ => 10
    ~DEX~ => 15
    ~WIS~ => 49
END

ACTION_PHP_EACH stat_opcode AS stat => code BEGIN
    OUTER_FOR (i = 1; i<=8; i = i+1) BEGIN
        //spell gives + bonus removes all lower effects and protects from lower effects and itself
        COPY ~3ed/StatBonuses/TEMPLATE.SPL~ ~override/ABB%stat%%i%.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 44 new_opcode = code parameter1 = i timing = 9 duration = 2 END
            FOR (j = 1; j < i; j = j+1) BEGIN
                SPRINT resource EVALUATE_BUFFER ~ABB%stat%%j%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 2 duration = 1 timing = 9 insert_point = 0 STR_VAR resource END 
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 2 duration = 1 insert_point = 0 STR_VAR resource END                  
            END
            SPRINT resource EVALUATE_BUFFER ~ABB%stat%%i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 2 duration = 1 insert_point = 0 STR_VAR resource END
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 2 duration = 1 timing = 9 STR_VAR resource END
            
        COPY ~3ed/StatBonuses/TEMPLATE.SPL~ ~override/ABR%stat%%i%.SPL~
            SPRINT resource EVALUATE_BUFFER ~ABB%stat%%i%~ //effect removal
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 44 new_opcode = 321 parameter1 = 0 parameter2 = 0 timing = 0 duration = 1 
                                   STR_VAR resource END

        COPY ~3ed/StatBonuses/TEMPLATE.SPL~ ~override/ABN%stat%%i%.SPL~ 
            //protect from efffect removal for 1 second
            SPRINT resource EVALUATE_BUFFER ~ABR%stat%%i%~ 
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 44 new_opcode = 206 parameter1 = 0 parameter2 = 0 timing = 0 duration = 1 
                                   STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~ABB%stat%%i%~ //apply bonus (will be done only once due to prot)
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 326 target = 2 duration = 1  STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~ABR%stat%%i%~ //remove 1 second later (will fail as long as eff works)
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 326 target = 2 duration = 1  timing = 3 STR_VAR resource END
            
        COPY ~3ed/StatBonuses/TEMPLATE.EFF~ ~override/ABN%stat%%i%.EFF~
            SPRINT resource EVALUATE_BUFFER ~ABN%stat%%i%~ //effect removal
            LPF ALTER_EFF STR_VAR resource END
    END
END

   
    
    
    


