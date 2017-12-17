
//---------------------------------------------update enemy profciencies and saves/dcs


    ACTION_DEFINE_ASSOCIATIVE_ARRAY ProfRemapCre BEGIN
        90 => 89
        91 => 89
        93 => 89
        96 => 90
        92 => 91
        94 => 92
        95 => 92
       115 => 93
       101 => 93
        97 => 93
       102 => 93
       100 => 94
        98 => 95
        99 => 95
       103 => 96
       105 => 97
       104 => 97
       106 => 98
       107 => 98
    END
    
    COPY_EXISTING_REGEXP GLOB ~.+\.CRE~ ~override~
        PHP_EACH ProfRemapCre AS original_prof => new_prof BEGIN
            LPF ALTER_EFFECT INT_VAR silent = 1 match_opcode = 233 match_parameter2 =  original_prof opcode = 1233 parameter2 = new_prof END
        END
        LPF ALTER_EFFECT INT_VAR silent = 1 match_opcode = 1233 opcode = 233 END 


        //spell dc bonus based on stats
		LPF ADD_CRE_EFFECT INT_VAR opcode=272 timing=9 parameter1=1 parameter2=3 duration=1 STR_VAR resource=~SPDCWBN~ END //int 
		LPF ADD_CRE_EFFECT INT_VAR opcode=272 timing=9 parameter1=1 parameter2=3 duration=1 STR_VAR resource=~SPDCPBN~ END //wis 
		//saves bonus based on stats
		LPF ADD_CRE_EFFECT INT_VAR opcode=272 timing=9 parameter1=1 parameter2=3 duration=1 STR_VAR resource=~DEXSAVBN~ END
		LPF ADD_CRE_EFFECT INT_VAR opcode=272 timing=9 parameter1=1 parameter2=3 duration=1 STR_VAR resource=~CONSAVBN~ END
		LPF ADD_CRE_EFFECT INT_VAR opcode=272 timing=9 parameter1=1 parameter2=3 duration=1 STR_VAR resource=~WISSAVBN~ END
    
        //fix low hp (that npc do not die because of low const)
    
        READ_BYTE 0x023d Const     
    
        PATCH_IF (Const<10) BEGIN       
            WRITE_BYTE 0x023d  10
        END
        
        
        //put protections from sneak attack based and posion, slay, kill on 3.5
        
        SET race_dragon_id  = IDS_OF_SYMBOL ( ~Race~ ~DRAGON~)
        SET race_golem_id  = IDS_OF_SYMBOL ( ~Race~ ~GOLEM~)
        SET race_elemental_id  = IDS_OF_SYMBOL ( ~Race~ ~ELEMENTAL~)
        SET race_slime_id  = IDS_OF_SYMBOL ( ~Race~ ~SLIME~)
        SET undead_id  = IDS_OF_SYMBOL ( ~General~ ~UNDEAD~)
        
        READ_BYTE 0x0271 general_id
        READ_BYTE 0x0272 race_id
    
        PATCH_IF (race_id == race_dragon_id) BEGIN //remove backstab immunity from dragons
            LPF DELETE_EFFECT INT_VAR match_opcode = 292 END           
        END
        
        PATCH_IF (race_id == race_golem_id OR race_id == race_elemental_id OR general_id == undead_id) BEGIN //add backstab immunity
            LPF DELETE_EFFECT INT_VAR match_opcode = 292 END   
            LPF ADD_CRE_EFFECT INT_VAR opcode = 292 timing = 1 parameter2 = 1  END 
        END
        
        PATCH_IF (race_id == race_golem_id OR race_id == race_elemental_id OR general_id == undead_id OR race_id == race_slime_id) BEGIN //add immunity against poison, kill and slay
            LPF DELETE_EFFECT INT_VAR match_opcode = 101 match_parameter2 = 13 END   //kill
            LPF DELETE_EFFECT INT_VAR match_opcode = 101 match_parameter2 = 25 END   //poison
            LPF DELETE_EFFECT INT_VAR match_opcode = 101 match_parameter2 = 55 END   //slay
            
            LPF ADD_CRE_EFFECT INT_VAR opcode = 101 target = 1 timing = 9 parameter2 = 13  END 
            LPF ADD_CRE_EFFECT INT_VAR opcode = 101 target = 1 timing = 9 parameter2 = 25  END 
            LPF ADD_CRE_EFFECT INT_VAR opcode = 101 target = 1 timing = 9 parameter2 = 55  END 
            
            //add immunity against swashbuckler strikes
            
            LPF ADD_CRE_EFFECT INT_VAR opcode = 206 target = 1 timing = 9 STR_VAR resource=~CRITSTR~  END 
            LPF ADD_CRE_EFFECT INT_VAR opcode = 206 target = 1 timing = 9 STR_VAR resource=~CRITCON~  END 
        END

    
