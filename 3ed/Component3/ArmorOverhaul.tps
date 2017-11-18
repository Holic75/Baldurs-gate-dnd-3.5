	OUTER_SPRINT LeatherArmorStr @1
	OUTER_SPRINT StuddedLeatherArmorStr @2
	OUTER_SPRINT HideArmorStr @3
	OUTER_SPRINT ChainMailStr @4
	OUTER_SPRINT SplintMailStr @5
	OUTER_SPRINT PlateMailStr @6
	OUTER_SPRINT FullPlateStr @7
    OUTER_SPRINT FullPlateMailStr @71	
	
COPY_EXISTING_REGEXP GLOB ~.+\.itm~ ~override~
  READ_STRREF 0x0008 "unid_name"
  READ_STRREF 0x000c "id_name"
  READ_SHORT 0x001c "category"
  

  LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage~  RET usable_by_thief = result END
  LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~fighter~  RET usable_by_fighter = result END  
  LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~druid~  RET usable_by_druid = result END 
  LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage~  RET usable_by_mage = result END
  LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~monk~  RET usable_by_monk = result END
		
 
  
  //unique armors
  PATCH_IF ((~%SOURCE_RES%~ STR_EQ ~PLAT06~) OR (~%SOURCE_RES%~ STR_EQ ~KING~)) BEGIN //ankheg or ice king plate mail -> chain mail (allow beastmaster)
	WRITE_SHORT 0x0026 8 //str req to 8 
	LPF UPDATE_ARMOR INT_VAR spell_failure = 20 max_dex = 16 skill_penalty = 16  string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 14 END	
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~beastmaster~ END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~barbarian~ END
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~CHAN17~) BEGIN //ashen scales +2 -> chain mail (allow bard)
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 20 max_dex = 16 skill_penalty = 16  string_to_replace_ref_match = 9 string_to_replace_ref = 10 
                             new_string_to_add_ref = 14 update_unid_string = 0 END
                             
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~bard~ END
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~PLAT18~) BEGIN //red dragon scale -> splint (allow barbarian)
	
	LPF UPDATE_ARMOR INT_VAR spell_failure = 30 max_dex = 14 skill_penalty = 14 is_light = 0 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 15 END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~barbarian~ END
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~CDSCALE~) BEGIN //white dragon scale iwd -> chain mail (dissallow thief)
	
	LPF UPDATE_ARMOR INT_VAR spell_failure = 30 max_dex = 16 skill_penalty = 16 is_light = 0 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 14 END
	
	LPF SET_ITEM_USABILITY INT_VAR value = 0 STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~thief~ END
	LPF SET_ITEM_USABILITY INT_VAR value = 0 STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage_thief~ END
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~NPCHAN~) BEGIN //valygar armor (remove requirements) - >studded leather
	
	LPF UPDATE_ARMOR INT_VAR spell_failure = 15 max_dex = 18 skill_penalty = 18 is_light = 1 string_to_replace_ref_match = 0 string_to_replace_ref = 10 new_string_to_add_ref = 1001 END	
	WRITE_BYTE 0x002c 0 //dex
	WRITE_BYTE 0x002e 0 //wis
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~barbarian~ END	
	SAY IDENTIFIED_DESC @1001
	SAY UNIDENTIFIED_DESC @1001
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~OHDARMOR~) BEGIN //silver dragon scale  - >splint mail (allow barbarian, rangers, berserker)
	
	LPF UPDATE_ARMOR INT_VAR spell_failure = 14 max_dex = 14 skill_penalty = 14 is_light = 0 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 15 END	
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~barbarian~ END
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~ELFCHAN~) OR (~%SOURCE_RES%~ STR_EQ ~CHAN12~) OR (~%SOURCE_RES%~ STR_EQ ~CHAN13~) OR (~%SOURCE_RES%~ STR_EQ ~CHAN14~) 
					OR (~%SOURCE_RES%~ STR_EQ ~CHAN15~) OR (~%SOURCE_RES%~ STR_EQ ~CHAN10~) OR (~%SOURCE_RES%~ STR_EQ ~CHAN16~) OR (~%SOURCE_RES%~ STR_EQ ~CHAN17~) 
					OR (~%SOURCE_RES%~ STR_EQ ~CHAN14~) OR (~%SOURCE_RES%~ STR_EQ ~DWCHAN01~) OR (~%SOURCE_RES%~ STR_EQ ~DWCHAN02~) OR (~%SOURCE_RES%~ STR_EQ ~CLOLTH~) 
                    OR (~%SOURCE_RES%~ STR_EQ ~CHAN19~)
					BEGIN //elven chain  (allow stalker, beastmaster)
	
	update_unid_string = 1 
	
	PATCH_IF (~%SOURCE_RES%~ STR_EQ ~ELFCHAN~ OR ~%SOURCE_RES%~ STR_EQ ~KAYCHAI~) BEGIN
		update_unid_string = 0
	END
    
    string_to_replace_ref_match = 8
    
    PATCH_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN
        string_to_replace_ref_match = 81
    END
	LPF UPDATE_ARMOR INT_VAR spell_failure = 0 max_dex = 18 skill_penalty = 18 is_light = 1 clear_thief_penalty = 1 string_to_replace_ref_match string_to_replace_ref = 10 new_string_to_add_ref = 141 update_unid_string END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~beastmaster~ END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~stalker~ END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~archer~ END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~ END
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~CHAN06~) BEGIN //drizzt armor (allow bards, thiefs)
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 0 max_dex = 20 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 142 update_unid_string = 0 END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~beastmaster~ END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~stalker~ END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~archer~ END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~ END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~thief~ END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage_thief~ END
	
	//allow sorcerors to use it (battle casters only)
	LPF SET_ITEM_USABILITY INT_VAR value = 1 STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage~   END
	LPF ADD_ITEM_EQEFFECT INT_VAR  opcode = 319 target = 1  power = 0  parameter1 = 1   parameter2 = 5  timing = 2  resist_dispel = 0   probability1 = 100  probability2 = 0  special = mage_strref  END
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~NPPLAT~) BEGIN //keldorn full plate, remove requirements
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 50 max_dex = 10 skill_penalty = 10 is_light = 0 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 17 END
	WRITE_BYTE 0x0026 14 //str
	WRITE_BYTE 0x002e 0 //wis
	WRITE_BYTE 0x0030 0 //con
	WRITE_SHORT 0x002e 0 //cha
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~SHARK3~) OR  (~%SOURCE_RES%~ STR_EQ ~UMHULK~) BEGIN //sahaguin and umberhulk plate armor
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 40 max_dex = 12 skill_penalty = 12 is_light = 0 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 16 END
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~SHARK2~) OR  (~%SOURCE_RES%~ STR_EQ ~DRAGARM~) BEGIN //sahaguin and black dragon scale => studded leather
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 15 max_dex = 18 skill_penalty = 18 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 12 END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~ END
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~PLAT04~)  BEGIN//mithral field plate armor => full plate
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 50 max_dex = 10 skill_penalty = 10 is_light = 0 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 17 END
	WRITE_BYTE 0x0026 14 //str
	
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~SHARK~) BEGIN//sahaguin leather armor
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 10 max_dex = 20 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 11 END
	LPF SET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~ END

  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~cdharmor~) BEGIN//yeti hide leather armor
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 20 max_dex = 16 skill_penalty = 17 keep_old_string = 0 clear_thief_penalty = 1 string_to_replace_ref_match = 131 string_to_replace_ref = 10 new_string_to_add_ref = 132 update_unid_string = 0 END
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_fighter STR_VAR  values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~ END

  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~NPARM~) BEGIN//jan's lether armor (remove requirements)
  
	//LPF UPDATE_ARMOR INT_VAR spell_failure = 10 max_dex = 20 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 11 update_unidstring = 0 END
	WRITE_BYTE 0x002c 0 //dex
	SAY IDENTIFIED_DESC @1002
	SAY UNIDENTIFIED_DESC @1002
		
  END ELSE PATCH_IF (~%SOURCE_RES%~ STR_EQ ~SECRET05~) BEGIN//combined pantalons 
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 50 max_dex = 10 skill_penalty = 10 is_light = 0 string_to_replace_ref_match = 18 string_to_replace_ref = 10 new_string_to_add_ref = 181 update_unidstring = 0 END

				
	//general armors
  END ELSE PATCH_IF (~%unid_name%~ STRING_EQUAL ~%LeatherArmorStr%~ OR ~%SOURCE_RES%~ STR_EQ ~MOURNER~) BEGIN //Leather Armor
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 10 max_dex = 20 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 11 END
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_fighter STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~ END
		
  END  ELSE  PATCH_IF (~%unid_name%~ STRING_EQUAL ~%StuddedLeatherArmorStr%~) BEGIN //Studded Leather Armor
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 15 max_dex = 18 skill_penalty = 18 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 12 END
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_fighter STR_VAR  values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~ END
				
  END ELSE  PATCH_IF (~%unid_name%~ STRING_EQUAL ~%HideArmorStr%~) BEGIN //Hide Armor
  
	PATCH_IF (~%GameId%~ STR_EQ ~IWD~) BEGIN
		LPF UPDATE_ARMOR INT_VAR spell_failure = 20 max_dex = 16 skill_penalty = 17 keep_old_string = 0 clear_thief_penalty = 1 string_to_replace_ref_match = 131 string_to_replace_ref = 10 new_string_to_add_ref = 132 END
	END ELSE BEGIN
		LPF UPDATE_ARMOR INT_VAR spell_failure = 20 max_dex = 16 skill_penalty = 17 keep_old_string = 0 clear_thief_penalty = 1 string_to_replace_ref_match = 133 string_to_replace_ref = 10 new_string_to_add_ref = 132 END
	END
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_fighter STR_VAR  values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~ END
 			
  END  ELSE  PATCH_IF (~%unid_name%~ STRING_EQUAL ~%ChainMailStr%~) BEGIN //Chain Mail 
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 20 max_dex = 16 skill_penalty = 16  string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 14 END
	
  END  ELSE  PATCH_IF (~%unid_name%~ STRING_EQUAL ~%SplintMailStr%~) BEGIN //Splint Mail
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 30 max_dex = 14 skill_penalty = 14 is_light = 0 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 15 END
	
  END  ELSE  PATCH_IF (~%unid_name%~ STRING_EQUAL ~%PlateMailStr%~) BEGIN //Plate Mail
  
	LPF UPDATE_ARMOR INT_VAR spell_failure = 40 max_dex = 12 skill_penalty = 12 is_light = 0 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 16 END
  	
  END  ELSE  PATCH_IF (~%unid_name%~ STRING_EQUAL ~%FullPlateStr%~ ) OR (~%unid_name%~ STRING_EQUAL ~%FullPlateMailStr%~ ) BEGIN //Full Plate
	
	LPF UPDATE_ARMOR INT_VAR spell_failure = 50 max_dex = 10 skill_penalty = 10 is_light = 0 string_to_replace_ref_match = 9 string_to_replace_ref = 10 new_string_to_add_ref = 17 END
	
  END 
  
  
  
  
  
  PATCH_IF (category = HelmsCategory) BEGIN//helms - remove critical hit protection
	READ_BYTE  0x001b "flags4"  //bit 1 -> protection from critical hits
	WRITE_BYTE 0x001b (flags4 BOR 0b00000010) //remove critical hit protection from helms
	SPRINT substring_to_replace @2002
	SPRINT new_substring @2003
	LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace  new_substring END
	LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 STR_VAR substring_to_replace  new_substring END
	
  END ELSE PATCH_IF (category = ShieldsCategory ) BEGIN//shields ->supress effects of shield spell // move to spells section
  
	LPF GET_SPELL_EFFECT_VALUES INT_VAR header =0 match_opcode = 0 match_parameter2 = 0 RET ac_bonus = parameter1 found = found_match END
	
	PATCH_IF (found) BEGIN
	
		ac_bonus = (ac_bonus<=4)*ac_bonus + 4*(ac_bonus>4)
		FOR (i=1;i<=ac_bonus;i=i+1) BEGIN
			SPRINT resource EVALUATE_BUFFER ~SHLD_AC%i%~
			LPF ADD_ITEM_EQEFFECT INT_VAR opcode=321 target=1 duration=1 timing=2 STR_VAR resource END
			LPF ADD_ITEM_EQEFFECT INT_VAR opcode=206 target=1 duration=1 timing=2 STR_VAR resource END
		END
	END
	
  END ELSE PATCH_IF (category = ArmorCategory AND usable_by_mage) BEGIN//robes (category from armor to cloak and robes)
  
	WRITE_SHORT 0x001c RobesCategory
  END
  
  READ_SHORT 0x0026 min_str
  READ_BYTE 0x002c min_dex
  PATCH_IF (min_str>14) BEGIN // no piece of equipment should require more than 14 str
	WRITE_SHORT 0x0026 14
	SPRINT StrengthString @2001
	SPRINT substring_to_replace EVALUATE_BUFFER ~%min_str% %StrengthString%~
	SPRINT new_substring EVALUATE_BUFFER ~14 %StrengthString%~
	LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace  new_substring END
	LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 STR_VAR substring_to_replace  new_substring END
  END
  
  PATCH_IF (min_dex>14) BEGIN // no piece of equipment should require more than 14 dex
	WRITE_BYTE 0x002c 14
	SPRINT DexString @2011
	SPRINT substring_to_replace EVALUATE_BUFFER ~%min_dex% %DexString%~
	SPRINT new_substring EVALUATE_BUFFER ~14 %DexString%~
	LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace  new_substring END
	LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 STR_VAR substring_to_replace  new_substring END
  END
  
  //allow kensai to use helms and bracers
  PATCH_IF (category=HelmsCategory OR category=BracersCategory) AND usable_by_fighter BEGIN
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_fighter STR_VAR  values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~ END
  END
  
  
  
  //usability for armors
 
  PATCH_IF (category=ArmorCategory OR category=ShieldsCategory) BEGIN
  
  //ranger, berserker <- barbarian
	LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~barbarian~  RET usable_by_barbarian = result END
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_barbarian STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~berserker~ END
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_barbarian STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~ranger~ END
	
		
	PATCH_IF (category!=ShieldsCategory) BEGIN //wizardslayer <-kensai
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~  RET usable_by_kensai = result END
		LPF SET_ITEM_USABILITY INT_VAR value = usable_by_kensai STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~wizardslayer~ END
	END
	
	LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~ranger~  RET usable_by_ranger = result END
	
	//ftr_druid  <- ranger or druid
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_ranger OR usable_by_druid STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~fighter_druid~ END
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_druid STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~avenger~ END
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_druid STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~shapeshifter~ END
	
	//cleric_something <- something
	LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage~  RET usable_by_mage = result END
	LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~thief~  RET usable_by_thief = result END
	
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_ranger STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~cleric_ranger~ END
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_thief STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~cleric_thief~ END
	LPF SET_ITEM_USABILITY INT_VAR value = usable_by_mage STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~cleric_mage~ END
	
	//disallow ninjas to use armor (same as monks)
	PATCH_IF (NOT usable_by_monk) BEGIN
		LPF SET_ITEM_USABILITY INT_VAR value = 0 STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~bounty_hunter~ END	
	END
END
BUT_ONLY