

	 COPY ~3ed/Classes/Epic~ ~override~
	
		//fighter hardiness (21,26) and resist magic (23,28)
		LAF ADD_BONUS_FEATS INT_VAR mask=0b1010010100000000000000000000 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREF.SPL~ feat_type_file=~FTR_EPC~ caption=~FTR_EPIC~ END
			
		//fighter - mage resist magic (23,28)
		LAF ADD_BONUS_FEATS INT_VAR mask = 0b1000010000000000000000000000 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFM.SPL~ feat_type_file=~FTR_EPC~ caption=~FTR_EPIC~ END
						
		//thief traps (pure class except shadowdancer)						
		LAF ADD_BONUS_FEATS INT_VAR mask = 0b101011010100000000000000000000  
						STR_VAR clab=~\(CLABTH01\)\|\(CLABTH02\)\|\(CLABTH03\)\|\(CLABTH04\)\.2DA~
							mask_file=~3ed/Feats/FeatAttribution/SFTCRET.SPL~ feat_type_file=~THF_EPC~ caption=~THF_EPIC~ END	
							
		//pure class wizard/sorceror epic spells
		LAF ADD_BONUS_FEATS INT_VAR min_level=21 max_level=24 d_level=1 add_at_level1=0
						STR_VAR clab=~CLABMA+.*\.2DA~  mask_file=~3ed/Feats/FeatAttribution/SFTCREW.SPL~ feat_type_file=~WIZ_EPC~ caption=~WIZ_EPIC~ END	
						
		 //pure class cleric epic spells
		LAF ADD_BONUS_FEATS INT_VAR min_level=19 max_level=24 d_level=1 add_at_level1=0
						STR_VAR clab=~CLABPR+.*\.2DA~  mask_file=~3ed/Feats/FeatAttribution/SFTCREC.SPL~ feat_type_file=~CLR_EPC~ caption=~CLR_EPIC~ END	
						
		//pure class druid epic spells
		LAF ADD_BONUS_FEATS INT_VAR min_level=19 max_level=24 d_level=1 add_at_level1=0
						STR_VAR clab=~CLABDR+.*\.2DA~  mask_file=~3ed/Feats/FeatAttribution/SFTCRED.SPL~ feat_type_file=~DRD_EPC~ caption=~DRD_EPIC~ END	
						
						
		 //epic shaman spells
		LAF ADD_BONUS_FEATS INT_VAR min_level=19 max_level=24 d_level=1 add_at_level1=0
						STR_VAR clab=~CLABSH+.*\.2DA~   caption=~SHM_EPIC~  END	