	

	//double xp  and triple xp 
	
	COPY ~3ed/HybridXP/MLTXP.EFF~ ~override~
	COPY ~3ed/HybridXP/MLTXP.SPL~ ~override~
    COPY ~3ed/HybridXP/MLTXP1.SPL~ ~override~
    COPY ~3ed/HybridXP/MLTXP3.EFF~ ~override~
	COPY ~3ed/HybridXP/MLTXP3.SPL~ ~override~
    COPY ~3ed/HybridXP/MLTXP31.SPL~ ~override~
	
	//double multiclass
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(CLABFI01\)\|\(CLABPR01\)\|\(CLABTH01\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREM2.SPL~ feat_name=~MLTXP~ caption=~XPFIX2~ END
          
    //triple multiclass
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREM3.SPL~ feat_name=~MLTXP3~ caption=~XPFIX3~ END