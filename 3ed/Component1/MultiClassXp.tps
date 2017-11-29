	
/* 	//xp regularization for multiclasses
	OUTER_FOR (player_id=1;player_id<=6;player_id=player_id+1) BEGIN
		EXTEND_TOP ~BALDUR.BCS~ ~3ed/HybridXP/XPPlayer.baf~
			EVALUATE_BUFFER	
	END
	EXTEND_TOP ~BALDUR.BCS~ ~3ed/HybridXP/XPMRK.baf~ */
	
	//double xp  and triple xp 
	
	COPY ~3ed/HybridXP/MLTXP.EFF~ ~override~
	COPY ~3ed/HybridXP/MLTXP.SPL~ ~override~
    COPY ~3ed/HybridXP/MLTXP1.SPL~ ~override~
    COPY ~3ed/HybridXP/MLTXP3.EFF~ ~override~
	COPY ~3ed/HybridXP/MLTXP3.SPL~ ~override~
    COPY ~3ed/HybridXP/MLTXP31.SPL~ ~override~
	
	//fighter/mage
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFM.SPL~ feat_type_file=~MLTXP~ caption=~MLTXPF_M~ END
	//fighter/cleric
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFC.SPL~ feat_type_file=~MLTXP~ caption=~MLTXPF_C~ END
	//fighter/thief
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFT.SPL~ feat_type_file=~MLTXP~ caption=~MLTXPF_T~ END
	//fighter/druid
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_type_file=~MLTXP~ caption=~MLTXPF_D~ END
						
	//cleric/ranger
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRERC.SPL~ feat_type_file=~MLTXP~ caption=~MLTXPR_C~ END
	//cleric/thief
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRECT.SPL~ feat_type_file=~MLTXP~ caption=~MLTXPC_T~ END
	//cleric/mage
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRECM.SPL~ feat_type_file=~MLTXP~ caption=~MLTXPC_M~ END
		
    //mage/thief
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABTH01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREMT.SPL~ feat_type_file=~MLTXP~ caption=~MLTXPM_T~ END		
	

    //fighter/mage/thief
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRFMT.SPL~ feat_type_file=~MLTXP3~ caption=~MLTXPFMT~ END    
    //fighter/mage/cleric
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRFMC.SPL~ feat_type_file=~MLTXP3~ caption=~MLTXPFMC~ END
	//COPY ~3ed/HybridXP/%GameId%/STARTARE.2DA~ ~override~