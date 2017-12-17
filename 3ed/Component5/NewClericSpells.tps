	
	
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
	//make divine favor into cleric spell
	COPY_EXISTING ~ohtyr2.SPL~ ~override~
		LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_level=5 spell_type=2 END
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
		WRITE_BYTE 0x0034 3 //spell level
		FOR (i=1;i<=20;i=i+1) BEGIN
			SET hp_bonus=i
			PATCH_IF (hp_bonus>15) BEGIN
				SET hp_bonus=15
			END
			SET hp_bonus=hp_bonus+5
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=18  parameter1=hp_bonus header=i END //hp
		END
		LPF ALTER_SPELL_EFFECT INT_VAR power=3 END //update power
		LPF ALTER_SPELL_HEADER INT_VAR projectile=158 target=5 STR_VAR icon=~MASSAIDB~ END //30 ft radius around caster, icon
		WRITE_ASCII 0x003a ~MASSAIDC~ #8 //spellbook icon
		
		ADD_SPELL "override/MASSAID.spl" 1  3 CLERIC_MASS_AID		
			SPRINT resource EVALUATE_BUFFER ~%DEST_RES%~		
			LPF ADD_SPELL_EFFECT INT_VAR  opcode = 321 power=1 target=2  duration=1 timing=0 resist_dispel=3 insert_point=0 STR_VAR resource END //remove effects from previous cast
	
		COPY_EXISTING ~SPPR201.SPL~ ~override~
			LPF ADD_SPELL_EFFECT INT_VAR  opcode = 321 power=1 target=2  duration=1 timing=0 resist_dispel=3 insert_point=0 STR_VAR resource END //remove effects of mass aid from recipient of simple aid
			
			
	//Disallow clerics to cast animal summoning 1,2,3 and poison
	COPY_EXISTING ~SPPR402.SPL~ ~override~ // animal summoning 1
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)
	COPY_EXISTING ~SPPR411.SPL~ ~override~ // poison
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)
	COPY_EXISTING ~SPPR501.SPL~ ~override~ // animal summoning 2
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)
	COPY_EXISTING ~SPPR602.SPL~ ~override~ // animal summoning 1
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)		
		
		
	ACTION_IF NOT (~%GamedId%~ STR_EQ ~Iwd~) BEGIN
		//Cure moderate wounds
		COPY ~3ed/Spells/CureModerateWounds~ ~override~
		COPY_EXISTING ~3ed/Spells/CureModerateWounds/rgspa02.spl~ ~override~
			SAY NAME1 @014
			SAY UNIDENTIFIED_DESC @015
			ADD_SPELL "override/rgspa02.spl" 1  2 CLERIC_CURE_MODERATE_WOUNDS
			
		//Cause light wounds	
		COPY ~3ed/Spells/CauseLightWounds~ ~override~
		COPY_EXISTING ~3ed/Spells/CauseLightWounds/rgspb01.spl~ ~override~
			SAY NAME1 @019
			SAY UNIDENTIFIED_DESC @020
			ADD_SPELL "override/rgspb01.spl" 1  1 CLERIC_CAUSE_LIGHT_WOUNDS
	
		//Cause moderate wounds
		COPY ~3ed/Spells/CauseModerateWounds~ ~override~
		COPY_EXISTING ~3ed/Spells/CauseModerateWounds/rgspb02.spl~ ~override~
			SAY NAME1 @021
			SAY UNIDENTIFIED_DESC @022
			ADD_SPELL "override/rgspb02.spl" 1  2 CLERIC_CAUSE_MODERATE_WOUNDS
	
		//Cause medium wounds
		COPY ~3ed/Spells/CauseMediumWounds~ ~override~
		COPY_EXISTING ~3ed/Spells/CauseMediumWounds/rgspb03.spl~ ~override~
			SAY NAME1 @023
			SAY UNIDENTIFIED_DESC @024
			ADD_SPELL "override/rgspb03.spl" 1  3 CLERIC_CAUSE_MEDIUM_WOUNDS			
	END
		

    // mass cure moderate wounds - medium and critical
    
    COPY ~3ed/Spells/MassCure/MSCURE1C.BAM~ ~override~
    COPY ~3ed/Spells/MassCure/MSCURE2C.BAM~ ~override~
    COPY ~3ed/Spells/MassCure/MSCURE1B.BAM~ ~override~
    COPY ~3ed/Spells/MassCure/MSCURE2B.BAM~ ~override~
    
    COPY_EXISTING ~SPPR514.SPL~  ~override/MSCURE1.SPL~
        WRITE_LONG 0x0034 6 //spell level
        WRITE_ASCII 0x003a ~MSCURE1C~ #8 //spellbook icon
        WRITE_BYTE 0x0021 0b10000000 //remove from cleric spell list
        LPF ALTER_SPELL_EFFECT INT_VAR dicenumber = 3 END
        LPF ALTER_SPELL_HEADER STR_VAR icon = ~MSCURE1B~ END
		SAY NAME1 @215
		SAY UNIDENTIFIED_DESC @216
		ADD_SPELL "override/MSCURE1.SPL" 1  6 CLERIC_MASS_CURE_MEDIUM        
    
    // mass cure critical wounds
    
    COPY_EXISTING ~SPPR514.SPL~  ~override/MSCURE2.SPL~
        WRITE_LONG 0x0034 7 //spell level
        WRITE_ASCII 0x003a ~MSCURE2C~ #8 //spellbook icon
        WRITE_BYTE 0x0021 0b10000000 //remove from cleric spell list
        LPF ALTER_SPELL_EFFECT INT_VAR dicenumber = 5 END
        LPF ALTER_SPELL_HEADER STR_VAR icon = ~MSCURE2B~ END
		SAY NAME1 @217
		SAY UNIDENTIFIED_DESC @218
		ADD_SPELL "override/MSCURE2.SPL" 1  7 CLERIC_MASS_CURE_CRITICAL    
	
			