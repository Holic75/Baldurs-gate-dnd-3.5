	//Spell DC regularization

	COPY_EXISTING_REGEXP GLOB ~.+\.spl~ ~override~
		READ_SHORT 0x1c "spell_type"
		PATCH_IF spell_type = 1 OR spell_type = 2 BEGIN
			LPF ADD_SPELL_PROGRESSIVE_SAVES INT_VAR n_copies1=7 caster_level_step=30 END
		END
	

	LAF ADD_PSEPB_FEAT INT_VAR min_val=12 max_val=25 step=2 abi_g=128 min_bonus_val=30 bonus_step=30 STR_VAR ability_name=~SPDCW~ target_name=~SPDCW~ END //wizard spells (int)
	LAF ADD_PSEPB_FEAT INT_VAR min_val=12 max_val=25 step=2 abi_g=130 min_bonus_val=30 bonus_step=30 STR_VAR ability_name=~SPDCP~ target_name=~SPDCP~ END //priest spells (wis)
	
	LAF ADD_PSEPB_FEAT INT_VAR min_val=12 max_val=25 step=2 abi_g=132 min_bonus_val=30 bonus_step=30 STR_VAR ability_name=~SPDCW~ target_name=~SPDCS~ END //wizard spells (cha)
	LAF ADD_PSEPB_FEAT INT_VAR min_val=12 max_val=25 step=2 abi_g=132 min_bonus_val=30 bonus_step=30 STR_VAR ability_name=~SPDCP~ target_name=~SPDCH~ END //priest spells (cha)
	
	LAF ADD_PSEPB_FEAT INT_VAR min_val=10 max_val=25 step=2 abi_g=130 min_bonus_val=8 bonus_step=30 STR_VAR ability_name=~SPDCP~ target_name=~SPDCL~ END //priest spells for paladin (wis)
	LAF ADD_PSEPB_FEAT INT_VAR min_val=10 max_val=25 step=2 abi_g=130 min_bonus_val=7 bonus_step=30 STR_VAR ability_name=~SPDCP~ target_name=~SPDCR~ END //priest spells for ranger (wis)
	

		
	//adding dc and caster level adjustments
	
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABMA.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRENS.SPL~
						feat_type_file=~SPDCWFT~ caption=~SPDCWIZ~ END
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(\(CLABMA01\)\|\(CLABSO.*\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRES.SPL~
						feat_type_file=~SPDCSFT~ caption=~SPDCSOR~ END
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABBA.*\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~SPDCSFT~ END
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~clabshgs\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~SPDCH~ END
						
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(\(CLABPR.*\)\|\(CLABDR.*\)\|\(OHTYR\)\)\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~SPDCPFT~ END			
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABSH.*\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~SPDCHFT~ END							
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=4 d_level=1 add_at_level1=0 
						STR_VAR clab=~CLABPA.*\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~SPDCLFT~ END	
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=4 d_level=1 add_at_level1=0 
						STR_VAR clab=~CLABRN.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~
						feat_type_file=~SPDCRFT~ caption=~SPDCRNG~ END