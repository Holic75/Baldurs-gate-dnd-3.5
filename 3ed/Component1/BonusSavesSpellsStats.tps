
	INCLUDE ~3ed/ADD_BONUS_SPELLS_PROCESS.tph~
	INCLUDE ~3ed/ADD_BONUS_SPELLS.tph~
	
	//saving throw bonuses based on stats
	COPY ~3ed/Core/Savingthrows~ ~override~	
	
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 STR_VAR clab=~\(\(CLAB.+\)\|\(OHTYR\)\)\.2DA~  caption=~DEXSAVFT~ END	
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 STR_VAR clab=~\(\(CLAB.+\)\|\(OHTYR\)\)\.2DA~  caption=~CONSAVFT~ END	
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 STR_VAR clab=~\(\(CLAB.+\)\|\(OHTYR\)\)\.2DA~  caption=~WISSAVFT~ END	
	
	//--------------------------------------------------------------------------------------------------------------------------------------------//	
	//bonus spells per level based on stats	
	COPY ~3ed/Core/SpellsPerLvl~ ~override~
		
	LAF ADD_BONUS_SPELLS_PROCESS STR_VAR folder_name=~3ed/Core/BonusSpells/~ ability_name=~SPLPR~ END
	LAF ADD_BONUS_SPELLS_PROCESS STR_VAR folder_name=~3ed/Core/BonusSpells/~ ability_name=~SPLWI~ END
	
	LAF ADD_BONUS_SPELLS INT_VAR stat_greater_id=130 stat_less_id=131 STR_VAR folder_name=~3ed/Core/BonusSpells/~ ability_name=~SPLPR~ game_name=~SPLWIP~ END //priest spells wis
	LAF ADD_BONUS_SPELLS INT_VAR stat_greater_id=128 stat_less_id=129 STR_VAR folder_name=~3ed/Core/BonusSpells/~ ability_name=~SPLWI~ game_name=~SPLINW~ END //wizard spells int
	LAF ADD_BONUS_SPELLS INT_VAR stat_greater_id=132 stat_less_id=133 STR_VAR folder_name=~3ed/Core/BonusSpells/~ ability_name=~SPLPR~ game_name=~SPLCHP~ END //priest spells cha
	LAF ADD_BONUS_SPELLS INT_VAR stat_greater_id=132 stat_less_id=133 STR_VAR folder_name=~3ed/Core/BonusSpells/~ ability_name=~SPLWI~ game_name=~SPLCHW~ END //wizard spells cha
	
	COPY ~3ed/Core/BonusSpells/SPLBON1.SPL~ ~override/SPLMAGMD.SPL~ //bonus wizard spells with mask
		LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target = 2 duration=1 parameter1=19 parameter2 =115 STR_VAR resource=~SPLINWMD~ END//for non sorcerors
		LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target = 2 duration=1 parameter1=19 parameter2 =105 STR_VAR resource=~SPLCHWMD~ END//for sorcerers