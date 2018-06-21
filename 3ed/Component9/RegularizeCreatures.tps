
//---------------------------------------------update enemy stats, profciencies and saves/dcs

        OUTER_SET row_size = 10
		COPY ~3ed/Classes/Enemies/ClassStats.2DA~ ~override~ 
			COUNT_2DA_ROWS row_size n_rows			
			FOR (i=1;i<n_rows;i=i+1) BEGIN
				READ_2DA_ENTRY %i% 1 row_size class_name
                READ_2DA_ENTRY %i% 2 row_size str
                READ_2DA_ENTRY %i% 3 row_size dex
                READ_2DA_ENTRY %i% 4 row_size con
                READ_2DA_ENTRY %i% 5 row_size int
                READ_2DA_ENTRY %i% 6 row_size wis
                READ_2DA_ENTRY %i% 7 row_size cha
                READ_2DA_ENTRY %i% 8 row_size fort
                READ_2DA_ENTRY %i% 9 row_size ref
                READ_2DA_ENTRY %i% 10 row_size will
               
				DEFINE_ASSOCIATIVE_ARRAY ClassStr BEGIN  "%class_name%" => "%str%" END
                DEFINE_ASSOCIATIVE_ARRAY ClassDex BEGIN  "%class_name%" => "%dex%" END
                DEFINE_ASSOCIATIVE_ARRAY ClassCon BEGIN  "%class_name%" => "%con%" END
                DEFINE_ASSOCIATIVE_ARRAY ClassInt BEGIN  "%class_name%" => "%int%" END
                DEFINE_ASSOCIATIVE_ARRAY ClassWis BEGIN  "%class_name%" => "%wis%" END
                DEFINE_ASSOCIATIVE_ARRAY ClassCha BEGIN  "%class_name%" => "%cha%" END
                DEFINE_ASSOCIATIVE_ARRAY ClassFort BEGIN  "%class_name%" => "%fort%" END
                DEFINE_ASSOCIATIVE_ARRAY ClassRef BEGIN  "%class_name%" => "%ref%" END
                DEFINE_ASSOCIATIVE_ARRAY ClassWill BEGIN  "%class_name%" => "%will%" END
			END

    
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
        READ_BYTE 0x0273 class_id
        LOOKUP_IDS_SYMBOL_OF_INT class_name ~class~ ~%class_id%~
        
        READ_BYTE 0x0238 CurrentStr
        READ_BYTE 0x023a CurrentInt
        READ_BYTE 0x023b CurrentWis
        READ_BYTE 0x023c CurrentDex
        READ_BYTE 0x023d CurrentCon
        READ_BYTE 0x023e CurrentCha 
        
        READ_BYTE 0x0054 CurrentDeath
        READ_BYTE 0x0055 CurrentWands
        READ_BYTE 0x0056 CurrentPoly
        READ_BYTE 0x0057 CurrentBreath
        READ_BYTE 0x0058 CurrentSpell
        
        READ_BYTE 0x0234 Level
           
        PATCH_SILENT           
        PATCH_TRY		//try to update stats
            SET lvl_saves = Level<=20 ? Level : 20
			SET TargetStr =  $ClassStr(~%class_name%~)
            SET TargetDex =  $ClassDex(~%class_name%~)
            SET TargetCon =  $ClassCon(~%class_name%~)
            SET TargetInt =  $ClassInt(~%class_name%~)
            SET TargetWis =  $ClassWis(~%class_name%~)
            SET TargetCha =  $ClassCha(~%class_name%~)
            SET TargetFort = ($ClassFort(~%class_name%~) == 1)	? (12 - lvl_saves/2) : (14 - lvl_saves/3)
            SET TargetRef =  ($ClassRef(~%class_name%~) == 1)	? (12 - lvl_saves/2) : (14 - lvl_saves/3)
            SET TargetWill =  ($ClassWill(~%class_name%~) == 1) ? (12 - lvl_saves/2) : (14 - lvl_saves/3)
            WRITE_BYTE 0x0238 (CurrentStr < TargetStr) ? TargetStr : CurrentStr
            WRITE_BYTE 0x023a (CurrentInt < TargetInt) ? TargetInt : CurrentInt
            WRITE_BYTE 0x023b (CurrentWis < TargetWis) ? TargetWis : CurrentWis
            WRITE_BYTE 0x023c (CurrentDex < TargetDex) ? TargetDex : CurrentDex
            WRITE_BYTE 0x023d (CurrentCon < TargetCon) ? TargetCon : CurrentCon
            WRITE_BYTE 0x023e (CurrentCha < TargetCha) ? TargetCha : CurrentCha
        
            WRITE_BYTE 0x0054 (CurrentDeath > TargetFort) ? TargetFort : CurrentDeath
            WRITE_BYTE 0x0055 (CurrentWands > TargetRef) ? TargetRef : CurrentWands
            WRITE_BYTE 0x0056 (CurrentPoly > TargetFort) ? TargetFort : CurrentPoly
            WRITE_BYTE 0x0057 (CurrentBreath > TargetRef) ? TargetRef : CurrentWands
            WRITE_BYTE 0x0058 (CurrentSpell  > TargetWill) ? TargetWill : CurrentSpell
	
		WITH		
			DEFAULT			
		END
        PATCH_VERBOSE
    
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

    
