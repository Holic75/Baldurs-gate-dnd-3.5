	//make creatures wake up on sleep, and emotion hopelessness
	COPY_EXISTING ~SPWI116.SPL~ ~override~ //same for all games 
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=39 parameter2=0 END
	
	ACTION_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
        COPY_EXISTING ~SPWI411.SPL~ ~override~ 
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=39 parameter2=0 END
            READ_LONG 0x0050 ~descr_strref~
            STRING_SET_EVALUATE %descr_strref% @314
    END
    ELSE BEGIN //replace stun with sleep effect
        COPY_EXISTING ~SPWI411.SPL~ ~override~ 
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=45 opcode = 39 parameter2=0 END   
            READ_LONG 0x0050 ~descr_strref~
            STRING_SET_EVALUATE %descr_strref% @315	    
    END
    
		//change finger of death to make 8d6 damage in case of failure independent of level
	COPY_EXISTING ~SPWI713.SPL~ ~override~
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 12 dicenumber = 8 dicesize = 6  parameter1 = 0 END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @010	
		
	COPY_EXISTING ~SPPR708.SPL~ ~override~
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 12 dicenumber = 8 dicesize = 6  parameter1 = 0 END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @011	
	//reduce horror duration to 3 rounds
	COPY_EXISTING ~SPWI205.SPL~ ~override~
		LPF ALTER_SPELL_EFFECT INT_VAR duration_high = 18 END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @012
	//remove level dependent saving throws penalty for spook
	COPY_EXISTING ~SPWI125.SPL~ ~override~
		LPF ALTER_SPELL_EFFECT INT_VAR savebonus = 0 END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @013
		
		
	//update cure spells
	
	ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
		COPY_EXISTING ~SPPR217.SPL~ ~override~ 
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 17 parameter1 = 14  END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @015	
	END
	
	COPY_EXISTING ~SPPR315.SPL~ ~override~ 
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 17 parameter1 = 20  END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @016
	COPY_EXISTING ~SPPR401.SPL~ ~override~ 
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 17 parameter1 = 26  END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @017

	COPY_EXISTING ~SPPR502.SPL~ ~override~
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 17 parameter1 = 32  END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @018	

		
	//update harm spells
	ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
		COPY_EXISTING ~SPPR220.SPL~ ~override~ 
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 12 parameter1 = 7  END //damage to 2*7
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @022		

		COPY_EXISTING ~SPPR330.SPL~ ~override~ 
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 12 parameter1 = 10  END //damage to 2*10
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @024			

		COPY_EXISTING ~SPPR414.SPL~ ~override~ 
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 12 parameter1 = 13  END //damage to 2*13
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @025		

		COPY_EXISTING ~SPPR510.SPL~ ~override~ 
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 12 parameter1 = 16  END //damage to 2*16
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @026	
			
			
		COPY_EXISTING ~SPPR511.SPL~ ~override~ //slay living 
			
			LPF ALTER_SPELL_HEADER INT_VAR speed = 7 END
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 12 parameter1 = 9  END //damage to 2d6 + 9
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @027
			
		COPY_EXISTING ~SPPR608.SPL~ ~override~ //harm 

			LPF ALTER_SPELL_EFFECT INT_VAR  savingthrow = 0 END //no save against harm

			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @028			
	
	END ELSE BEGIN
		COPY_EXISTING ~SPPR414.SPL~ ~override~ 
			LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 0 - 1 END
			LPF ALTER_SPELL_HEADER INT_VAR speed = 5 target = 1 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 target = 2 power = 4 parameter1 = 13 parameter2 = 4194304 timing = 1 resist_dispel = 1 probability1 = 100 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 target = 2 power = 4 parameter1 = 13 parameter2 = 4194304 timing = 1 resist_dispel = 1 probability1 = 100 savingthrow = 1 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 215 target = 2 power = 4 parameter2 = 1 timing = 0 resist_dispel = 1 probability1 = 100 STR_VAR resource = ~ICMAGICH~ END
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @025	
		COPY_EXISTING ~SPPR510.SPL~ ~override~ 
			LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 0 - 1 END
			LPF ALTER_SPELL_HEADER INT_VAR speed = 5 target = 1 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 target = 2 power = 4 parameter1 = 16 parameter2 = 4194304 timing = 1 resist_dispel = 1 probability1 = 100 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 target = 2 power = 4 parameter1 = 16 parameter2 = 4194304 timing = 1 resist_dispel = 1 probability1 = 100 savingthrow = 1 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 215 target = 2 power = 4 parameter2 = 1 timing = 0 resist_dispel = 1 probability1 = 100 STR_VAR resource = ~ICMAGICH~ END
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @026	

			COPY_EXISTING ~SPPR511.SPL~ ~override~ //slay living 
				SET Color = 179*256+50*256*256+0*256*256*256 
				LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 0 - 1 END
				LPF ALTER_SPELL_HEADER INT_VAR speed = 7 target = 1 END		
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 50 target = 2 power = 5 parameter1 = Color parameter2 = 20*256*256 timing = 0 resist_dispel = 1  duration =1 savingthrow = 1 END //color pulse				
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 target = 2 power = 5 parameter1 = 9 parameter2 = 4194304 timing = 1 resist_dispel = 1 dicesize = 6 dicenumber = 2 END
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 141 target = 2 power = 5 parameter1 = 0 parameter2 = 39 timing = 1 resist_dispel = 1 savingthrow = 1 END
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 174 target = 2 power = 5  timing = 1 resist_dispel = 1  STR_VAR resource = ~EFF_P06~ END
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 55 target = 2 power = 5  timing = 1 parameter2 = 2 resist_dispel = 1  savingthrow = 1 END
				READ_LONG 0x0050 ~descr_strref~
				STRING_SET_EVALUATE %descr_strref% @027
				
			COPY_EXISTING ~SPPR608.SPL~ ~override~ //harm
				LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 0 - 1 END
				LPF ALTER_SPELL_HEADER INT_VAR speed = 9 target = 1 END	
				//1d4 damage
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 target = 2 power = 6 parameter1 = 1 parameter2 = 4194305 timing = 1 resist_dispel = 1 probability1 = 25 END
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 target = 2 power = 6 parameter1 = 2 parameter2 = 4194305 timing = 1 resist_dispel = 1 probability2 = 26 probability1 = 50 END
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 target = 2 power = 6 parameter1 = 3 parameter2 = 4194305 timing = 1 resist_dispel = 1 probability2 = 51 probability1 = 75 END
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 target = 2 power = 6 parameter1 = 4 parameter2 = 4194305 timing = 1 resist_dispel = 1 probability2 = 76 probability1 = 100 END
				
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 215 target = 2 power = 6 parameter2 = 1 timing = 0 resist_dispel = 1 probability1 = 100 STR_VAR resource = ~ICMAGICH~ END //lightning effects
				READ_LONG 0x0050 ~descr_strref~
				STRING_SET_EVALUATE %descr_strref% @028			
	END
	
	
	//chill touch
	COPY_EXISTING ~SPWI117.SPL~ ~override~ 
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 0 - 1 END
		LPF ALTER_SPELL_HEADER INT_VAR speed = 2 target = 1 END	
		LPF ADD_SPELL_EFFECT INT_VAR opcode = 318 target = 2 power = 1 parameter2 = 1  STR_VAR resource=~SPWI117~ END //protect undead
		LPF ADD_SPELL_EFFECT INT_VAR opcode = 318 target = 2 power = 1 parameter2 = 27  STR_VAR resource=~SPWI117~ END //protect golem
		
		LPF ADD_SPELL_EFFECT INT_VAR opcode = 174 target = 2 power = 1 timing = 4 resist_dispel = 1 duration = 30 savingthrow = 4  STR_VAR resource=~EFF_E06~ END 
		LPF ADD_SPELL_EFFECT INT_VAR opcode = 174 target = 2 power = 1 timing = 1 resist_dispel = 1 duration = 0 savingthrow = 4  STR_VAR resource=~EFF_M07~ END
		LPF ADD_SPELL_EFFECT INT_VAR opcode = 141 target = 2 power = 1 parameter2 = 1 timing = 1 resist_dispel = 1 duration = 0 savingthrow = 4  END
		LPF ADD_SPELL_EFFECT INT_VAR opcode = 54 target = 2 power = 1 parameter1 = 0 - 2 timing = 0 resist_dispel = 1 duration = 30 savingthrow = 4 END // -2 thaco
		LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 target = 2 power = 1 timing = 1 resist_dispel = 1  dicesize = 8 dicenumber =1 parameter2 = 67108864 END //cold damage
		
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @029
		
		
	ACTION_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
	//ghoul touch
	
		COPY_EXISTING ~GHOULT.ITM~ ~override~
			LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 139 RET GhoulStrRef = parameter1 END //str ref for 'paralyze'
		COPY_EXISTING ~SPWI218.SPL~ ~override~ 
			SET Color = 87*256+54*256*256+0*256*256*256 
			LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 0 - 1 END
			LPF ALTER_SPELL_HEADER INT_VAR speed = 2 target = 1 END	
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 50 target = 2 power = 2 parameter1 = Color parameter2 = 25*256*256 timing = 0 resist_dispel = 4  duration =2 savingthrow = 4 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 142 target = 2 power = 2 parameter2 = 13 timing = 0 resist_dispel = 1  duration =30 savingthrow = 4 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 139 target = 2 power = 2 parameter1 = GhoulStrRef timing = 1 resist_dispel = 1  savingthrow = 4 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 141 target = 2 power = 2 parameter2 = 1 timing = 1 resist_dispel = 1  savingthrow = 4 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 141 target = 2 power = 2 parameter2 = 1 timing = 1 resist_dispel = 1  savingthrow = 4 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 109 target = 2 power = 2 parameter2 = 2 timing = 0 resist_dispel = 1  duration = 30 savingthrow = 4 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 174 target = 2 power = 2 parameter2 = 2 timing = 1 resist_dispel = 1  savingthrow = 4 STR_VAR resource = ~EFF_P11~ END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 174 target = 2 power = 2 parameter2 = 2 timing = 4 resist_dispel = 1  duration = 30 savingthrow = 4 STR_VAR resource = ~EFF_E05~ END
			
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @030
	END

	//shocking grasp
	COPY_EXISTING ~SPWI115.SPL~ ~override~ 
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 0 - 1 END
		LPF ALTER_SPELL_HEADER INT_VAR speed = 2 target = 1 END	
		FOR (i=6;i<=30;i=i+1) BEGIN
			LPF DELETE_SPELL_HEADER INT_VAR header_type = 0 - 1 min_level = i END
		END
		
		FOR (i=1;i<=5;i=i+1) BEGIN
			LPF ADD_SPELL_EFFECT INT_VAR header = i opcode = 141 target = 2 power = 1 parameter2 = 6 timing = 1 resist_dispel = 1   END
			LPF ADD_SPELL_EFFECT INT_VAR header = i opcode = 12 target = 2 power = 1  parameter2 = 262144 timing = 1 resist_dispel = 1  dicesize = 6 dicenumber = i END
		END
	
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @031

	
	//chain lightning to 12d6 damage 
	ACTION_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
	COPY_EXISTING_REGEXP ~\(SPDR601.SPL\)\|\(SPWI615.SPL\)~ ~override~
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 12 dicenumber = 6 END
	
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @032
		
	END
	
	//barkskin
	COPY_EXISTING ~SPPR202.spl~ ~override~
		READ_SHORT 0x68 n_headers
		LPF ADD_SPELL_EFFECT INT_VAR  opcode = 321 power=2 target=2  duration=1 timing=0 resist_dispel=3 insert_point=0 STR_VAR resource=~SPPR202~ END //remove effects from previous cast
		LPF ALTER_SPELL_EFFECT INT_VAR  header = 1 match_opcode = 0 parameter1 = 3 parameter2 = 0 END
		FOR (i=1;i<=4;i+=1) BEGIN   //1,4,5,6 +3 AC
			LPF ALTER_SPELL_EFFECT INT_VAR  header = i match_opcode = 0 parameter1 = 3 parameter2 = 0 END
		END
		FOR (i=5;i<=10;i+=1) BEGIN   //7-12 +4 AC
			LPF ALTER_SPELL_EFFECT INT_VAR  header = i match_opcode = 0 parameter1 = 4 parameter2 = 0 END
		END
		FOR (i=11;i<=n_headers;i+=1) BEGIN   //13-20  +5 AC
			LPF ALTER_SPELL_EFFECT INT_VAR  header = i match_opcode = 0 parameter1 = 5 parameter2 = 0 END
		END
		//allow only druids to cast it 
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @033
	
//shield
	OUTER_FOR (i=1;i<=4;i=i+1) BEGIN
		OUTER_SPRINT resource EVALUATE_BUFFER ~SHLD_AC%i%~
		COPY ~3ed/Spells/Shield/SHLD_AC.eff~ ~override/SHLD_AC%i%.eff~
			LPF ALTER_EFF STR_VAR resource END
			
		COPY ~3ed/Spells/Shield/SHLD_AC.spl~ ~override/SHLD_AC%i%.spl~
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode =321 STR_VAR resource END
	END
	COPY_EXISTING ~SPWI114.spl~ ~override~
		READ_SHORT 0x68 n_headers
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete  = 0 END
		
		FOR (i=1;i<=4;i=i+1) BEGIN
			SPRINT resource EVALUATE_BUFFER ~SHLD_AC%i%~
			LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 - 1  power=1 opcode = 326 target = 1 resist_dispel = 3 duration = 1 STR_VAR resource  END //initial apply
			LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 - 1  power = 1 parameter1 = 1 parameter2 = 3 opcode = 272 target = 1 resist_dispel = 3 duration = 10 
							 STR_VAR resource  END //apply every second
		END
		
		//set duration to 5 rounds per level
		FOR (i=n_headers+1;i<=30;i=i+1) BEGIN
			LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
			LPF ALTER_SPELL_HEADER INT_VAR min_level = i END
		END		

		FOR (i=1;i<=30;i=i+1) BEGIN
			LPF ALTER_SPELL_EFFECT INT_VAR header =i duration_high = 30*i END
		END
		READ_LONG 0x0050 ~descr_strref~		
		STRING_SET_EVALUATE %descr_strref% @034

	
//Champions strength
	COPY_EXISTING ~SPPR507.spl~ ~override~
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=97 END//remove exceptional strength
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=44 END//remove strength bonus
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=145 END //delete spell casting disable (to allow casting innates)
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=60 END //remove casting failure
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=93 END //remove fatigue
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=54 END //remove thac0 bonus
		
		LPF ALTER_SPELL_HEADER INT_VAR target = 5 range = 0 END //target is set to caster
    COPY_EXISTING ~SPPR507.spl~ ~override~
		PATCH_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
			FOR (i=1;i<12;i=i+1) BEGIN
     
				LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
                
				LPF ALTER_SPELL_HEADER INT_VAR header = i+1 min_level = i+9 END
			END
		END
		FOR (i=1;i<=12;i+=1) BEGIN   
			SET cstr_lvl=i+8 
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 54 target = 2  power =5 parameter1 = (20 - cstr_lvl) parameter2 = 1 resist_dispel = 3 duration =10 END // set thac0 to fighters
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 44 target = 2 power = 5 parameter1 = 4 parameter2 = 0 resist_dispel = 3 duration = 10 END //STR bonus	
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 1 target = 2 power = 5 parameter1 = 6 parameter2 = 0  resist_dispel = 3 duration = 10 END //+ 0.5 APR
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 145 target = 2 power = 5 parameter1 = 0 parameter2 = 0  resist_dispel = 3 duration = 10 END // forbid casting wizard spells
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 145 target = 2 power = 5 parameter1 = 0 parameter2 = 1  resist_dispel = 3 duration = 10 END // forbid casting cleric spells
			LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high = 18*(cstr_lvl) END
		END
		
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @035

//Holy power 
	COPY_EXISTING ~SPPR412.spl~ ~override~
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=97 END//remove exceptional strength
		LPF ALTER_SPELL_HEADER INT_VAR target = 5 range = 0 END //target is set to caster
		READ_SHORT 0x68 n_headers
		FOR (i=1;i<=n_headers;i+=1) BEGIN   
			SET cstr_lvl=i+6 
			SET THAC0_BONUS = (20 - cstr_lvl)
			PATCH_IF (THAC0_BONUS<0) BEGIN
				THAC0_BONUS = 0
			END
			LPF ALTER_SPELL_EFFECT INT_VAR  header = i match_opcode = 54 parameter1 = THAC0_BONUS  parameter2=1 END // thac0
			LPF ALTER_SPELL_EFFECT INT_VAR  header = i match_opcode = 44 parameter1 = 2 parameter2 = 0 END //+2 STR bonus	
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 1 target = 2 power = 4 parameter1 = 6 parameter2 = 0 duration = 6*(cstr_lvl) resist_dispel = 3 END // +0.5 APR
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 145 target = 2 power = 4 parameter1 = 0 parameter2 = 0 duration = 6*(cstr_lvl) resist_dispel = 3 END // forbid casting wizard spells
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 145 target = 2 power = 4 parameter1 = 0 parameter2 = 1 duration = 6*(cstr_lvl) resist_dispel = 3 END // forbid casting cleric spells
		END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @036
		
		
	//Tenser's transformation
	COPY_EXISTING ~SPWI603.spl~ ~override~
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=54 END//remove existing  THAC0 bonuses
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=145 END //delete spell casting disable (to allow casting innates)
		READ_SHORT 0x68 n_headers
		FOR (i=1;i<=n_headers;i+=1) BEGIN   
			SET cstr_lvl=i+11
			SET THAC0_BONUS = (20 - cstr_lvl)
			PATCH_IF (THAC0_BONUS<0) BEGIN
				THAC0_BONUS = 0
			END
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 54 target = 1 power = 6 parameter1 = THAC0_BONUS - 2  parameter2 = 1 duration = 6 *(cstr_lvl) resist_dispel = 3 END // thac0	
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 1 target = 1 power = 6 parameter1 = 1 parameter2 = 0 duration = 6*(cstr_lvl) resist_dispel = 3 END //+1 APR
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 145 target = 1 power = 6 parameter1 = 0 parameter2 = 0 duration = 6*(cstr_lvl) resist_dispel = 3 END // forbid casting wizard spells
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 145 target = 1 power = 6 parameter1 = 0 parameter2 = 1 duration = 6*(cstr_lvl) resist_dispel = 3 END // forbid casting cleric spells
		END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @037
		
		
	//Call Lightning (allow to cast indoors reduce dmg to 1d6 per level up to 10d6)
	COPY_EXISTING ~SPPR302.spl~ ~override~
		READ_BYTE 0x0019  outdoor_flag//outdoors flag in bit 5
		WRITE_BYTE 0x0019 (outdoor_flag BAND 0b11011111)
		READ_SHORT 0x68 n_headers
		FOR (i=11;i<=n_headers;i=i+1) BEGIN
			LPF DELETE_SPELL_HEADER INT_VAR header_type=1 min_level=i END
		END
		
		FOR (i=5;i<=10;i=i+1) BEGIN
			SET k=i - 4
			LPF ALTER_SPELL_EFFECT INT_VAR header=k match_opcode=12 dicenumber=(i/2) dicesize=6 parameter1=2*(i - 2*(i/2)) END
		END
				
		READ_LONG 0x0050 ~descr_strref~
		ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
			STRING_SET_EVALUATE %descr_strref% @0381
		END ELSE BEGIN
			STRING_SET_EVALUATE %descr_strref% @038
		END
		
		
	ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
		COPY_EXISTING ~SPPR215.spl~ ~override~
		LPF ALTER_SPELL_EFFECT INT_VAR opcode = 255 parameter1 = 3 END //create 3 berries
	END
	ELSE BEGIN
	
		//Goodberry spell- change spell description
		COPY_EXISTING ~SPPR207.spl~ ~override~
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @039	//change description
		//Berry item - change 1 hp to 3 and description
		COPY_EXISTING ~GBERRY.itm~ ~override~	
			LPF ALTER_EFFECT INT_VAR match_opcode=17 parameter1=3 END
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @0391
	END
	
//altering flame blade to give bonus damage instead of creating weapon
	COPY ~3ed/Spells/FlameWeapon/FLMWPN.eff~ ~override~ 
	COPY_EXISTING ~SPPR206.SPL~ ~override~
		READ_SHORT 0x68 n_headers
		LPF ALTER_SPELL_HEADER INT_VAR target=1 END //allow to cast on living actors
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=111  new_opcode=248 target=2 STR_VAR resource = ~FLMWPN~ END //add effect on hit
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=215  target=2 END //move visual effect to targer 
	
		FOR (i=0;i<=n_headers;i=i+1) BEGIN
			LPF ADD_SPELL_EFFECT INT_VAR opcode=249 target=2 power=2 timing=0 duration=24+i*6 resist_dispel=1 header=i+1 STR_VAR resource = ~FLMWPN~ END //add effect on ranged hit
			LPF ADD_SPELL_EFFECT INT_VAR opcode=142 target=2 power=2 parameter2=188 timing=0 duration=24+i*6 resist_dispel=1 header=i+1  END //display weapon icon
			LPF ADD_SPELL_EFFECT INT_VAR opcode=9 target=2 power=2 parameter1=256*255+71*256*256+41*256*256*256 parameter2=16+256*256*30 timing=0 duration=24+i*6 resist_dispel=1 header=i+1  END //major colour pulse //weapon glow
		END
		LPF ADD_SPELL_EFFECT INT_VAR  opcode = 321 power=2 target=2  duration=1 timing=0 resist_dispel=3 insert_point=0 STR_VAR resource=~SPPR206~ END //remove effects from previous cast
        LPF ALTER_SPELL_EFFECT INT_VAR resist_dispel = 3 END
		//allow only druids to cast it 
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)
		READ_LONG 0x0008 ~name_strref~
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %name_strref% @040	//change name 
			
		ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
			STRING_SET_EVALUATE %descr_strref% @0402	//change description
		END ELSE BEGIN
			STRING_SET_EVALUATE %descr_strref% @0401	//change description		
		END
		
	
//righteous magic
	COPY_EXISTING ~SPPR513.spl~ ~override~
		READ_SHORT 0x68 n_headers
		FOR (i=1;i<=n_headers;i+=1) BEGIN   
			SET cstr_lvl=i+8 
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 0 target = 1 power = 5 parameter1 = 2 parameter2 = 0 duration = 6*(cstr_lvl) resist_dispel = 3 END // +2 AC
			//damage resistance
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 86 target = 1 power = 5 parameter1 = 5*(cstr_lvl/3) parameter2 = 0 duration = 6*(cstr_lvl) resist_dispel = 3 END 
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 87 target = 1 power = 5 parameter1 = 5*(cstr_lvl/3) parameter2 = 0 duration = 6*(cstr_lvl) resist_dispel = 3 END 
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 88 target = 1 power = 5 parameter1 = 5*(cstr_lvl/3) parameter2 = 0 duration = 6*(cstr_lvl) resist_dispel = 3 END 
			LPF ADD_SPELL_EFFECT INT_VAR  header = i opcode = 89 target = 1 power = 5 parameter1 = 5*(cstr_lvl/3) parameter2 = 0 duration = 6*(cstr_lvl) resist_dispel = 3 END 
		
		END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @041

	//make flame strike aoe spell with 1d8 damage level
	COPY_EXISTING ~SPPR503.SPL~ ~override~
		READ_SHORT 0x68 n_headers
		PATCH_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
			
		END ELSE BEGIN
			LPF ALTER_SPELL_HEADER INT_VAR projectile=215 target=4 END
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=215 parameter2=2 END				
		END
		
		FOR (i = n_headers; i<=20;i=i+1) BEGIN
			LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
		END
		
		FOR (i = 1; i<=20;i=i+1) BEGIN
			LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i END
			LPF ALTER_SPELL_EFFECT INT_VAR header = i match_opcode=12 parameter1=2*(i - 2*(i/2)) dicesize = 8 dicenumber = (i/2) END
		END
		
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @042	//change description
		
		//change magical stone to create magical bullets
	COPY ~3ed/Spells/MagicStone~ ~override~
	COPY_EXISTING ~SPPR106.SPL~ ~override~
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 12 END
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 177 END
		LPF ALTER_SPELL_HEADER INT_VAR target = 5 projectile = 1 END //cast on self and remove projectile
		LPF ALTER_SPELL_EFFECT INT_VAR target = 1 savingthrow = 0 END 
		LPF ADD_SPELL_EFFECT INT_VAR opcode = 122 target = 1 power = 1 parameter1 = 2 timing =4 resist_dispel = 2 duration = 1 STR_VAR resource =~MGCSTN~ END //create 2 stones
	COPY_EXISTING ~SPPR106.SPL~ ~override~
        FOR (i=2;i<=20;i+=1) BEGIN
			LPF ADD_SPELL_HEADER INT_VAR  copy_header=1 END
			LPF ALTER_SPELL_HEADER INT_VAR  header=i min_level=i END
			LPF ALTER_SPELL_EFFECT INT_VAR  header = i match_opcode = 122 parameter1 = 2*i END 
		END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @043
	COPY_EXISTING ~MGCSTN.ITM~ ~override~
		SET   item_name=RESOLVE_STR_REF (@0431)
		SET   item_descr=RESOLVE_STR_REF (@0432)
		WRITE_LONG 0x0008 item_name
		WRITE_LONG 0x000c item_name
		WRITE_LONG 0x0050 item_descr
		WRITE_LONG 0x0054 item_descr
		
	//allow armor and ghost armor to be cast on any party members
	//SPWI102
	//SPWI317
	COPY_EXISTING_REGEXP ~\(SPWI102.SPL\)\|\(SPWI317.SPL\)~ ~override~
		LPF ALTER_SPELL_HEADER INT_VAR target=1 END
		LPF ALTER_SPELL_EFFECT INT_VAR target=2 END
		SPRINT substring_to_replace @441
		SPRINT new_substring@442
		LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace  new_substring END
		SPRINT substring_to_replace @443
		SPRINT new_substring@444		
		LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace  new_substring END
		
	ACTION_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
		//make burning hands area of effect spell
		ADD_PROJECTILE      ~3ed/Spells/BurningHands/BRNHND.PRO~
		COPY_EXISTING ~SPWI103.SPL~ ~override~
			SET projectile=BRNHND
			LPF ALTER_SPELL_HEADER INT_VAR projectile target=4 range=8 END //updating projectile (aoe, range -15 ft - somehow for cone-shaped spells the distance should be divided by 2)
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @045
	END

	//nerf draw upon holy might
	COPY_EXISTING_REGEXP GLOB ~\(SPPR214.SPL\)\|\(SPIN103.SPL\)~ ~override~ 
		READ_SHORT 0x68 n_headers
		LPF ALTER_SPELL_HEADER INT_VAR header=2 min_level=5 END
		LPF ALTER_SPELL_HEADER INT_VAR header=3 min_level=10 END
		LPF ALTER_SPELL_HEADER INT_VAR header=4 min_level=15 END
		LPF ALTER_SPELL_HEADER INT_VAR header=5 min_level=20 END
		FOR (i=6;i<=n_headers;i=i+1) BEGIN
			LPF ALTER_SPELL_HEADER INT_VAR header=i min_level=40 END
		END
		LPF DELETE_SPELL_HEADER INT_VAR header_type=~-1~ min_level=40 END
		
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @046
		
	//update spiritual hammer description (it is throwing now and gets +1 per 3 caster levels)
	COPY_EXISTING ~SPPR213.SPL~ ~override~
		READ_SHORT 0x68 n_headers
		FOR (i=1;i<=n_headers;i=i+1) BEGIN //headers defined as 1,4,5,6,7...
			SET k = (i+2)*(i>1)+(i=1)
			SET enc = k/3
			PATCH_IF enc>5 BEGIN
				SET enc=5
			END		
			PATCH_IF enc=0 BEGIN
				SET enc=1
			END	
			SPRINT resource EVALUATE_BUFFER ~SPIHAMM%enc%~
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=111 header=i STR_VAR resource END
		END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @047

	ACTION_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
		//do the same for innate
		COPY_EXISTING ~SPPR213.SPL~ ~override/SPIN113.SPL~
			WRITE_SHORT 0x001c 4
			LPF ALTER_SPELL_HEADER INT_VAR location=4 END	
	END
	
	
	//make cloak of fear work in 5ft radius with -4 save bonus
	ACTION_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
		COPY_EXISTING ~SPPR416.SPL~ ~override~ 
			SET savebonus= 0 - 4
			LPF ALTER_SPELL_HEADER INT_VAR projectile=218 END
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=24  savebonus END
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=142 savebonus END
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=174 savebonus END
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @048
	END ELSE BEGIN
		COPY_EXISTING ~#COFEAR.SPL~ ~override~ 
			LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 139 RET PanicStrRef = parameter1 END
		COPY_EXISTING ~SPPR416.SPL~ ~override~  
			SET savebonus= 0 - 4
			LPF ALTER_SPELL_HEADER INT_VAR projectile=218 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode=324 power = 4 target = 2 parameter2 = 1 duration = 1 END //undead immunity
			LPF ADD_SPELL_EFFECT INT_VAR opcode=24  power = 4 target = 2 resist_dispel =1 duration = 24 savebonus END //panic
			LPF ADD_SPELL_EFFECT INT_VAR opcode=139 power = 4 target = 2 parameter1 = 36  timing = 1 savebonus END //portrait icon
			LPF ADD_SPELL_EFFECT INT_VAR opcode=139 power = 4 target = 2 parameter1 = PanicStrRef  timing = 1 savebonus END //display string

					
			LPF ALTER_SPELL_EFFECT INT_VAR duartion_high = 24 END
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @048		
	END
	
	//update sun soulray ability
	OUTER_FOR (i=1;i<=5;i=i+1) BEGIN //damage to undead 
		COPY ~3ed/Spells/SunSoulray/SUNSLR.EFF~ ~override/SUNSLR%i%.EFF~
			WRITE_LONG 0x0038 i
	END
	COPY_EXISTING ~SPCL236.SPL~ ~override~
		FOR (i=1;i<=5;i=i+1) BEGIN
			SPRINT resource EVALUATE_BUFFER ~SUNSLR%i%~
			LPF ALTER_SPELL_EFFECT INT_VAR  header = i match_opcode = 177 STR_VAR resource END  //damage
			
		END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @049
		
	//update aid to add hp based on level and be cumulitive with bless
	COPY_EXISTING ~SPPR201.SPL~ ~override~
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=129 END //remove bless (will be replaced with separate thaco and dmg bonuses)
		LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=321 END //remove remove spell effects and readd it later (for compatibility with iwd)
		READ_SHORT 0x68 n_headers
		FOR (i=1;i<=n_headers;i=i+1) BEGIN
			SET lvl = (~%GameId%~ STR_EQ ~Iwd~)*2+i
			LPF ADD_SPELL_EFFECT INT_VAR opcode=325 power=2  target=2 parameter1=1 parameter2=0 timing=0 resist_dispel=3 duration=6*(lvl+1) header=i insert_point=0 END //saves bonus
			LPF ADD_SPELL_EFFECT INT_VAR opcode=278 power=2  target=2 parameter1=1 parameter2=0 timing=0 resist_dispel=3 duration=6*(lvl+1) header=i insert_point=0 END //thaco bonus
			SET hp_bonus=i
			PATCH_IF (hp_bonus>10) BEGIN
				SET hp_bonus=10
			END
			SET hp_bonus=hp_bonus+5
			LPF ADD_SPELL_EFFECT INT_VAR opcode=18 power=2  target=2 parameter1=hp_bonus parameter2=0 timing=0 resist_dispel=3 duration=6*(lvl+1) header=i insert_point=0 END //hp
		END
		LPF ADD_SPELL_EFFECT INT_VAR opcode=321 power=2  target=2 parameter2=0 timing=0 resist_dispel=3 duration=1 insert_point=0 STR_VAR resource=~SPPR201~ END //remove previous casts
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @050
		
	//make animate dead call 2 skeletons per cast
	COPY_EXISTING_REGEXP GLOB ~\(SPCL106.SPL\)\|\(SPPR301.SPL\)\|\(SPWI501.SPL\)~ ~override~ 
		PATCH_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
			LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
			LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
			LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
			FOR (i=2;i<=4;i=i+1) BEGIN
				LPF ALTER_SPELL_HEADER INT_VAR min_level = 7 + (i - 2)*4 END
			END
			LPF ALTER_SPELL_EFFECT INT_VAR header = 1 opcode =177 parameter1= 0 parameter2 = 2 dicesize =0 dicenumber =0 STR_VAR resource ~SPANDE01~ END
			LPF ALTER_SPELL_EFFECT INT_VAR header = 2 opcode =177 parameter1= 0 parameter2 = 2 dicesize =0 dicenumber =0 STR_VAR resource ~SPANDE07~ END
			LPF ALTER_SPELL_EFFECT INT_VAR header = 3 opcode =177 parameter1= 0 parameter2 = 2 dicesize =0 dicenumber =0 STR_VAR resource ~SPANDE11~ END
			LPF ALTER_SPELL_EFFECT INT_VAR header = 4 opcode =177 parameter1= 0 parameter2 = 2 dicesize =0 dicenumber =0 STR_VAR resource ~SPANDE15~ END
		END
		LPF CLONE_EFFECT INT_VAR check_globals=0 END
        
        COPY_EXISTING ~SPPR301.SPL~ ~override~
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @0511
       

	//make absorb health a melee spell
	COPY_EXISTING ~SPCL102.SPL~ ~override~ 
		LPF ALTER_SPELL_HEADER INT_VAR range=1 END
	
	//make lay on hands cure disiese starting from level 6, and poison starting from level 9
    COPY_EXISTING ~SPPR404.SPL~ ~override/LAY_PSN.SPL~  //make proxy poison neutralization without hp restoration
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=17 END
        WRITE_LONG 0x0008 0
        
	COPY_EXISTING ~SPCL211.SPL~ ~override~ 
		READ_SHORT 0x0068 "Nheaders" //number of headers
		FOR (i=6;i<=Nheaders;i=i+1) BEGIN 			 
			PATCH_IF (i<9) BEGIN
                LPF ADD_SPELL_EFFECT INT_VAR  opcode = 326 power=0 target=2  duration=1 timing=0 resist_dispel=3 header = i  STR_VAR resource = ~SPPR317~ END //cure disease				
			END
            ELSE BEGIN
                LPF ADD_SPELL_EFFECT INT_VAR  opcode = 326 power=0 target=2  duration=1 timing=0 resist_dispel=3 header = i  STR_VAR resource = ~LAY_PSN~ END //cure disease and poison
            END
		END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @052
		
	ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
	//modify sol searing orb for iwd
		COPY_EXISTING ~SPPR614.SPL~ ~override~
			LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 139 RET BlindStrRef = parameter2 END
		COPY_EXISTING ~SPPR614.SPL~ ~override~
			LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 326 END
			
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 parameter2 = 524288  target = 2 power =6 timing = 1 resist_dispel = 1 savingthrow = 1  dicesize = 12 dicenumber = 3 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 parameter2 = 524288  target = 2 power =6 timing = 1 resist_dispel = 1 dicesize = 12 dicenumber = 3 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 318 parameter2 = 2  target = 2 power =6  resist_dispel = 1  END //protection to non-undead
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 parameter2 = 524288  target = 2 power =6 timing = 1 resist_dispel = 1 savingthrow = 1  dicesize = 12 dicenumber = 3 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 parameter2 = 524288  target = 2 power =6 timing = 1 resist_dispel = 1 dicesize = 12 dicenumber = 3 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 139 target = 2 power =6 parameter1 = BlindStrRef timing = 1 resist_dispel = 1 savingthrow = 1 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 142 target = 2 power =6 parameter2 = 8 duration = 18 resist_dispel = 1 savingthrow = 1 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 74 target = 2 power =6 duration = 18 resist_dispel = 1 savingthrow = 1 END

	//modify chromatic orb to be like in bg
		COPY_EXISTING ~SPWI118.SPL~ ~override~
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 12 savingthrow = 0 END
			LPF ALTER_SPELL_EFFECT INT_VAR savebonus = 6 END 
	END	
    ELSE BEGIN
        //make sol searing orb non-item spell 
        COPY_EXISTING ~SPPR614.SPL~ ~override~
            //get string refrences
            READ_LONG 0x0008 SpellName
            READ_LONG 0x0050 SpellDescr
        
        COPY_EXISTING ~SORB.ITM~ ~override~
            LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 139 RET BlindStrRef = parameter2 END

        COPY ~3ed/Spells/SolSearingOrb/SORB.SPL~ ~override/SPPR614.SPL~
            WRITE_LONG 0x0008 SpellName
            WRITE_LONG 0x0050 SpellDescr   
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 139 parameter2 =  BlindStrRef END
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 12 dicesize = 12 END
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 318 parameter2 = 2  target = 2 power =6  resist_dispel = 1  END //protection to non-undead
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 parameter2 = 524288  target = 2 power =6 timing = 1 resist_dispel = 1 savingthrow = 1  dicesize = 12 dicenumber = 3 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode = 12 parameter2 = 524288  target = 2 power =6 timing = 1 resist_dispel = 1 dicesize = 12 dicenumber = 3 END
        
        COPY_EXISTING ~SPPR614.SPL~ ~override/SPPR614.SPL~        
            READ_LONG 0x0050 ~descr_strref~
            STRING_SET_EVALUATE %descr_strref% @064    
    END
    
    //upgrade bolt of glory damage
    COPY_EXISTING ~BOLTPRIM.EFF~ ~override~
        LPF ALTER_EFF INT_VAR dicesize = 12 dicenumber = 4 END
    COPY_EXISTING ~BOLTUND.EFF~ ~override~
        LPF ALTER_EFF INT_VAR dicesize = 12 END        
    COPY_EXISTING ~BOLTELEM.EFF~ ~override~
        LPF ALTER_EFF INT_VAR dicesize = 8 END 	
    COPY_EXISTING ~BOLTDEM.EFF~ ~override~
        LPF ALTER_EFF INT_VAR dicesize = 12 END 
        
    COPY_EXISTING ~SPPR612.SPL~ ~override~ 
        LPF REPLACE_SUBSTRING INT_VAR strref_offset = 0x0050  STR_VAR substring_to_replace = ~6d6~ new_substring  = ~4d12~ END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset = 0x0050  STR_VAR substring_to_replace = ~8d6~ new_substring  = ~8d12~ END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset = 0x0050  STR_VAR substring_to_replace = ~3d4~ new_substring  = ~3d8~ END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset = 0x0050  STR_VAR substring_to_replace = ~10d6~ new_substring  = ~10d12~ END

   
    //update regeneration   
    COPY_EXISTING ~SPPR711.SPL~  ~override~
        WRITE_BYTE 0x0021 0b00000000 //allow everyone to use it       
        FOR (i=2;i<=30;i=i+1) BEGIN
            SET header_type = 0 - 1
            LPF DELETE_SPELL_HEADER INT_VAR header_type min_level = i END
        END
        
      
        LPF ALTER_SPELL_EFFECT INT_VAR duration_high = 60 END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 98 duration_high = 60 parameter1 = 2 parameter2 = 1 END
        
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 power =7 target = 2 duration = 1 timing = 0 insert_point = 0 STR_VAR resource = ~SPPR711~ END //remove prev cast effects 
        
        READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @060
        
        
   
    ACTION_IF NOT (~%GameId%~ STR_EQ  ~Iwd~) BEGIN
    
        ACTION_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN
        //fix saves for creeping doom
            COPY_EXISTING ~FLPR717A.SPL~ ~override~
                LPF ALTER_SPELL_EFFECT INT_VAR savingthrow = 0 END
        END
            
        COPY_EXISTING ~SPPR717.SPL~ ~override~ 
            SET savebonus = 0 - 2 
            LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 146 opcode = 326 parameter1 = 0 parameter2 = 0 savingthrow = 1 savebonus  END
    END
    
    
    //modify silence to have -2 save
     COPY_EXISTING ~SPPR211.SPL~ ~override~
        LPF ALTER_SPELL_EFFECT_EX INT_VAR savebonus = 0 - 2 END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset = 0x0050  STR_VAR substring_to_replace = ~-5~ new_substring  = ~-2~ END
        
        
    
/*     //update magic resistance to give incremental bonus
    COPY_EXISTING ~SPPR509.SPL~ ~override~
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 166 parameter2 = 0 END
        LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 target = 2 opcode =321 duration = 1 resist_dispel = 2 STR_VAR resource = ~SPPR509~  END
        
        PATCH_IF (~%GameId%~ STR_EQ ~Iwd~) OR (~%GameId%~ STR_EQ ~Bg2~) BEGIN
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 target = 2 opcode =321 duration = 1 resist_dispel = 2 STR_VAR resource = ~SPCL904~  END
        END
        READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @056
	
    //update resist magic to give incremental bonus
	ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) OR (~%GameId%~ STR_EQ ~Bg2~) BEGIN
        COPY_EXISTING ~SPCL904.SPL~ ~override~
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 166 parameter2 = 0 END
        LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 target = 2 opcode =321 duration = 1 resist_dispel = 2 STR_VAR resource = ~SPCL904~  END
        LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 target = 2 opcode =321 duration = 1 resist_dispel = 2 STR_VAR resource = ~SPPR509~  END
        READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @057
    END  */
    
    //add half damage at failed saves on reflex to glyph of warding    
    COPY_EXISTING ~SPPR304.SPL~ ~override~
        SET savingthrow = 1 << 24
        LPF CLONE_EFFECT INT_VAR match_opcode = 12 savingthrow END 
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 12 dicesize = 2 END
        READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @063
    
    //modify some high level wizard spells
    
    //increase duration of mantle to 1 round/level
    COPY_EXISTING ~SPWI708.SPL~ ~override~
        FOR (i=2;i<=30;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i END
        END
        FOR (i=1;i<=30;i=i+1) BEGIN
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high = 6*i END
        END
        READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @301
    //increase duration of improved mantle to 1 round/level    
    COPY_EXISTING ~SPWI808.SPL~ ~override~
        FOR (i=2;i<=30;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i END
        END
        FOR (i=1;i<=30;i=i+1) BEGIN
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high = 6*i END
        END
        READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @302
    //increase duration of absolute immunity to 1 round/level    
    COPY_EXISTING ~SPWI907.SPL~ ~override~
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 120 target = 1 parameter1 = 6 resist_dispel = 3 END //add resist to +6 weapons
        FOR (i=2;i<=30;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i END
        END
        FOR (i=1;i<=30;i=i+1) BEGIN
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high = 6*i END
        END
        READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @303
        
        
    // make energy drain drain 2d4 levels 
    COPY_EXISTING ~SPWI914.SPL~ ~override~    
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 216 probability1 = 5 END //2 
        LPF CLONE_EFFECT INT_VAR match_opcode = 216 probability2 = 6 probability1 = 18  multi_match = 1 parameter1 = 3 END //3
        LPF CLONE_EFFECT INT_VAR match_opcode = 216 probability2 = 19 probability1 = 38  multi_match = 1 parameter1 = 4 END //4
        LPF CLONE_EFFECT INT_VAR match_opcode = 216 probability2 = 39 probability1 = 64  multi_match = 1 parameter1 = 5 END //5
        LPF CLONE_EFFECT INT_VAR match_opcode = 216 probability2 = 65 probability1 = 83  multi_match = 1 parameter1 = 6 END //6
        LPF CLONE_EFFECT INT_VAR match_opcode = 216 probability2 = 84 probability1 = 95  multi_match = 1 parameter1 = 7 END //7
        LPF CLONE_EFFECT INT_VAR match_opcode = 216 probability2 = 96 probability1 = 100  multi_match = 1 parameter1 = 8 END //8    
        READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @304
    
    
    
    //make contagion strike 3 times
    COPY_EXISTING ~SPWI409.SPL~ ~override~  
        FOR (i=1;i<=2;i=i+1) BEGIN
            LPF CLONE_EFFECT INT_VAR match_opcode = 78 match_parameter2 = 4 multi_match = 1 timing = 4 duration = i*6 END
            LPF CLONE_EFFECT INT_VAR match_opcode = 78 match_parameter2 = 9 multi_match = 1 timing = 4 duration = i*6 END
            LPF CLONE_EFFECT INT_VAR match_opcode = 78 match_parameter2 = 5 multi_match = 1 timing = 4 duration = i*6 END
        END        
        READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @305
        
        
    //make color spray work on enemies with more than 4 hd
     COPY_EXISTING ~SPWI105.SPL~ ~override~  
        LPF CLONE_EFFECT INT_VAR match_opcode = 39 dicenumber = 0  dicesize = 5 duration = 6 END 
        LPF CLONE_EFFECT INT_VAR match_opcode = 7 dicenumber = 0  dicesize = 5 duration = 6 END 
        LPF CLONE_EFFECT INT_VAR match_opcode = 142 dicenumber = 0  dicesize = 5 duration = 6 END 
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @306
        
        
    //modify descriptions for melfs minute meteors and energy blades
    COPY_EXISTING ~SPWI325.SPL~ ~override~
        LPF REPLACE_SUBSTRING INT_VAR strref_offset = 0x0050  substring_to_replace_ref = 20001 new_substring_ref = 20002 END
      
    ACTION_IF NOT (~%GameId%~ STR_EQ ~Bg1~) BEGIN
        COPY_EXISTING ~SPWI920.SPL~ ~override~
            LPF REPLACE_SUBSTRING INT_VAR strref_offset = 0x0050  substring_to_replace_ref = 20003 new_substring_ref = 20004 END 
        COPY_EXISTING ~SPPR721.SPL~ ~override~
            LPF REPLACE_SUBSTRING INT_VAR strref_offset = 0x0050  substring_to_replace_ref = 20003 new_substring_ref = 20004 END             
    END
    
    
    
    //modfy enchanted weapon
    OUTER_FOR (i=1;i<=5;i=i+1) BEGIN
        COPY ~3ed/Spells/EnchantedWeapon/ENC_WP1.SPL~ ~override/ENC_WPD%i%.SPL~
            SPRINT resource EVALUATE_BUFFER ~ENC_WPD%i%~
            LPF ALTER_SPELL_EFFECT INT_VAR opcode = 321 STR_VAR resource END
        COPY ~3ed/Spells/EnchantedWeapon/ENC_WP2.SPL~ ~override/ENC_WPA%i%.SPL~
            SPRINT resource EVALUATE_BUFFER ~ENC_WPA%i%~
            LPF ALTER_SPELL_EFFECT INT_VAR opcode = 321 STR_VAR resource END
            
        COPY_EXISTING ~SHLD_AC1.EFF~    ~override/ENC_WPD%i%.EFF~
            WRITE_EVALUATED_ASCII 0x0030 ~ENC_WPD%i%~
        
        COPY_EXISTING ~SHLD_AC1.EFF~    ~override/ENC_WPA%i%.EFF~
            WRITE_EVALUATED_ASCII 0x0030 ~ENC_WPA%i%~
            
    END
    
    //fix iwd spell
    ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
        COPY_EXISTING ~SPWI417.SPL~  ~override~
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 214 END 
        LPF ALTER_SPELL_HEADER INT_VAR target = 1 speed = 4 END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 duration = 1 insert_point = 0 STR_VAR resource = ~SPWI417~ END
        LPF ALTER_SPELL_EFFECT INT_VAR target = 2 resist_dispel = 3 END
        FOR (i=2;i<=30;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ALTER_SPELL_HEADER INT_VAR header = i  min_level = i END
        END
        LPF ADD_SPELL_EFFECT INT_VAR target = 2 ocpode = 345 power = 4 special = 3 resist_dispel = 3 END
        
    END
    
    COPY_EXISTING ~SPWI417.SPL~  ~override~
        READ_SHORT 0x0068 "Nheaders" //number of headers
        
        FOR (i=1;i<=Nheaders;i=i+1) BEGIN
        
            SET max_ench = i/4
            SET max_ench = max_ench<1 ? 1 : max_ench
            SET max_ench = max_ench>5 ? 5 : max_ench
            
            FOR (k=1;k<=max_ench;k=k+1) BEGIN
                SPRINT resource EVALUATE_BUFFER ~ENC_WPD%k%~
                LPF ADD_SPELL_EFFECT INT_VAR header = i target = 2 opcode = 272 power = 4 resist_dispel = 3 duration = i*30 parameter1 = 1 STR_VAR resource END
                SPRINT resource EVALUATE_BUFFER ~ENC_WPA%k%~
                LPF ADD_SPELL_EFFECT INT_VAR header = i target = 2 opcode = 272 power = 4 resist_dispel = 3 duration = i*30 parameter1 = 1 STR_VAR resource END
                LPF ALTER_SPELL_EFFECT INT_VAR header = i match_opcode = 345 parameter1 = k STR_VAR resource END
            END
                       
        END
        READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @307
        
        
    //modify shillelagh
    COPY_EXISTING ~SPPR110.SPL~ ~override~
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=1;i<=Nheaders;i=i+1) BEGIN
            LPF ALTER_SPELL_EFFECT INT_VAR duration = i*30 END
        END
        WRITE_BYTE 0x0021 (0b01000000)	//dissalow cleric casting it 
        READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @308
        
        
    //fix power for blade barrier effect
    COPY_EXISTING ~SPPR603D.SPL~ ~override~
        LPF ALTER_SPELL_EFFECT INT_VAR power = 6 END
        
    //fix mislead, project image     and simulacrum
	COPY_EXISTING ~SPWI607.SPL~ ~override~
		//spell starts from lvl 12 we need to start it from level 9
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 insert_point=1 END
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 insert_point=1 END
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 insert_point=1 END
		
		FOR (i=1;i<=4;i=i+1) BEGIN
			SET lvl = 1+ (7+i)*(i>1)
			LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = lvl END
			LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high = (i + 8)*6 END
		END

    COPY_EXISTING ~MISLEAD.SPL~ ~override~    
        //dissalow attacks to caster
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 1 target = 1 timing = 9 duration = 1 END
        SET parameter1 = 0 - 150994945 
        LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 1 match_parameter2 = 1 parameter1  END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 1 duration = 1 insert_point = 0 STR_VAR resource = ~RPDSHTBN~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 1 duration = 1 insert_point = 0 STR_VAR resource = ~FLRSTKBN~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 1 duration = 7 insert_point = 0 STR_VAR resource = ~RPDSHTBN~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 1 duration = 7 insert_point = 0 STR_VAR resource = ~FLRSTKBN~ END   
        
    COPY_EXISTING    ~SIMULACR.SPL~ ~override~
        //disallow using items
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 144   parameter2 = 6 target = 1 timing = 9 duration = 1 insert_point = 0 END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 144   parameter2 = 8 target = 1 timing = 9 duration = 1 insert_point = 0 END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 144   parameter2 = 9 target = 1 timing = 9 duration = 1 insert_point = 0 END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 144   parameter2 = 10 target = 1 timing = 9 duration = 1 insert_point = 0 END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 144   parameter2 = 11 target = 1 timing = 9 duration = 1 insert_point = 0 END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 144   parameter2 = 12 target = 1 timing = 9 duration = 1 insert_point = 0 END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 1   parameter1 = 50 parameter2 = 2 target = 1 timing = 9 duration = 1 insert_point = 0 END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 1 duration = 1 insert_point = 0 STR_VAR resource = ~RPDSHTBN~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 1 duration = 1 insert_point = 0 STR_VAR resource = ~FLRSTKBN~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 1 duration = 7 insert_point = 0 STR_VAR resource = ~RPDSHTBN~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 1 duration = 7 insert_point = 0 STR_VAR resource = ~FLRSTKBN~ END   
        
    COPY_EXISTING ~PROJIMAG.SPL~ ~override~    
        //dissalow attacks to caster
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 1 target = 1 timing = 9 duration = 1 END
        SET parameter1 = 0 - 150994945 
        LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 1 match_parameter2 = 1 parameter1  END           


    //change protection from the elements to SET resistances
    COPY_EXISTING ~SPWI702.SPL~ ~override~
        LPF ALTER_SPELL_EFFECT_EX INT_VAR match_parameter1 = 75 parameter2 = 1 END
        
    