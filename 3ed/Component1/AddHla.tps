

	 COPY ~3ed/Classes/Epic~ ~override~
	
        COPY_EXISTING ~FTR_EPC.SPL~ ~override/FM_EPC.SPL~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 7 duration = 1 STR_VAR resource =~FM_EPC~ END
            
        COPY_EXISTING ~FTR_EPC.SPL~ ~override/FC_EPC.SPL~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 7 duration = 1 STR_VAR resource =~FC_EPC~ END
            
        COPY_EXISTING ~FTR_EPC.SPL~ ~override~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 2 duration = 1 STR_VAR resource =~FTR_EPC~ END


            
		//fighter hardiness (21,26) and resist magic (23,28)
		LAF ADD_BONUS_FEATS INT_VAR mask=0b1010010100000000000000000000 
						STR_VAR clab=~CLABFI01\.2DA~ caption=~FTR_EPIC~ END
                        
			
		//fighter - mage resist magic (23,28)
		LAF ADD_BONUS_FEATS INT_VAR mask = 0b1000010000000000000000000000 
						STR_VAR clab=~CLABFI01\.2DA~ caption=~FM_EPIC~ END
						
                      
		//thief traps (pure class except shadowdancer)						
        COPY_EXISTING ~THF_EPC.SPL~ ~override~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 4 duration = 1 STR_VAR resource =~THF_EPC~ END
            
		LAF ADD_BONUS_FEATS INT_VAR mask = 0b101011010100000000000000000000  
						STR_VAR clab=~\(CLABTH01\)\|\(CLABTH02\)\|\(CLABTH03\)\|\(CLABTH04\)\.2DA~ caption=~THF_EPIC~ END	
							
		//pure class wizard/sorcerer epic spells							
        COPY_EXISTING ~WIZ_EPC.SPL~ ~override~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 105 parameter1 = 7 duration = 1 STR_VAR resource =~WIZ_EPC~ END //ftr_mage
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 105 parameter1 = 14 duration = 1 STR_VAR resource =~WIZ_EPC~ END //cleric_mage
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 105 parameter1 = 13 duration = 1 STR_VAR resource =~WIZ_EPC~ END //thief_mage
            
		LAF ADD_BONUS_FEATS INT_VAR min_level=21 max_level=24 d_level=1 add_at_level1=0
						STR_VAR clab=~CLABMA+.*\.2DA~  caption=~WIZ_EPIC~ END	
						
		 //pure class cleric epic spells
        COPY_EXISTING ~CLR_EPC.SPL~ ~override~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 3 duration = 1 STR_VAR resource =~CLR_EPC~ END 
            
		LAF ADD_BONUS_FEATS INT_VAR min_level=19 max_level=24 d_level=1 add_at_level1=0
						STR_VAR clab=~CLABPR+.*\.2DA~  caption=~CLR_EPIC~ END	
						
		//pure class druid epic spells
        COPY_EXISTING ~DRD_EPC.SPL~ ~override~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 11 duration = 1 STR_VAR resource =~DRD_EPC~ END 
            
		LAF ADD_BONUS_FEATS INT_VAR mask = 0b111111000100000000000000
						STR_VAR clab=~\(CLABDR+.*\)\|\(OHTYR\)\.2DA~ caption=~DRD_EPIC~ END	
						
						
		 //epic shaman spells
		LAF ADD_BONUS_FEATS INT_VAR min_level=19 max_level=24 d_level=1 add_at_level1=0
						STR_VAR clab=~CLABSH+.*\.2DA~   caption=~SHM_EPC~  END	