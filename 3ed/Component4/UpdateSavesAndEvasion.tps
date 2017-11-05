	COPY ~3ed/Spells/Savingthrows/IMMDMG.EFF~ ~override~
	//replace spell saves to breath weapon for these damaging spells
	
	
	ACTION_DEFINE_ASSOCIATIVE_ARRAY SavesStrings BEGIN
		0 => 1000
		1 => 1001
		2 => 1002
		4 => 1003
		8 => 1005
		16 => 1004
		
	
	END
	
	OUTER_SPRINT substring_to_replace @1001
	OUTER_SPRINT new_substring @1002
	COPY ~3ed/Spells/Savingthrows/%GameId%/BreathWeaponSaves.2DA~ ~override~ 
		COUNT_2DA_ROWS 2 n_rows			
		FOR (i=0;i<n_rows;i=i+1) BEGIN
			READ_2DA_ENTRY %i% 0 3 spell_name 
			READ_2DA_ENTRY %i% 2 3 opcode_id 
				INNER_ACTION BEGIN					
					COPY_EXISTING ~%spell_name%.SPL~ ~override~											
					PATCH_IF !(~%opcode_id%~ STRING_EQUAL ~x~) BEGIN
						LPF UPDATE_SPELL_SAVES INT_VAR match_opcode = opcode_id original_save=0b00001 target_save=0b00010 END
					END ELSE BEGIN
						LPF UPDATE_SPELL_SAVES INT_VAR original_save=0b00001 target_save=0b00010 END
					END
					LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace  new_substring END
				END
		END
		
	OUTER_SPRINT new_substring @1003
	COPY ~3ed/Spells/Savingthrows/%GameId%/DeathSaves.2DA~ ~override~ 
		COUNT_2DA_ROWS 2 n_rows			
		FOR (i=0;i<n_rows;i=i+1) BEGIN
			READ_2DA_ENTRY %i% 0 3 spell_name 
			READ_2DA_ENTRY %i% 2 3 opcode_id 
				INNER_ACTION BEGIN
					COPY_EXISTING ~%spell_name%.SPL~ ~override~
						LPF UPDATE_SPELL_SAVES INT_VAR match_opcode=134 original_save=0b00001 target_save=0b10000 END //stone to flesh
						LPF UPDATE_SPELL_SAVES INT_VAR original_save=0b00001 target_save=0b00100 END
						LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace  new_substring END				
					
				END
		END
		
	OUTER_SPRINT new_substring @1004	
	COPY ~3ed/Spells/Savingthrows/%GameId%/PolySaves.2DA~ ~override~ 
		COUNT_2DA_ROWS 2 n_rows			
		FOR (i=0;i<n_rows;i=i+1) BEGIN
			READ_2DA_ENTRY %i% 0 3 spell_name 
			READ_2DA_ENTRY %i% 2 3 opcode_id 
				INNER_ACTION BEGIN
					COPY_EXISTING ~%spell_name%.SPL~ ~override~
						LPF UPDATE_SPELL_SAVES INT_VAR original_save=0b00001 target_save=0b10000 END
						LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace new_substring END						
				END
		END
		
			
	COPY ~3ed/Spells/Savingthrows/%GameId%/ItemSaves.2DA~ ~override~ 
		COUNT_2DA_ROWS 2 n_rows			
		FOR (i=1;i<n_rows;i=i+1) BEGIN
			READ_2DA_ENTRY %i% 0 4 item_name 
			READ_2DA_ENTRY %i% 2 4 original_save
			READ_2DA_ENTRY %i% 3 4 target_save
			
			SET rep_ref =  $SavesStrings("%original_save%")
			SET new_ref =  $SavesStrings("%target_save%")
			SPRINT new_substring  (AT "new_ref")
			SPRINT substring_to_replace  (AT "rep_ref")
				INNER_ACTION BEGIN
					COPY_EXISTING ~%item_name%.ITM~ ~override~
						LPF UPDATE_SPELL_SAVES INT_VAR original_save target_save END
						LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0050 STR_VAR substring_to_replace  new_substring END
						LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 STR_VAR substring_to_replace  new_substring END							
				END
		END
		
	COPY_EXISTING_REGEXP GLOB ~.+\.spl~ ~override~
		LPF ADD_EVASION_TO_SPELL INT_VAR END
		
	COPY_EXISTING_REGEXP GLOB ~.+\.itm~ ~override~  //add evasion to items
		LPF ADD_EVASION_TO_SPELL INT_VAR target_save_type = 10 END //breath and wand saves 
		
		
	//change description of specific spells 
	COPY_EXISTING ~SPWI714.SPL~ ~override~ //prismatic spray
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @053
	COPY_EXISTING ~SPWI118.SPL~ ~override~ //chromatic orb
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @054	
