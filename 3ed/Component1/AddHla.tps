

	 COPY ~3ed/Classes/Epic~ ~override~
	
        COPY_EXISTING ~FTR_EPC.SPL~ ~override/FM_EPC.SPL~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 7 duration = 1 STR_VAR resource =~FM_EPC~ END
        LAF CREATE_SPL_COPIES_WITH_PROTECTION INT_VAR index_start = 1 index_end = 4 STR_VAR input_name = ~FM_EPC~ output_name = ~FM_EP~ END
            
        COPY_EXISTING ~FTR_EPC.SPL~ ~override/FC_EPC.SPL~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 7 duration = 1 STR_VAR resource =~FC_EPC~ END
        LAF CREATE_SPL_COPIES_WITH_PROTECTION INT_VAR index_start = 1 index_end = 4 STR_VAR input_name = ~FC_EPC~ output_name = ~FC_EP~ END
            
        COPY_EXISTING ~FTR_EPC.SPL~ ~override~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 2 duration = 1 STR_VAR resource =~FTR_EPC~ END
        LAF CREATE_SPL_COPIES_WITH_PROTECTION INT_VAR index_start = 1 index_end = 4 STR_VAR input_name = ~FTR_EPC~ output_name = ~FTR_EP~ END

            
		//fighter hardiness (21,26) and resist magic (23,28)
		LAF ADD_BONUS_FEATS INT_VAR mask=0b1010010100000000000000000000 indexed = 1
						STR_VAR clab=~CLABFI01\.2DA~ caption=~FTR_EP~ END
                        
			
		//fighter - mage resist magic (23,28)
		LAF ADD_BONUS_FEATS INT_VAR mask = 0b1000010000000000000000000000 indexed = 1
						STR_VAR clab=~CLABFI01\.2DA~ caption=~FM_EP~ END
						
                      
		//thief traps (pure class except shadowdancer)						
        COPY_EXISTING ~THF_EPC.SPL~ ~override~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 4 duration = 1 STR_VAR resource =~THF_EPC~ END
        LAF CREATE_SPL_COPIES_WITH_PROTECTION INT_VAR index_start = 1 index_end = 4 STR_VAR input_name = ~THF_EPC~ output_name = ~THF_EP~ END
            
		LAF ADD_BONUS_FEATS INT_VAR mask = 0b101011010100000000000000000000  indexed = 1
						STR_VAR clab=~\(\(CLABTH01\)\|\(CLABTH02\)\|\(CLABTH03\)\|\(CLABTH04\)\)\.2DA~ caption=~THF_EP~ END	
							
		//pure class wizard/sorcerer epic spells							
        COPY_EXISTING ~WIZ_EPC.SPL~ ~override~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 105 parameter1 = 7 duration = 1 STR_VAR resource =~WIZ_EPC~ END //ftr_mage
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 105 parameter1 = 14 duration = 1 STR_VAR resource =~WIZ_EPC~ END //cleric_mage
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 105 parameter1 = 13 duration = 1 STR_VAR resource =~WIZ_EPC~ END //thief_mage
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 105 parameter1 = 10 duration = 1 STR_VAR resource =~WIZ_EPC~ END //f/m/t
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 105 parameter1 = 17 duration = 1 STR_VAR resource =~WIZ_EPC~ END //f/c/m   
        LAF CREATE_SPL_COPIES_WITH_PROTECTION INT_VAR index_start = 1 index_end = 4 STR_VAR input_name = ~WIZ_EPC~ output_name = ~WIZ_EP~ END
        
		LAF ADD_BONUS_FEATS INT_VAR min_level=21 max_level=24 d_level=1 add_at_level1=0 indexed = 1
						STR_VAR clab=~CLABMA.+\.2DA~  caption=~WIZ_EP~ END	
						
		 //pure class cleric epic spells
        COPY_EXISTING ~CLR_EPC.SPL~ ~override~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 3 duration = 1 STR_VAR resource =~CLR_EPC~ END 
        LAF CREATE_SPL_COPIES_WITH_PROTECTION INT_VAR index_start = 1 index_end = 6 STR_VAR input_name = ~CLR_EPC~ output_name = ~CLR_EP~ END
        
		LAF ADD_BONUS_FEATS INT_VAR min_level=19 max_level=24 d_level=1 add_at_level1=0 indexed = 1
						STR_VAR clab=~\(\(CLABPR.+\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~  caption=~CLR_EP~ END	
						
		//pure class druid epic spells
        COPY_EXISTING ~DRD_EPC.SPL~ ~override~
            LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 318 target = 2 parameter2 = 115 parameter1 = 11 duration = 1 STR_VAR resource =~DRD_EPC~ END 
        LAF CREATE_SPL_COPIES_WITH_PROTECTION INT_VAR index_start = 1 index_end = 7 STR_VAR input_name = ~DRD_EPC~ output_name = ~DRD_EP~ END
        
		LAF ADD_BONUS_FEATS INT_VAR mask = 0b111111000100000000000000 indexed = 1
						STR_VAR clab=~\(CLABDR.+\)\.2DA~ caption=~DRD_EP~ END	
						
						
		 //epic shaman spells
        LAF CREATE_SPL_COPIES_WITH_PROTECTION INT_VAR index_start = 1 index_end = 6 STR_VAR input_name = ~SHM_EPC~ output_name = ~SHM_EP~ END
		LAF ADD_BONUS_FEATS INT_VAR min_level=19 max_level=24 d_level=1 add_at_level1=0 indexed = 1
						STR_VAR clab=~CLABSH.+\.2DA~   caption=~SHM_EP~  END	