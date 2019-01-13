
//bless
    OUTER_SET max_lvl = 20
    COPY_EXISTING ~SPPR101.SPL~ ~override~
        LPF ALTER_SPELL_EFFECT INT_VAR duration_high  = 60 END //1 turn on 1st level
        FOR (i=2;i<=max_lvl;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i END
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 60*i END
        END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700001  new_substring_ref = 700000 END
        
//protection from evil (priest)
    COPY_EXISTING ~SPPR107.SPL~ ~override~
        LPF ALTER_SPELL_EFFECT INT_VAR duration_high  = 60 END //1 turn on 1st level
        FOR (i=2;i<=max_lvl;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i END
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 60*i END
        END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700002  new_substring_ref = 700000 END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700007  new_substring_ref = 700000 END        
        
//protection from evil (wizard)
    COPY_EXISTING ~SPWI113.SPL~ ~override~
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=1;i<=Nheaders;i=i+1) BEGIN
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 60*i END
        END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700003  new_substring_ref = 700000 END 
        
//armor of faith
    COPY_EXISTING ~SPPR111.SPL~ ~override~
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=1;i<=Nheaders;i=i+1) BEGIN
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 60*i END
        END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700004  new_substring_ref = 700000 END 
        
//resist fire/cold
    COPY_EXISTING_REGEXP ~\(\(SPPR210\)\|\(SPPR216\)\)\.SPL~ ~override~
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=1;i<=Nheaders;i=i+1) BEGIN
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 60*i END
        END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700005  new_substring_ref = 700000 END 
                
//blur (5 rounds/level)
    COPY_EXISTING_REGEXP ~\(\(SPWI201\)\|\(SPDM102\)\)\.SPL~ ~override~
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=3;i<=Nheaders;i=i+1) BEGIN
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 60*i END
        END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700004  new_substring_ref = 700100 END
        
//luck (1 round/level)
    COPY_EXISTING ~SPWI209.SPL~ ~override~  
        FOR (i=2;i<=max_lvl;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i+2 END        
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 6*(i+2) END
        END	
		READ_LONG 0x0050 ~descr_strref~
        STRING_SET_EVALUATE %descr_strref% @700010  
        
//barkskin
    COPY_EXISTING ~SPPR202.SPL~ ~override~
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=1;i<=Nheaders;i=i+1) BEGIN
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 60*(i+2) END
        END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700004  new_substring_ref = 700000 END    
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700008  new_substring_ref = 700000 END
//aid - 5 rounds/level
    COPY_EXISTING ~SPPR201.SPL~ ~override~
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=1;i<=Nheaders;i=i+1) BEGIN
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 30*(i+2) END
        END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 215 duration_high  = 5 END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 174 duration_high  = 5 END
        
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700004  new_substring_ref = 700100 END    
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700008  new_substring_ref = 700100 END 

//ghost armor - 1 min/level
    COPY_EXISTING ~SPWI317.SPL~ ~override~
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=5;i<=Nheaders;i=i+1) BEGIN
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 60*i END
        END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700005  new_substring_ref = 700000 END

//spirit armor - 1 min/level
    COPY_EXISTING ~SPWI414.SPL~ ~override~
        LPF ALTER_SPELL_EFFECT INT_VAR duration_high  = 60 END //1 turn on 1st level     
        FOR (i=2;i<=max_lvl;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i END        
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 60*i END
        END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700006  new_substring_ref = 700000 END

//protection from fire (priest in bg1, bg2)
    ACTION_IF (NOT ~%GameId%~ STR_EQ ~Iwd~) BEGIN
        COPY_EXISTING ~SPPR306.SPL~ ~override~
            READ_SHORT 0x0068 "Nheaders" //number of headers
            FOR (i=1;i<=Nheaders;i=i+1) BEGIN
                LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high  = 60*i END
            END
            LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 700004  new_substring_ref = 700000 END 
    END

        