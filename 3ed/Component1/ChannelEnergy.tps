	//turn undead -> channel energy
	INCLUDE ~3ed/CHANNEL_ENERGY_LEVEL_REGULARIZATION.tph~
	INCLUDE ~3ed/ADD_CHANNEL_ENERGY.tph~
	//for paladins, clerics, cleric/thiefs, fighter/clerics

		
	COPY ~3ed/Classes/TurnUndead/CHANNEGB.BAM~ ~override~
	COPY ~3ed/Classes/TurnUndead/CHANNEGC.BAM~ ~override~
	COPY ~3ed/Classes/TurnUndead/CHANPOSB.BAM~ ~override~
	COPY ~3ed/Classes/TurnUndead/CHANPOSC.BAM~ ~override~
	
	OUTER_SET max_channel_lvl=15
	OUTER_SET max_multi_class_channel_lvl=8	
	
	OUTER_FOR (i=1;i<=max_channel_lvl;i=i+1) BEGIN
		COPY ~3ed/Classes/TurnUndead/DMUNDD.EFF~ ~override/EN_DMG%i%.EFF~
			WRITE_LONG 0x0038 i //i*1d4 damage (same part will be also added with save)
		COPY ~3ed/Classes/TurnUndead/HEAL.EFF~ ~override/EN_HL%i%.EFF~
			WRITE_LONG 0x0038 2*i //i*2d4 healed 
	END
	
	
	COPY ~3ed/Classes/TurnUndead/CHANEN0.SPL~ ~override/CE_0.SPL~ //removal of channel energy during rest
	WITH_TRA ~%LANGUAGE%\channelenergy.tra~ BEGIN
		OUTER_SET  pos_name_ref=RESOLVE_STR_REF (@001)
		OUTER_SET  pos_descr_ref=RESOLVE_STR_REF (@002)
		OUTER_SET  neg_name_ref=RESOLVE_STR_REF (@003)
		OUTER_SET  neg_descr_ref=RESOLVE_STR_REF (@004)
        OUTER_SET  angel_name_ref=RESOLVE_STR_REF (@005)
		OUTER_SET  angel_descr_ref=RESOLVE_STR_REF (@006)
	END
	
	//channel energy for clerics and paladins
 	LAF ADD_CHANNEL_ENERGY INT_VAR level_offset=1 divisor=2 pos_name_ref pos_descr_ref angel_name_ref angel_descr_ref neg_name_ref neg_descr_ref STR_VAR id=~C~ END
	//channel energy for cleric/thief  fighter/cleric and cleric/mage
 	LAF ADD_CHANNEL_ENERGY INT_VAR level_offset=2 divisor=4 pos_name_ref pos_descr_ref angel_name_ref angel_descr_ref neg_name_ref neg_descr_ref STR_VAR id=~M~ END
	//give channel energy depending on kit and class
	COPY ~3ed/Classes/TurnUndead/CHANEN1.SPL~ ~override/CE_1.SPL~
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=3 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_PC1~ END //good cleric
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=3 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_NC1~  END //evil cleric 
        LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=16405 parameter2=9 duration=1 timing=1 STR_VAR  resource= ~CE_AC1~ END //priest of lathander
        
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=15 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_PM1~   END //good cleric theif
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=15 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_NM1~  END //evil cleric thief
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=8 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_PM1~ END //good fighter cleric
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=8 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_NM1~  END //evil fighter cleric
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=14 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_PM1~ END //good cleric/mage
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=14 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_NM1~  END //evil cleric/mage
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=17 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_PM1~ END //good fighter/cleric/mage
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=17 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_NM1~  END //evil fighter/cleric/mage
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=6 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_PC1~  END //good paladin
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=6 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_NC1~  END //evil paladin
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=18 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_PM1~ END //good cleric/ranger
		LPF ADD_SPELL_EFFECT INT_VAR opcode=177 target=2 parameter1=18 parameter2=5 duration=1 timing=1 STR_VAR  resource= ~CE_NM1~  END //evil cleric/ranger
		
	COPY ~3ed/Classes/TurnUndead/CHANGV.SPL~ ~override/CE_GV.SPL~
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=326 STR_VAR resource=~CE_1~ END
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~CE_AC1~ END //2 additional uses for priest of lathander
		
	//first attribution of abilities
	COPY ~3ed/Feats/FeatAttribution/SFTCREC.SPL~ ~override/CE_C1.SPL~
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=326 STR_VAR resource=~CE_GV~ END//cleric
	COPY ~3ed/Feats/FeatAttribution/SFTCREFC.SPL~ ~override/CE_FC1.SPL~
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=326 STR_VAR resource=~CE_GV~ END //fighter cleric
	COPY ~3ed/Feats/FeatAttribution/SFTCRECT.SPL~ ~override/CE_CT1.SPL~
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=326 STR_VAR resource=~CE_GV~ END //cleric thief
	COPY ~3ed/Feats/FeatAttribution/SFTCRECM.SPL~ ~override/CE_CM1.SPL~
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=326 STR_VAR resource=~CE_GV~ END //cleric mage
	COPY ~3ed/Feats/FeatAttribution/SFTCRFMC.SPL~ ~override/CE_FMC1.SPL~
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=326 STR_VAR resource=~CE_GV~ END //fighter_cleric mage
		
	//script for giving channel abilities	
	OUTER_FOR (player_id=1;player_id<=6;player_id=player_id + 1) BEGIN
		EXTEND_TOP ~BALDUR.BCS~ ~3ed/Classes/TurnUndead/CHANEN.baf~
			EVALUATE_BUFFER			
	END
	
	LAF CHANNEL_ENERGY_LEVEL_REGULARIZATION INT_VAR max_channel_lvl END //regularize channel energy level visualization in spreadheet