
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
        COPY ~3ed/StatBonuses/TEMPLATE.SPL~ ~override/ABN%stat%%i%.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 44 new_opcode = code parameter1 = i duration = 1 END
            FOR (j = 1; j < i; j = j+1) BEGIN
                SPRINT resource EVALUATE_BUFFER ~ABN%stat%%j%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 2 duration = 1 insert_point = 0 STR_VAR resource END 
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 2 duration = 1 insert_point = 0 STR_VAR resource END                  
            END
            SPRINT resource EVALUATE_BUFFER ~ABN%stat%%i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 2 duration = 1 insert_point = 0 STR_VAR resource END
        COPY ~3ed/StatBonuses/TEMPLATE.EFF~ ~override/ABN%stat%%i%.EFF~
            LPF ALTER_EFF STR_VAR resource END
    END
END

   
    
    
    


