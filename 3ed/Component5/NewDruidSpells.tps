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
    
    ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
        //remove bless from druid spell list
        COPY_EXISTING ~SPPR112.SPL~ ~override~ 
            WRITE_BYTE 0x0021 0b10000000
    END
				
	//disallow druid to cast defensive harmony
	COPY_EXISTING ~SPPR406.SPL~ ~override~ 
		WRITE_BYTE 0x0021 0b10000000
        
        
	//Disallow druid  to cast heal and harm
	COPY_EXISTING ~SPPR607.SPL~ ~override~ //heal
		WRITE_BYTE 0x0021 0b10000000
	COPY_EXISTING ~SPPR608.SPL~ ~override~ //heal
		WRITE_BYTE 0x0021 0b10000000
        
	//Disallow druid  to cast confusion
	COPY_EXISTING ~SPPR709.SPL~ ~override~ 
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
        LPF CONVERT_ARCANE_SPELL_TO_DIVINE INT_VAR allow_cleric = 0 END
        PATCH_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
            SAY UNIDENTIFIED_DESC @205 
        END
        ELSE BEGIN
            SAY UNIDENTIFIED_DESC @2051 
        END
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
        
    COPY_EXISTING ~dogwasu.cre~ ~override/rgdogsu.cre~
        LPF ALTER_CREATURE INT_VAR Level1 = 1 CurrentHp = 8 MaxHp = 8 THAC0 = 20 END 
        REPLACE_CRE_ITEM ~P1-4~ #0 #0 #0 ~IDENTIFIED~ ~weapon1~
	
	//Lesser animal summoning 2
	COPY ~3ed/Spells/AnimalSum2~ ~override~
	COPY_EXISTING ~rgspc02.spl~ ~override~
		SAY NAME1 @211
		SAY UNIDENTIFIED_DESC @212	
		ADD_SPELL "override/rgspc02.spl" 1  2 DRUID_LESSER_SUMMONING_2
        
    ACTION_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
        COPY_EXISTING ~wolfsu.cre~ ~override/rgwolfsu.cre~
            LPF ALTER_CREATURE INT_VAR Level1 = 3 CurrentHp = 18 MaxHp = 18 THAC0 = 18 APR = 1 END 
            REPLACE_CRE_ITEM ~P1-6~ #0 #0 #0 ~IDENTIFIED~ ~weapon1~
    END
    ELSE BEGIN
        COPY_EXISTING ~AS1wolf.cre~ ~override/rgwolfsu.cre~
            LPF ALTER_CREATURE INT_VAR Level1 = 3 CurrentHp = 18 MaxHp = 18 THAC0 = 18 APR = 1 END 
            REPLACE_CRE_ITEM ~P1-6~ #0 #0 #0 ~IDENTIFIED~ ~weapon1~       
    END
        
	//Lesser animal summoning 3
	COPY ~3ed/Spells/AnimalSum3~ ~override~
	COPY_EXISTING ~rgspc03.spl~ ~override~
		SAY NAME1 @213
		SAY UNIDENTIFIED_DESC @214
		ADD_SPELL "override/rgspc03.spl" 1  3 DRUID_LESSER_SUMMONING_3
        
        
    //make animal summoning I a bit stonger
    COPY_EXISTING ~SPANIM1.EFF~ ~override~
        WRITE_LONG 0x001c 20 //change power level from 14 to 20

        
    //add false dawn to druid's spellbook
    COPY_EXISTING ~SPPR609.SPL~ ~override~
        WRITE_BYTE 0x0021 0b00000000
        
    //add sunray to druid spellbook
    COPY_EXISTING ~SPPR707.SPL~ ~override~
        WRITE_BYTE 0x0021 0b00000000        
        
        
    //add vigorous cycle  to cleric and druid spell lists
    
    COPY ~3ed/Spells/VigorousCycle/VIGCYCLB.BAM~ ~override~
    COPY ~3ed/Spells/VigorousCycle/VIGCYCLC.BAM~ ~override~
    
    COPY_EXISTING ~SPPR711.SPL~  ~override/PR_RGN6.SPL~
        WRITE_BYTE 0x0021 0b00000000 //allow everyone to use it 
        WRITE_LONG 0x0034 6 //spell level
        WRITE_ASCII 0x003a ~VIGCYCLC~ #8 //spellbook icon
        
        FOR (i=2;i<=30;i=i+1) BEGIN
            SET header_type = 0 - 1
            LPF DELETE_SPELL_HEADER INT_VAR header_type min_level = i END
        END
        
        //min level - 11
        LPF ALTER_SPELL_EFFECT INT_VAR duration_high = 66 power = 6 END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 98 parameter1 = 2 parameter2 = 3 END //1 hp per 2 seconds
       
        
        LPF ALTER_SPELL_HEADER INT_VAR target = 5 projectile = 162  STR_VAR icon  = ~VIGCYCLB~ END
        
        FOR (i=12;i<=30;i=i+1) BEGIN    
            SET header = i - 10        
            LPF ADD_SPELL_HEADER INT_VAR copy_header=1 END
            LPF ALTER_SPELL_HEADER INT_VAR header min_level = i END
            
            LPF ALTER_SPELL_EFFECT INT_VAR header duration_high = i*6 END
        END

        SAY NAME1 @58
		SAY UNIDENTIFIED_DESC @59
        ADD_SPELL "override/PR_RGN6.SPL" 1  6 CLERIC_VIGOR_CYCLE
		SPRINT resource EVALUATE_BUFFER ~%DEST_RES%~		
			LPF ADD_SPELL_EFFECT INT_VAR  opcode = 321 power=6 target=2  duration=1 timing=0 insert_point=0 STR_VAR resource END //remove effects from previous cast
			        
        //add removal of vigorous cycle effects if casting regeneration
        COPY_EXISTING ~SPPR711.SPL~ ~override~
             LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 power =7 target = 2 duration = 1 timing = 0 insert_point = 0 STR_VAR resource END 
        
    //aura of vitality 
    
    COPY ~3ed/Spells/AuraVitality/AURAVITC.BAM~ ~override~
    COPY ~3ed/Spells/AuraVitality/AURAVITB.BAM~ ~override~
    
    SET NameStrRef = RESOLVE_STR_REF (@61)
    SET DescStrRef = RESOLVE_STR_REF (@62)
    
    COPY_EXISTING ~SPPR312.SPL~ ~override/AURAVITD.SPL~
        READ_BYTE 0x0021 ~cleric_usability~
		WRITE_BYTE 0x0021 (cleric_usability BOR 0b01000000)
        WRITE_ASCII 0x003a ~AURAVITC~ #8 //spellbook icon
        WRITE_LONG 0x0050 DescStrRef
        WRITE_LONG 0x0008 NameStrRef
        WRITE_LONG 0x0034 7 //spell level
        LPF ALTER_SPELL_HEADER STR_VAR icon  = ~AURAVITB~ END
        
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 97 END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 44 parameter1 = 4 parameter2 =0 END
        LPF CLONE_EFFECT INT_VAR match_opcode = 44 opcode = 15 END
        LPF CLONE_EFFECT INT_VAR match_opcode = 44 opcode = 10 END
        
        LPF ALTER_SPELL_EFFECT INT_VAR duration_high = 13*6 power = 7 END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 139 parameter1 = NameStrRef END
        
        FOR (i=14;i<=30;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END            
            SET header = i - 12 
            LPF ALTER_SPELL_HEADER INT_VAR header  min_level = i END      
            LPF ALTER_SPELL_EFFECT INT_VAR header duration_high = i*6 END            
        END
        LPF REPLACE_SPL_STAT_BONUSES END
                      
        ADD_SPELL "override/AURAVITD.SPL" 1  7 DRUID_AURA_VITALITY
        SPRINT resource EVALUATE_BUFFER ~%DEST_RES%~		
			LPF ADD_SPELL_EFFECT INT_VAR  opcode = 321 power=7 target=2  duration=1 timing=0  resist_dispel = 3 insert_point=0 STR_VAR resource END //remove effects from previous cast

    // gravity weapon
    COPY ~3ed/Spells/GravityWeapon/GRAVWPNC.BAM~ ~override~
    COPY ~3ed/Spells/GravityWeapon/GRAVWPNB.BAM~ ~override~
    COPY ~3ed/Spells/GravityWeapon/GRAVWPN.SPL~ ~override~
    
    SET NameStrRef = RESOLVE_STR_REF (@335)
    SET DescStrRef = RESOLVE_STR_REF (@336)
    COPY_EXISTING ~GRAVWPN.SPL~ ~override~
        WRITE_ASCII 0x003a ~GRAVWPNC~ #8 //spellbook icon
        WRITE_LONG 0x0050 DescStrRef
        WRITE_LONG 0x0008 NameStrRef
        LPF ALTER_SPELL_HEADER STR_VAR icon  = ~GRAVWPNB~ END
        LPF ALTER_SPELL_EFFECT INT_VAR duration = 60 target = 2 END
        FOR (i=2;i<=20;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END            
            LPF ALTER_SPELL_HEADER INT_VAR header = i  min_level = i END      
            LPF ALTER_SPELL_EFFECT INT_VAR header = i duration = i*60 END
            SET dmg_bonus = 1 + i/10
            PATCH_IF (dmg_bonus > 2) BEGIN
                SET dmg_bonus = 2
            END
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 73 header = i parameter1 = dmg_bonus END            
        END
            
        ADD_SPELL "override/GRAVWPN.SPL" 1  1 DRUID_GRAVITY_WEAPON
        SPRINT resource EVALUATE_BUFFER ~%DEST_RES%~		
			LPF ADD_SPELL_EFFECT INT_VAR  opcode = 321 power=1 target=2  duration=1 timing=0  resist_dispel = 3 insert_point=0 STR_VAR resource END //remove effects from previous cast

    