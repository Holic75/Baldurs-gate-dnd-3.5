	
	
	ACTION_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
		//make exaltation into cleric spell	
		COPY_EXISTING ~ohtyr1.SPL~ ~override~
			LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_level=3 spell_type=2 END
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @101
	END
	
	//make lathander boon into cleric spell (rename to Diety's boon)
	COPY_EXISTING ~SPCL741.SPL~ ~override~
		LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_level=6 spell_type=2 END
		READ_LONG 0x0008 ~spell_name~
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %spell_name% @102
		STRING_SET_EVALUATE %descr_strref% @103
	//make divine favor into cleric spell (duration to 10 rounds)
	COPY_EXISTING ~ohtyr2.SPL~ ~override~
		LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_level=5 spell_type=2 END
        LPF ALTER_SPELL_EFFECT INT_VAR duration_high = 10*6 END 
		READ_LONG 0x0050 ~descr_strref~
        WRITE_ASCII 0x003a ~OHTYR2C~ //set icon (it is somehow not set in bg2)
		STRING_SET_EVALUATE %descr_strref% @104	
        
	//making seeking sword give only one additional apr and creating headers for levels 5-9 (also make lvl 3 cleric spell)
	COPY_EXISTING ~SPCL731.SPL~ ~override~ 
		LPF ALTER_SPELL_HEADER INT_VAR  header=1 min_level=10 END
		FOR (i=10;i>=6;i=i - 1) BEGIN
			LPF ADD_SPELL_HEADER INT_VAR  insert_point=1 copy_header=1 END
			LPF ALTER_SPELL_HEADER INT_VAR  header=2 min_level=i END
			LPF ALTER_SPELL_EFFECT INT_VAR header = 2 duration_high=6*i END
		END
		LPF ALTER_SPELL_HEADER INT_VAR  header=1 min_level=1 END
		LPF ALTER_SPELL_EFFECT INT_VAR header = 1 duration_high=30 END
		
		LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_level=3 spell_type=2 END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @105
    //make strom shield into cleric spell
	COPY_EXISTING ~SPCL721.SPL~ ~override~
		LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_level=6 spell_type=2 END
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @106		
	//add stoneskin as possible 6 level cleric spell
	COPY_EXISTING ~SPWI408.SPL~ ~override/PRSTNSK.SPL~
		LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_level=6 spell_type=2 END
        SAY UNIDENTIFIED_DESC @107
		ACTION_DEFINE_ASSOCIATIVE_ARRAY extended_spell_list BEGIN   "PRSTNSK" => "SPWI408"  END
	
	//add haste as lvl4 potential cleric spell
	COPY_EXISTING ~SPWI305.SPL~ ~override/PRHASTE.SPL~
		LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_level=4 spell_type=2 END
        SAY UNIDENTIFIED_DESC @108	
		ACTION_DEFINE_ASSOCIATIVE_ARRAY extended_spell_list BEGIN  "PRHASTE" => "SPWI305"  END
	
	
	
	//give cleric monk's sun soulray  (searing light)
	COPY_EXISTING ~SPCL236.SPL~ ~override/SRLIGHT.SPL~
		LPF ALTER_SPELL_EFFECT INT_VAR  power=3 END //lvl3 
		LPF ALTER_SPELL_HEADER INT_VAR speed=3 location=2 END //casting speed 3
		SAY NAME1 @109
		SAY UNIDENTIFIED_DESC @110
		WRITE_BYTE 0x0021 0b10000000 //disallow druids to cast it
		WRITE_SHORT 0x0022 15 //invocation
		WRITE_BYTE 0x0025 6//invocation
		WRITE_BYTE 0x0027 10//offensive damage
		WRITE_BYTE 0x0034 3 //spell level
		WRITE_SHORT 0x001c 2 //cleric spell
		ADD_SPELL "override/SRLIGHT.spl" 1  3 CLERIC_SEARING_LIGHT
		DEFINE_ASSOCIATIVE_ARRAY extended_spell_list BEGIN  "%DEST_RES%" => "SPCL236" END

	
	//make aid 10' radius
	COPY ~3ed/Spells/MassAid~ ~override~
	COPY_EXISTING ~SPPR201.SPL~ ~override/MASSAID.SPL~
		SAY NAME1 @111
		SAY UNIDENTIFIED_DESC @112
        READ_SHORT 0x0068 "Nheaders" //number of headers
		WRITE_BYTE 0x0034 3 //spell level
		FOR (i=1;i<=Nheaders;i=i+1) BEGIN
			SET hp_bonus=i+2
			PATCH_IF (hp_bonus>15) BEGIN
				SET hp_bonus=15
			END
			SET hp_bonus=hp_bonus+5
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=18  parameter1=hp_bonus header=i END //hp
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = 30*(i+2) header=i END
		END
		LPF ALTER_SPELL_EFFECT INT_VAR power=3 END //update power
		LPF ALTER_SPELL_HEADER INT_VAR projectile=158 target=5 STR_VAR icon=~MASSAIDB~ END //30 ft radius around caster, icon
		WRITE_ASCII 0x003a ~MASSAIDC~ #8 //spellbook icon
		
		ADD_SPELL "override/MASSAID.spl" 1  3 CLERIC_MASS_AID		
			SPRINT resource EVALUATE_BUFFER ~%DEST_RES%~		
			LPF ADD_SPELL_EFFECT INT_VAR  opcode = 321 power=1 target=2  duration=1 timing=0 resist_dispel=3 insert_point=0 STR_VAR resource END //remove effects from previous cast
	
		COPY_EXISTING ~SPPR201.SPL~ ~override~
			LPF ADD_SPELL_EFFECT INT_VAR  opcode = 321 power=1 target=2  duration=1 timing=0 resist_dispel=3 insert_point=0 STR_VAR resource END //remove effects of mass aid from recipient of simple aid
			
			
	//Disallow clerics to cast animal summoning 1,2,3, conjure animals and poison
	COPY_EXISTING ~SPPR402.SPL~ ~override~ // animal summoning 1
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)
	COPY_EXISTING ~SPPR411.SPL~ ~override~ // poison
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)
	COPY_EXISTING ~SPPR501.SPL~ ~override~ // animal summoning 2
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)
	COPY_EXISTING ~SPPR602.SPL~ ~override~ // animal summoning 3
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)		
	COPY_EXISTING ~SPPR604.SPL~ ~override~ // conjure animals
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)				
		
	ACTION_IF NOT (~%GamedId%~ STR_EQ ~Iwd~) BEGIN
		//Cure moderate wounds
		COPY ~3ed/Spells/CureModerateWounds~ ~override~
		COPY_EXISTING ~3ed/Spells/CureModerateWounds/rgspa02.spl~ ~override~
        	LPF FIX_HEAL_3ED INT_VAR power = 2 target = 2 resist_dispel_heal = 2 resist_dispel_harm = 1 heal_amount = 14 savingthrow = 1  
                STR_VAR heal_prefix = ~EN_CU~ harm_prefix = ~EN_HR~ END
			SAY NAME1 @014
			SAY UNIDENTIFIED_DESC @015
			ADD_SPELL "override/rgspa02.spl" 1  2 CLERIC_CURE_MODERATE_WOUNDS
			
		//Cause light wounds	
		COPY ~3ed/Spells/CauseLightWounds~ ~override~
		COPY_EXISTING ~3ed/Spells/CauseLightWounds/rgspb01.spl~ ~override~
            LPF FIX_HARM_3ED INT_VAR power = 1 target = 2 resist_dispel_heal = 2 resist_dispel_harm = 1 heal_amount = 8 savingthrow = 1  
                STR_VAR heal_prefix = ~EN_CU~ harm_prefix = ~EN_HR~ END        
			SAY NAME1 @019
			SAY UNIDENTIFIED_DESC @020
			ADD_SPELL "override/rgspb01.spl" 1  1 CLERIC_CAUSE_LIGHT_WOUNDS
	
		//Cause moderate wounds
		COPY ~3ed/Spells/CauseModerateWounds~ ~override~
		COPY_EXISTING ~3ed/Spells/CauseModerateWounds/rgspb02.spl~ ~override~
            LPF FIX_HARM_3ED INT_VAR power = 2 target = 2 resist_dispel_heal = 2 resist_dispel_harm = 1 heal_amount = 14 savingthrow = 1  
                STR_VAR heal_prefix = ~EN_CU~ harm_prefix = ~EN_HR~ END
			SAY NAME1 @021
			SAY UNIDENTIFIED_DESC @022
			ADD_SPELL "override/rgspb02.spl" 1  2 CLERIC_CAUSE_MODERATE_WOUNDS
	
		//Cause medium wounds
		COPY ~3ed/Spells/CauseMediumWounds~ ~override~
		COPY_EXISTING ~3ed/Spells/CauseMediumWounds/rgspb03.spl~ ~override~
            LPF FIX_HARM_3ED INT_VAR power = 3 target = 2 resist_dispel_heal = 2 resist_dispel_harm = 1 heal_amount = 20 savingthrow = 1  
                STR_VAR heal_prefix = ~EN_CU~ harm_prefix = ~EN_HR~ END
			SAY NAME1 @023
			SAY UNIDENTIFIED_DESC @024
			ADD_SPELL "override/rgspb03.spl" 1  3 CLERIC_CAUSE_MEDIUM_WOUNDS			
	END
		

    // mass cure moderate wounds - medium and critical
    
    COPY ~3ed/Spells/MassCure/MSCURE1C.BAM~ ~override~
    COPY ~3ed/Spells/MassCure/MSCURE2C.BAM~ ~override~
    COPY ~3ed/Spells/MassCure/MSCURE1B.BAM~ ~override~
    COPY ~3ed/Spells/MassCure/MSCURE2B.BAM~ ~override~
    
    // 3d8 +1/levl heal /dmg
    COPY_EXISTING ~SPPR514.SPL~  ~override/MSCURE1.SPL~
        WRITE_LONG 0x0034 6 //spell level
        WRITE_ASCII 0x003a ~MSCURE1C~ #8 //spellbook icon
        WRITE_BYTE 0x0021 0b10000000 //remove from druid spell list
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete  = 326 END
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete  = 318 END       
        LPF ALTER_SPELL_HEADER INT_VAR projectile = 149 STR_VAR icon = ~MSCURE1B~ END
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=0;i<Nheaders;i=i+1) BEGIN
            LPF FIX_HEAL_3ED INT_VAR header = i+1 power = 6 target = 2 resist_dispel_heal = 2 resist_dispel_harm = 1 heal_amount = i+9 savingthrow = 1  enemy_ally = 1
                STR_VAR heal_prefix = ~EN_C3~ harm_prefix = ~EN_H3~ END               
        END       
        LPF ALTER_SPELL_EFFECT INT_VAR power = 6 END
		SAY NAME1 @215
		SAY UNIDENTIFIED_DESC @216
		ADD_SPELL "override/MSCURE1.SPL" 1  6 CLERIC_MASS_CURE_MEDIUM        
    
    // mass cure critical wounds (5d8 + 1/lvl heal/dmg)
    
    COPY_EXISTING ~SPPR514.SPL~  ~override/MSCURE2.SPL~
        WRITE_LONG 0x0034 7 //spell level
        WRITE_ASCII 0x003a ~MSCURE2C~ #8 //spellbook icon
        WRITE_BYTE 0x0021 0b10000000 //remove from druid spell list
        LPF ALTER_SPELL_HEADER INT_VAR projectile = 149 STR_VAR icon = ~MSCURE2B~ END
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=0;i<Nheaders;i=i+1) BEGIN
            LPF FIX_HEAL_3ED INT_VAR header = i+1 power = 6 target = 2 resist_dispel_heal = 2 resist_dispel_harm = 1 heal_amount = i+9 savingthrow = 1  enemy_ally = 1
                STR_VAR heal_prefix = ~EN_C5~ harm_prefix = ~EN_H5~ END               
        END        
        LPF ALTER_SPELL_EFFECT INT_VAR power = 7 END
		SAY NAME1 @217
		SAY UNIDENTIFIED_DESC @218
		ADD_SPELL "override/MSCURE2.SPL" 1  7 CLERIC_MASS_CURE_CRITICAL


	
	//add enchanted weapon as 4th level cleric spell
    COPY_EXISTING ~SPWI417.SPL~ ~override/CLR_EWP.SPL~
        LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_type = 2 END
        SAY UNIDENTIFIED_DESC @309
		WRITE_BYTE 0x0021 0b10000000 //disallow druids to cast it
        WRITE_BYTE 0x001f 0 

        ADD_SPELL "override/CLR_EWP.SPL" 1  4 CLERIC_ENCHANTED_WEAPON
        DEFINE_ASSOCIATIVE_ARRAY extended_spell_list BEGIN  "%DEST_RES%" => "SPWI417" END
        

    
    //add magic weapon as lvl1 cleric spell
    COPY ~3ed/Spells/EnchantedWeapon/MAGWEAPB.BAM~ ~override~
    COPY ~3ed/Spells/EnchantedWeapon/MAGWEAPC.BAM~ ~override~
    COPY_EXISTING ~SPWI417.SPL~ ~override/CLR_MWP.SPL~
        WRITE_ASCII 0x003a ~MAGWEAPC~ #8 //spellbook icon        
        LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_level = 1 spell_type = 2 END
        SAY NAME1 @310
        SAY UNIDENTIFIED_DESC @311
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 272 END
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=1;i<=Nheaders;i=i+1) BEGIN
            LPF ADD_SPELL_EFFECT INT_VAR header = i target = 2 opcode = 272 power = 1 resist_dispel = 3 duration = i*30 parameter1 = 1 STR_VAR resource = ~ENC_WPD1~ END
            LPF ADD_SPELL_EFFECT INT_VAR header = i target = 2 opcode = 272 power = 1 resist_dispel = 3 duration = i*30 parameter1 = 1 STR_VAR resource = ~ENC_WPA1~ END 
            LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_opcode = 345 power = 1 parameter1 =  1 END
        END        
        LPF ALTER_SPELL_HEADER STR_VAR icon = ~MAGWEAPB~ END
		WRITE_BYTE 0x0021 0b10000000 //disallow druids to cast it
        WRITE_BYTE 0x001f 0 
        ADD_SPELL "override/CLR_MWP.SPL" 1  1 CLERIC_MAGIC_WEAPON
        DEFINE_ASSOCIATIVE_ARRAY extended_spell_list BEGIN  "%DEST_RES%" => "SPWI417" END    
        
        
    //add magic vestment as level 3 cleric spell    
    COPY ~3ed/Spells/MagicVestment/MAGVESTB.BAM~ ~override~
    COPY ~3ed/Spells/MagicVestment/MAGVESTC.BAM~ ~override~

    OUTER_FOR (i=1;i<=5;i=i+1) BEGIN
        COPY ~3ed/Spells/MagicVestment/MAG_VST.SPL~ ~override/MAG_VST%i%.SPL~
            SPRINT resource EVALUATE_BUFFER ~MAG_VST%i%~
            LPF ALTER_SPELL_EFFECT INT_VAR opcode = 321 STR_VAR resource END
            
        COPY_EXISTING ~SHLD_AC1.EFF~    ~override/MAG_VST%i%.EFF~
            WRITE_EVALUATED_ASCII 0x0030 ~MAG_VST%i%~                  
    END    
    
       
    COPY_EXISTING ~SPWI417.SPL~ ~override/CLR_MVS.SPL~
        WRITE_ASCII 0x003a ~MAGVESTC~ #8 //spellbook icon        
        LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_level = 3 spell_type = 2 END
        SAY NAME1 @312
        SAY UNIDENTIFIED_DESC @313
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 272 END
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 345 END
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 321 END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 215  STR_VAR resource = ~ICARMOR~  END //armor animation
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 142 parameter2 = 12 END //armor icon
        LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 328 opcode = 282 parameter1 = 5 parameter2 = 4 special = 0 END //armor state
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=1;i<=Nheaders;i=i+1) BEGIN
            SET max_ench = i/4
            SET max_ench = max_ench<1 ? 1 : max_ench
            SET max_ench = max_ench>5 ? 5 : max_ench
            
            FOR (k=1;k<=max_ench;k=k+1) BEGIN
                SPRINT resource EVALUATE_BUFFER ~MAG_VST%k%~
                LPF ADD_SPELL_EFFECT INT_VAR header = i target = 2 opcode = 272 power = 4 resist_dispel = 3 duration = i*30 parameter1 = 1 STR_VAR resource END
            END                     
        END        
        LPF ALTER_SPELL_HEADER STR_VAR icon = ~MAGVESTB~ END
		WRITE_BYTE 0x0021 0b10000000 //disallow druids to cast it
        WRITE_BYTE 0x001f 0 
        ADD_SPELL "override/CLR_MVS.SPL" 1  3 CLERIC_MAGIC_VESTMENT
            SPRINT resource EVALUATE_BUFFER ~%DEST_RES%~		
			LPF ADD_SPELL_EFFECT INT_VAR  opcode = 321 power=3 target=2  duration=1 timing=0 resist_dispel=3 insert_point=0 STR_VAR resource END //remove effects from previous cast
    

    //mass cause wounds
    COPY ~3ed/Spells/MassCause/MSCAUS1C.BAM~ ~override~
    COPY ~3ed/Spells/MassCause/MSCAUS2C.BAM~ ~override~
    COPY ~3ed/Spells/MassCause/MSCAUS3C.BAM~ ~override~
    COPY ~3ed/Spells/MassCause/MSCAUS1B.BAM~ ~override~
    COPY ~3ed/Spells/MassCause/MSCAUS2B.BAM~ ~override~
    COPY ~3ed/Spells/MassCause/MSCAUS3B.BAM~ ~override~
    
    ACTION_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
        // 1d8 +1/levl heal /dmg
        COPY_EXISTING ~SPPR514.SPL~  ~override/MSCAUS1.SPL~
            WRITE_LONG 0x0034 5 //spell level
            WRITE_ASCII 0x003a ~MSCAUS1C~ #8 //spellbook icon
            WRITE_BYTE 0x0021 0b10000000 //remove from druid spell list
            LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete  = 326 END
            LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete  = 318 END       
            LPF ALTER_SPELL_HEADER INT_VAR projectile = 149 STR_VAR icon = ~MSCAUS1B~ END
            READ_SHORT 0x0068 "Nheaders" //number of headers
            FOR (i=0;i<Nheaders;i=i+1) BEGIN
                LPF FIX_HARM_3ED INT_VAR header = i+1 power = 6 target = 2 resist_dispel_heal = 2 resist_dispel_harm = 1 heal_amount = i+9 savingthrow = 1  enemy_ally = 1
                    STR_VAR heal_prefix = ~EN_C1~ harm_prefix = ~EN_H1~ END               
            END       
            LPF ALTER_SPELL_EFFECT INT_VAR power = 5 END
            SAY NAME1 @322
            SAY UNIDENTIFIED_DESC @323
            ADD_SPELL "override/MSCAUS1.SPL" 1  5 CLERIC_MASS_CAUSE     
    
    END
        
    // 3d8 +1/levl heal /dmg
    COPY_EXISTING ~SPPR514.SPL~  ~override/MSCAUS2.SPL~
        WRITE_LONG 0x0034 6 //spell level
        WRITE_ASCII 0x003a ~MSCAUS2C~ #8 //spellbook icon
        WRITE_BYTE 0x0021 0b10000000 //remove from druid spell list
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete  = 326 END
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete  = 318 END       
        LPF ALTER_SPELL_HEADER INT_VAR projectile = 149 STR_VAR icon = ~MSCAUS2B~ END
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=0;i<Nheaders;i=i+1) BEGIN
            LPF FIX_HARM_3ED INT_VAR header = i+1 power = 6 target = 2 resist_dispel_heal = 2 resist_dispel_harm = 1 heal_amount = i+9 savingthrow = 1  enemy_ally = 1
                STR_VAR heal_prefix = ~EN_C3~ harm_prefix = ~EN_H3~ END               
        END       
        LPF ALTER_SPELL_EFFECT INT_VAR power = 6 END
		SAY NAME1 @324
		SAY UNIDENTIFIED_DESC @325
		ADD_SPELL "override/MSCAUS2.SPL" 1  6 CLERIC_MASS_CAUSE_MEDIUM        
    
    // mass cure critical wounds (5d8 + 1/lvl heal/dmg)
    
    COPY_EXISTING ~SPPR514.SPL~  ~override/MSCAUS3.SPL~
        WRITE_LONG 0x0034 7 //spell level
        WRITE_ASCII 0x003a ~MSCAUS3C~ #8 //spellbook icon
        WRITE_BYTE 0x0021 0b10000000 //remove from druid spell list
        LPF ALTER_SPELL_HEADER INT_VAR projectile = 149 STR_VAR icon = ~MSCAUS3B~ END
        READ_SHORT 0x0068 "Nheaders" //number of headers
        FOR (i=0;i<Nheaders;i=i+1) BEGIN
            LPF FIX_HARM_3ED INT_VAR header = i+1 power = 6 target = 2 resist_dispel_heal = 2 resist_dispel_harm = 1 heal_amount = i+9 savingthrow = 1  enemy_ally = 1
                STR_VAR heal_prefix = ~EN_C5~ harm_prefix = ~EN_H5~ END               
        END        
        LPF ALTER_SPELL_EFFECT INT_VAR power = 7 END
		SAY NAME1 @326
		SAY UNIDENTIFIED_DESC @327
		ADD_SPELL "override/MSCAUS3.SPL" 1  7 CLERIC_MASS_CAUSE_CRITICAL         
        
        

	
        