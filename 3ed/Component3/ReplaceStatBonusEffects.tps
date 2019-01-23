


ACTION_DEFINE_ASSOCIATIVE_ARRAY stat_opcode BEGIN
    ~STR~ => 44
    ~INT~ => 19
    ~CHA~ => 6
    ~CON~ => 10
    ~DEX~ => 15
    ~WIS~ => 49
END


COPY_EXISTING_REGEXP GLOB ~.+\.itm~ ~override~
    PHP_EACH stat_opcode AS stat => code BEGIN
        LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = code 
                                   RET found = found_match val = parameter1 type = parameter2 found_timing = timing END        
        PATCH_IF (found AND (~%SOURCE_RES%~ STRING_MATCHES_REGEXP ~WP_.+~)) BEGIN  //exclude new polymorph weapons
            PATCH_IF (type == 1 AND val >= 18) BEGIN //set
                SET new_val = val - 16
                SET new_val = new_val >8 ? 8 : new_val
                
                PATCH_IF ((~%SOURCE_RES%~ STR_EQ ~bdblun06~) OR (~%SOURCE_RES%~ STR_EQ ~BCLAW~)) BEGIN
                    new_val = 4
                END
                
                LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 97 //check for exceptional strength 
                                   RET found_exceptional = found_match exceptional_val = parameter1 END
                                   
                SPRINT resource EVALUATE_BUFFER ~ABN%stat%%new_val%~
                LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = code opcode = 272 
                                              parameter1 = 1 parameter2 = 3 STR_VAR resource END
                                   
                SPRINT substring_to_replace EVALUATE_BUFFER ~%val%~
                PATCH_IF (found_exceptional AND (~%stat%~ STR_EQ ~STR~)) BEGIN
                    LPF DELETE_EFFECT INT_VAR check_globals = 1 check_headers = 1 match_opcode = 97 END
                    SPRINT substring_to_replace EVALUATE_BUFFER ~%val%/%exceptional_val%~
                    PATCH_IF (exceptional_val == 100) BEGIN
                        SPRINT substring_to_replace EVALUATE_BUFFER ~%val%/00~
                    END
                END
                SPRINT new_substring EVALUATE_BUFFER ~\+%new_val%~
                LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace new_substring END
                LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 STR_VAR substring_to_replace new_substring END
            END
            ELSE PATCH_IF (type == 0 AND val >= 1 AND val <= 10) BEGIN //increment
                SPRINT resource EVALUATE_BUFFER ~ABN%stat%%val%~
                LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = code opcode = 272 parameter1 = 1 parameter2 = 3 STR_VAR resource END               
            END
        END   
    END
    
    
//fix some bg1, bg2 item effects
ACTION_IF (~%GameId%~ STR_EQ ~Bg2~ OR (~%GameId%~ STR_EQ ~Bg1~ AND IncludesSod)) BEGIN
    COPY_EXISTING ~bdamul02.EFF~ ~override~
        LPF ALTER_EFF INT_VAR opcode = 272 parameter1 = 1 parameter2 = 3 STR_VAR resource = ~ABNDEX2~ END
    COPY_EXISTING ~bdhelm09.EFF~ ~override~
        LPF ALTER_EFF INT_VAR opcode = 272 parameter1 = 1 parameter2 = 3 STR_VAR resource = ~ABNCON2~ END
END
     
   
   
    
    
    


