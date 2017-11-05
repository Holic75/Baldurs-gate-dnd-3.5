	//allow druids to cast flame strike as 4th level spell
	COPY_EXISTING ~SPPR503.SPL~ ~override/DRDFSTK.SPL~ // flamestrike
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 ((cleric_usability BAND BNOT(0b10000000)) BOR (0b01000000))
		
		WRITE_LONG 0x0034 4 //spell level		

		LPF ALTER_SPELL_EFFECT INT_VAR power=4 END //set power lvl to 4
		SAY UNIDENTIFIED_DESC @201
		
		ADD_SPELL "override/DRDFSTK.spl" 1  4 DRUID_FLAMESTRIKE
			DEFINE_ASSOCIATIVE_ARRAY extended_spell_list BEGIN  "%DEST_RES%" => "SPPR503" END
		
	

	//add chain lightning to druid spell list
	COPY_EXISTING ~SPDR601.SPL~ ~override~ 
		SAY UNIDENTIFIED_DESC @202 //description
		READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 ((cleric_usability BAND BNOT(0b10000000)) BOR (0b01000000))
		ADD_SPELL "override/SPDR601.spl" 1  6 DRUID_CHAINLIGHTNING

	

		
	//add burning hands to druid spell list
		
	COPY_EXISTING ~SPWI103.SPL~ ~override/DRDBHDS.SPL~ 
		SAY UNIDENTIFIED_DESC @203 //description
		WRITE_BYTE 0x001e 0b00000000
		WRITE_BYTE 0x0021 0b01000000
		WRITE_SHORT 0x001c 2
		ADD_SPELL "override/DRDBHDS.spl" 1  1 DRUID_BURN_HANDS
			DEFINE_ASSOCIATIVE_ARRAY extended_spell_list BEGIN  "%DEST_RES%" => "SPWI103" END
	
	//remove bless from druid spell list
	COPY_EXISTING ~SPPR101.SPL~ ~override~ 
		WRITE_BYTE 0x0021 0b10000000
				
	//disallow druid to cast defensive harmony
	COPY_EXISTING ~SPPR406.SPL~ ~override~ 
		WRITE_BYTE 0x0021 0b10000000

				
	//allow druid to cast hold monster as 4-th level spell	
	COPY_EXISTING ~SPWI507.SPL~ ~override/DRHLDMN.SPL~
		WRITE_BYTE 0x0021 (0b01000000)	//dissalow cleric casting it 
		WRITE_BYTE 0x001F (0b00000000)  //clear invoker flag
		WRITE_LONG 0x0034 4 //spell level	
		WRITE_SHORT 0x001c 2// priest spell
		SAY UNIDENTIFIED_DESC @204 //description
		LPF ALTER_SPELL_EFFECT INT_VAR power=4 END //set power lvl to 4
		ADD_SPELL "override/DRHLDMN.spl" 1  4 DRUID_HOLD_MONSTER
			DEFINE_ASSOCIATIVE_ARRAY extended_spell_list BEGIN  "%DEST_RES%" => "SPWI507" END
	//allow druid to cast ice storm as 4-th level spell
	COPY_EXISTING ~SPWI404.SPL~ ~override/DRDIST.SPL~
		WRITE_BYTE 0x0021 (0b01000000)	//dissalow cleric casting it 
		WRITE_BYTE 0x001F (0b00000000)  //clear invoker flag	
		WRITE_SHORT 0x001c 2// priest spell
		SAY UNIDENTIFIED_DESC @205 //description
		ADD_SPELL "override/DRDIST.spl" 1  4 DRUID_ICE_STORM	
			DEFINE_ASSOCIATIVE_ARRAY extended_spell_list BEGIN  "%DEST_RES%" => "SPWI404" END
			
			
//adding sleep to druid spellbook 
	COPY_EXISTING ~SPWI116.SPL~ ~override/DRSLEEP.SPL~
		SAY UNIDENTIFIED_DESC @206 //description
			WRITE_BYTE 0x001e 0b00000000
			WRITE_BYTE 0x0021 0b01000000
			WRITE_SHORT 0x001c 2
		ADD_SPELL "override/DRSLEEP.spl" 1  1 DRUID_SLEEP
			DEFINE_ASSOCIATIVE_ARRAY extended_spell_list BEGIN  "%DEST_RES%" => "SPWI116" END
		
//adding camoufalge do druid spellbook	
	COPY ~3ed/Spells/Camouflage/DRCMFLGB.bam~ ~override~
	COPY ~3ed/Spells/Camouflage/DRCMFLGC.bam~ ~override~
	
	COPY ~3ed/Spells/Camouflage/DRCMFLG.spl~ ~override~
		FOR (i=1;i<=20;i=i+1) BEGIN
			LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=2 target=1 target_count=1 range=1 required_level=i speed=2 projectile=1  STR_VAR icon=~DRCMFLGB~ END
			LPF ADD_SPELL_EFFECT  INT_VAR  opcode=142 target=2 power=1 parameter2=58 timing=0 duration=i*60 resist_dispel=3 header=i  END //display icon
			LPF ADD_SPELL_EFFECT  INT_VAR  opcode=275 target=2 power=1 parameter1=20 parameter2=0 timing=0 duration=i*60 resist_dispel=3 header=i  END //+20 hide in shadows
			LPF ADD_SPELL_EFFECT  INT_VAR  opcode=59 target=2 power=1 parameter1=20 parameter2=0 timing=0 duration=i*60 resist_dispel=3 header=i  END //+20 move silently
			LPF ADD_SPELL_EFFECT  INT_VAR  opcode=66 target=2 power=1 parameter1=100 parameter2=0 timing=0 duration=i*60 resist_dispel=3 header=i  END //fade
			LPF ADD_SPELL_EFFECT  INT_VAR  opcode=9 target=2 power=1 parameter1=0 parameter2=1+256*256*40 timing=0 duration=i*60 resist_dispel=3 header=i  END //minor colour pulse
			LPF ADD_SPELL_EFFECT  INT_VAR  opcode=9 target=2 power=1 parameter1=0 parameter2=2+256*256*30 timing=0 duration=i*60 resist_dispel=3 header=i  END //major colour pulse
			LPF ADD_SPELL_EFFECT  INT_VAR  opcode=174 target=1 power=1  timing=0 duration=0 resist_dispel=3 header=i STR_VAR ~EFF_M33~  END //play sound
		END
		SAY NAME1 @207
		SAY UNIDENTIFIED_DESC @208
		ADD_SPELL "override/DRCMFLG.spl" 1  1 DRUID_CAMOUFLAGE 		
		SPRINT resource EVALUATE_BUFFER ~%DEST_RES%~		
			LPF ADD_SPELL_EFFECT INT_VAR  opcode = 321 power=1 target=2  duration=1 timing=0 resist_dispel=3 insert_point=0 STR_VAR resource END //remove effects from previous cast
			
			

    //Lesser animal summoning 1
	COPY ~3ed/Spells/AnimalSum1~ ~override~
	COPY_EXISTING ~rgspc01.spl~ ~override~
		SAY NAME1 @209
		SAY UNIDENTIFIED_DESC @210
		ADD_SPELL "override/rgspc01.spl" 1  1 DRUID_LESSER_SUMMONING_1
	
	//Lesser animal summoning 2
	COPY ~3ed/Spells/AnimalSum2~ ~override~
	COPY_EXISTING ~rgspc02.spl~ ~override~
		SAY NAME1 @211
		SAY UNIDENTIFIED_DESC @212	
		ADD_SPELL "override/rgspc02.spl" 1  2 DRUID_LESSER_SUMMONING_2
	
	//Lesser animal summoning 3
	COPY ~3ed/Spells/AnimalSum3~ ~override~
	COPY_EXISTING ~rgspc03.spl~ ~override~
		SAY NAME1 @213
		SAY UNIDENTIFIED_DESC @214
		ADD_SPELL "override/rgspc03.spl" 1  3 DRUID_LESSER_SUMMONING_3