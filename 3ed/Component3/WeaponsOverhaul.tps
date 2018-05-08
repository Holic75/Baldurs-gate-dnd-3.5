
//---------------------------------------------weapons overhaul

	OUTER_SET APR2_ref =101
	OUTER_SET APR3_ref =102
	OUTER_SET APR15_ref =105
	OUTER_SET APR25_ref =106
	OUTER_SET APR5d_ref =103
	OUTER_SET APR4d_ref =108
	OUTER_SET APR5z_ref =201
	OUTER_SET APR4z_ref =202
	
	OUTER_SET APR3s_ref =301
	OUTER_SET APR2s_ref =302
    OUTER_SPRINT CompositeBowStr @401

	COPY ~3ed/2HSTRBonus~ ~override~ //2h weapon bonuses
     

	//change description for weapons and apply protections from feats
	COPY_EXISTING_REGEXP GLOB ~.+\.itm~ ~override~
        READ_STRREF 0x0008 "unid_name"
		READ_BYTE  0x0031 "proficiency"
		READ_SHORT 0x0038 "stack"   // to diffirintiate between throwing melee versions
		READ_SHORT 0x001c "category" //=28 for fist weapons, =2 -armor, 68 -robes, 14 - bullets
		
		
		PATCH_IF (~%SOURCE_RES%~ STR_EQ ~BLAKBLAD~) BEGIN//black blade of disaster -> change proficiency bonus to 89 
		
			LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode = 233 parameter2 = 89 END
		END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~SHAKTI1~) BEGIN //transform short sword
		
			LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode = 233 parameter2 = 90 END

		END
		
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~thief~  RET usable_by_thief = result END
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~fighter~  RET usable_by_fighter = result END  
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~druid~  RET usable_by_druid = result END 
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage~  RET usable_by_mage = result END

		
		PATCH_IF (proficiency = 89 ) BEGIN //bastard swords ->straight swords
			LPF UPDATE_WEAPON_DMG INT_VAR match_dice_number = 2 match_dice_size = 4 target_dice_number = 1 target_dice_size = 10 END
			LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace=~2d4~  new_substring=~1d10~ END
			LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 STR_VAR substring_to_replace=~2d4~  new_substring=~1d10~ END
			LPF PTCH_WPN INT_VAR replace_label=2001 wpn_class_label=001 caption_label=2000 is_melee=1 END		

			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
           
		END 
		ELSE PATCH_IF (proficiency = 90) BEGIN//longsword ->straight swords
			WRITE_BYTE 0x0031 89
			LPF PTCH_WPN INT_VAR replace_label=2002 wpn_class_label=001 caption_label=2000 is_melee=1 is_light=1 END		

			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END   
		ELSE PATCH_IF (proficiency = 93) BEGIN //2h sword ->straight swords
			LPF UPDATE_WEAPON_DMG INT_VAR match_dice_number = 1 match_dice_size = 10 target_dice_number = 2 target_dice_size = 6 END 
			LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace=~1d10~  new_substring=~2d6~ END
			LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 STR_VAR substring_to_replace=~1d10~  new_substring=~2d6~ END
			
			WRITE_BYTE 0x0031 89
			LPF PTCH_WPN INT_VAR replace_label=2003 wpn_class_label=001 caption_label=2000 is_melee=1 is_2h=1 END	
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END   
		ELSE PATCH_IF (proficiency = 91) BEGIN //short sword ->blades           
			WRITE_BYTE 0x0031 90
			LPF PTCH_WPN INT_VAR replace_label=2004 wpn_class_label=021 caption_label=2000 is_melee=1 is_light=1 END
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END 
		ELSE PATCH_IF (proficiency = 96 AND stack=1) BEGIN //daggers ->blades
			WRITE_BYTE 0x0031 90
			LPF PTCH_WPN INT_VAR replace_label=2005 wpn_class_label=021 caption_label=2000 is_melee=1 is_light=1 is_fist=1 END			
		END 
		ELSE PATCH_IF (proficiency = 96 AND stack>1) BEGIN //throwing daggers ->missile weapons
			WRITE_BYTE 0x0031 98
			LPF DELETE_EFFECT INT_VAR match_opcode = 1 match_parameter1=2 match_parameter2=1 END //remove additional attacks
			LPF PTCH_WPN INT_VAR replace_label=2005 wpn_class_label=021 caption_label=2000 is_melee=0 END			
		END
		ELSE PATCH_IF (proficiency = 92) BEGIN //axes and throwing axes (same) ->axes
			WRITE_BYTE 0x0031 91
			LPF PTCH_WPN INT_VAR replace_label=2006 wpn_class_label=023 caption_label=2000 is_melee=1 END	
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END     
		ELSE PATCH_IF (proficiency = 95) BEGIN //scimitar/wakizahshi/ninjato ->curved swords
			WRITE_BYTE 0x0031 92
			LPF PTCH_WPN INT_VAR replace_label=2007 wpn_class_label=025 caption_label=2000 is_melee=1 is_light=1 END
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END
		ELSE PATCH_IF (proficiency = 94) BEGIN //katana ->curved swords
			WRITE_BYTE 0x0031 92
			LPF PTCH_WPN INT_VAR replace_label=2008 wpn_class_label=025 caption_label=2000 is_melee=1 END
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END  	
		ELSE PATCH_IF (proficiency = 115) BEGIN //club -> blunt weapons
			WRITE_BYTE 0x0031 93
			LPF PTCH_WPN INT_VAR replace_label=2009 wpn_class_label=027 caption_label=2000 is_melee=1 is_light=1 END
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END   
		ELSE PATCH_IF (proficiency = 101) BEGIN //mace -> blunt weapons
			WRITE_BYTE 0x0031 93
			LPF PTCH_WPN INT_VAR replace_label=2010 wpn_class_label=027 caption_label=2000 is_melee=1 END
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END  
		ELSE PATCH_IF (proficiency = 97) BEGIN //warhammer -> blunt weapons
			WRITE_BYTE 0x0031 93
			LPF PTCH_WPN INT_VAR replace_label=2011 wpn_class_label=027 caption_label=2000 is_melee=1 END
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END 
		ELSE PATCH_IF (proficiency = 102) BEGIN //quarterstaff -> blunt weapons
			WRITE_BYTE 0x0031 93
			LPF PTCH_WPN INT_VAR replace_label=2012 wpn_class_label=027 caption_label=2000 is_melee=1 is_light=1 is_2h=1 is_fist=1 END				
		END 
		ELSE PATCH_IF (proficiency = 100) BEGIN //flail/morning star -> spiked weapons
			WRITE_BYTE 0x0031 94
			LPF PTCH_WPN INT_VAR replace_label=2013 wpn_class_label=029 caption_label=2000 is_melee=1 END
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END   
		ELSE PATCH_IF (proficiency = 98) BEGIN //spear -> polearms
			LPF UPDATE_WEAPON_DMG INT_VAR match_dice_number = 1 match_dice_size = 6 target_dice_number = 1 target_dice_size = 8 is_light=1 END
			LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace=~1d6~  new_substring=~1d8~ END
			LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 STR_VAR substring_to_replace=~1d6~  new_substring=~1d8~ END
			
			WRITE_BYTE 0x0031 95
			LPF PTCH_WPN INT_VAR replace_label=2014 wpn_class_label=031 caption_label=2000 is_light=1 is_melee=1 is_2h=1 END
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END 
		ELSE PATCH_IF (proficiency = 99) BEGIN //halberd -> polearms
			LPF UPDATE_WEAPON_DMG INT_VAR match_dice_number = 1 match_dice_size = 10 target_dice_number = 1 target_dice_size = 12 END
			LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace=~1d10~  new_substring=~1d12~ END
			LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 STR_VAR substring_to_replace=~1d10~  new_substring=~1d12~ END
			WRITE_BYTE 0x0031 95
			LPF PTCH_WPN INT_VAR replace_label=2015 wpn_class_label=031 caption_label=2000 is_melee=1 is_2h=1 END
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END    
		ELSE PATCH_IF (proficiency = 103) BEGIN //crossbow -> crossbows
			WRITE_BYTE 0x0031 96
			PATCH_IF ((~%SOURCE_FILE%~ STR_EQ ~XBOW06.ITM~) OR (~%SOURCE_FILE%~ STR_EQ ~XXBOW06.ITM~) OR (~%SOURCE_FILE%~ STR_EQ ~DWXBOW01.ITM~) ) BEGIN
				LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=7 END  //fix apr (xbow of speed)
			END
			ELSE PATCH_IF (~%SOURCE_FILE%~ STR_EQ ~UHXBW3B.ITM~ ) OR (~%SOURCE_FILE%~ STR_EQ ~ULXBW3B.ITM~) BEGIN //replace 2 apr with 1.5 apr
				LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=7 END  //fix apr (xbow of speed)
				LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = APR2_ref new_substring_ref = APR15_ref END
			END
			ELSE PATCH_IF (~%SOURCE_FILE%~ STR_EQ ~UHXBW5A.ITM~) OR (~%SOURCE_FILE%~ STR_EQ ~ULXBW5A.ITM~) BEGIN //replace 3 apr with 2 apr (repeating xbow)
				LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=2 END  //fix apr (xbow of speed)
				LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = APR3_ref new_substring_ref = APR2_ref END
			END
			ELSE BEGIN
				LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=6 END  //fix apr to 0.5
		    END
			LPF PTCH_WPN INT_VAR replace_label=2016 wpn_class_label=033 caption_label=2000 is_melee=0 END		
		END 
		ELSE PATCH_IF (proficiency = 105) BEGIN //shortbow -> bows
			WRITE_BYTE 0x0031 97
			PATCH_IF ((~%SOURCE_FILE%~ STR_EQ ~SBOWEBU.ITM~) ) BEGIN
				LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=7 END  //short bow of equilibrium 
				LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = APR3_ref new_substring_ref = APR2_ref END
			END
			ELSE PATCH_IF ((~%SOURCE_FILE%~ STR_EQ ~BOW14.ITM~) ) BEGIN //tuigan bow
				LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=2 END  
				LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = APR3s_ref new_substring_ref = APR2s_ref END
			END
			ELSE BEGIN
				LPF DELETE_EFFECT INT_VAR match_opcode = 1 match_parameter1=2 match_parameter2=1 END //remove additional attacks
			END
                        
			LPF PTCH_WPN INT_VAR replace_label=2017 wpn_class_label=035 caption_label=2000 is_melee=0 END	
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END
		END    		
		ELSE PATCH_IF (proficiency = 104) BEGIN //longbow -> bows
			WRITE_BYTE 0x0031 97
			PATCH_IF ((~%SOURCE_FILE%~ STR_EQ ~BOWMESS.ITM~) ) BEGIN
				LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=7 END  //messenger of sseth
				LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = APR3_ref new_substring_ref = APR2_ref END
			END
			ELSE BEGIN
				LPF DELETE_EFFECT INT_VAR match_opcode = 1 match_parameter1=2 match_parameter2=1 END //remove additional attacks
			END
            
            is_2h = (~%unid_name%~ STR_EQ ~%CompositeBowStr%~)
			LPF PTCH_WPN INT_VAR replace_label=2018 wpn_class_label=035 caption_label=2000 is_melee=0 is_2h END
			LPF SET_ITEM_USABILITY INT_VAR value=usable_by_mage STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~jester~ END

		END 
		ELSE PATCH_IF (proficiency = 106) BEGIN //darts -> missile weapons
			WRITE_BYTE 0x0031 98
			PATCH_IF ((~%SOURCE_FILE%~ STR_EQ ~MELFMET.ITM~) ) BEGIN
				LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=4 END  //melf meteors
				LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = APR5d_ref new_substring_ref = APR4d_ref END
                LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 substring_to_replace_ref = APR5d_ref new_substring_ref = APR4d_ref END
			END 
			ELSE PATCH_IF ((~%SOURCE_FILE%~ STR_EQ ~DARTZIL.ITM~) ) BEGIN
				LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=4 END  //zilzaners dart
				LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = APR5z_ref new_substring_ref = APR4z_ref END
			END 
			ELSE PATCH_IF ((~%SOURCE_FILE%~ STR_EQ ~ENEBLADE.ITM~) ) BEGIN
				LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=4 END  //energy blades 2*4.5 ->2*4
			END 
			ELSE BEGIN
				LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=2 END //fix apr to 2
			END
			
			LPF PTCH_WPN INT_VAR replace_label=2019 wpn_class_label=037 caption_label=2000 is_melee=0 END				
		END
		ELSE PATCH_IF (proficiency = 107) BEGIN //sling -> missile weapons
			WRITE_BYTE 0x0031 98
			LPF ALTER_ITEM_EFFECT INT_VAR check_globals=1 match_opcode=1 parameter1=6 END //fix apr to 0.5
			LPF PTCH_WPN INT_VAR replace_label=2020 wpn_class_label=037 caption_label=2000 is_melee=0 END			

           
		END  		
		ELSE PATCH_IF (category == 28) BEGIN//fist weapons
			LPF PTCH_WPN INT_VAR is_melee=1 is_light=1 is_fist=1 END			
		END
		

		
		PATCH_IF (category = BoltsCategory OR category = CrossbowsCategory) BEGIN//bolts, crossbows for mages and thiefs
  
			LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~thief~ END
			LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage~ END
			LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage_thief~ END
	
		END

		PATCH_IF (category = QuarterstaffCategory OR category = CrossbowsCategory OR category = BowsCategory
				OR category=ArrowsCategory OR category=BoltsCategory) AND usable_by_thief BEGIN //quarterstaff,crossbow, bow,arrow, bolt	for monks			
			LPF SET_ITEM_USABILITY STR_VAR  values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~monk~ END
		END  
  
		PATCH_IF  (usable_by_fighter) BEGIN //allow wizardslayer to use all that a fighter can (armors will be removed later)
			LPF SET_ITEM_USABILITY STR_VAR  values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~wizardslayer~ END
		END
		
		  //weapons for ftr/druid are that of a fighter
		PATCH_IF (usable_by_fighter AND category != ArmorCategory) BEGIN
			LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~fighter_druid~ END	
		END
		
		
		  //allow clerics_something to use weapons of something
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~cleric~  RET usable_by_cleric = result END
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage~  RET usable_by_mage = result END
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~ranger~  RET usable_by_ranger = result END
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~fighter~  RET usable_by_fighter = result END
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~thief~  RET usable_by_thief = result END
  
		PATCH_IF (category!=ArmorCategory AND category!=ShieldsCategory) BEGIN
			LPF SET_ITEM_USABILITY INT_VAR value = usable_by_cleric OR usable_by_mage STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~cleric_mage~   END
			LPF SET_ITEM_USABILITY INT_VAR value = usable_by_cleric OR usable_by_ranger STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~cleric_ranger~   END
			LPF SET_ITEM_USABILITY INT_VAR value = usable_by_cleric OR usable_by_fighter STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~fighter_cleric~   END
			LPF SET_ITEM_USABILITY INT_VAR value = usable_by_cleric OR usable_by_thief STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~cleric_thief~   END 
            
            //allow sorcerors to use equipment of thieves (except thief specific items)
            //through allowing it to mages and adding restirct item effect on them	
            PATCH_IF (usable_by_fighter AND usable_by_thief AND NOT(usable_by_mage))  BEGIN
                LPF SET_ITEM_USABILITY INT_VAR value = 1 STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage~   END
                LPF ADD_ITEM_EQEFFECT INT_VAR  opcode = 319 target = 1  power = 0  parameter1 = 1   parameter2 = 5  timing = 2  resist_dispel = 0   probability1 = 100  probability2 = 0  special = mage_strref  END
            END
		END
  
  		
		PATCH_IF (usable_by_druid  OR category = AxesCategory) AND usable_by_ranger BEGIN //axes	and druid weapons
			LPF SET_ITEM_USABILITY  STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~beastmaster~ END
		END  
		
		  //remove ranged weapons for berserker  (as kensai)
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~  RET usable_by_kensai = result END
		PATCH_IF (NOT(usable_by_kensai) AND category!=ArmorCategory AND category!=ShieldsCategory AND category!=BracersCategory AND category!=HelmsCategory)  BEGIN //(everything except armors, shields,bracers)
			LPF SET_ITEM_USABILITY INT_VAR value = 0 STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~berserker~ END
		END
        
        //allow kensai to use missile weapons (generally all weapons of a fighter)
        PATCH_IF (category!=ArmorCategory AND category!=ShieldsCategory) BEGIN
			LPF SET_ITEM_USABILITY INT_VAR value = usable_by_kensai OR usable_by_fighter STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~   END			
		END
        
        PATCH_IF (category == BulletsCategory) BEGIN //set bullets damage type to crushing
            LPF ALTER_ITEM_HEADER INT_VAR header_type = 2 damage_type = 2 END
            LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 STR_VAR substring_to_replace_ref = 6001  new_substring_ref = 6002 END
            LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 6001  new_substring_ref = 6002 END
            LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 STR_VAR substring_to_replace_ref = 6003  new_substring_ref = 6004 END
            LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace_ref = 6003  new_substring_ref = 6004 END
        END
        
	BUT_ONLY
    