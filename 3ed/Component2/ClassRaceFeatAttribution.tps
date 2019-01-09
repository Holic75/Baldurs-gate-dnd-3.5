//-------------------------------------------------class-specific bonus feats---------------------------------------------					
//archery feats tree for archer
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=26 d_level=4 add_at_level1=0 feat_name_indexed = 1
						STR_VAR clab=~CLABRN02\.2DA~
							mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name=~SFT115_~ caption=~ARCHBFT~ END	
//priest of talos empower  magic (1, 4, 8)
	LAF ADD_FEATS_LVL INT_VAR min_level=4 max_level=8 d_level=4 add_at_level1=1 feat_name_indexed = 1
						STR_VAR clab=~CLABPR02\.2DA~
							mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name=~SFT104_~ caption=~TALSFT~ END	                            



	LAF ADD_FEATS_LVL INT_VAR min_level=4 max_level=16 d_level=4 add_at_level1=1 feat_name_indexed = 1 //f-m
						STR_VAR clab=~CLABFI01\.2DA~  mask_file=~3ed/Feats/FeatAttribution/FM_FMC.SPL~ feat_name=~ARCST~ 
                                post_index_suffix =~FT~ caption=~ARCS1~ END
                                
	LAF ADD_FEATS_LVL INT_VAR min_level=6 max_level=12 d_level=6 add_at_level1=1 feat_name_indexed = 1  //bard/fmt
						STR_VAR clab=~\(\(CLABBA.*\)\|\(CLABTH01\)\)\.2DA~  mask_file=~3ed/Feats/FeatAttribution/BARD_FMT.SPL~ feat_name=~ARCST~ 
                                post_index_suffix =~FT~ caption=~ARCS2~ END                                
                                                       
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=1 d_level=5 add_at_level1=1 //light armor for sorcerer and mt
						STR_VAR clab=~\(\(\CLABSO01\)\|\(CLABTH01\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SORC_MT.SPL~ feat_name=~ARCST1FT~ 
                                caption=~ARCS3~ END		

	
                            
//armored training (ftr, ftr-thief, ftr - cleric)
    OUTER_FOR (k=1;k<=5;k=k+1) BEGIN
        COPY ~3ed/Feats/ArmorTraining/ARMTR.SPL~ ~override/ARMTR%k%.SPL~   
           SPRINT resource EVALUATE_BUFFER ~ARMACP%k%~
           LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 2 timing = 9 duration = 1 STR_VAR resource END //dex ac penalty
           SPRINT resource EVALUATE_BUFFER ~ARMSKL%k%~
           LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 2 timing = 9 duration = 1 STR_VAR resource END //skill penalty
           SPRINT resource EVALUATE_BUFFER ~ARMTR%k%~
           LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=2 duration=1 timing=9 STR_VAR resource END            
    END
    
    //armored training at levels (4,8,12,16)
	LAF ADD_FEATS_LVL INT_VAR min_level=4 max_level=16 d_level=4 add_at_level1=0 feat_name_indexed = 1
						STR_VAR clab=~CLABFI01\.2DA~
							mask_file=~3ed/Feats/FeatAttribution/F_FT_FC.SPL~ feat_name=~ARMTR~ caption=~ARMTRFT~ END		
	
    //versatile spellcasting
	LAF ADD_FEATS_LVL INT_VAR min_level = 7 d_level = 2 max_level = 19 add_at_level1 = 0 feat_name_indexed = 1
						STR_VAR clab=~CLABPR01\.2DA~  mask_file=~3ed/Feats/FeatAttribution/SFTCRECM.SPL~ 
                            feat_name=~CM_VS~ post_index_suffix = ~FT~ caption=~CMVSFT~ END

	LAF ADD_FEATS_LVL INT_VAR min_level = 7 d_level = 3 max_level = 19 add_at_level1 = 0 feat_name_indexed = 1
						STR_VAR clab=~CLABPR01\.2DA~  mask_file=~3ed/Feats/FeatAttribution/SFTCRECM.SPL~ 
                            feat_name=~CM_VS~ post_index_suffix = ~FT~ caption=~FCMVSFT~ END                            
           
//----------------------------------------------------------race specific bonus feats
    COPY ~3ed/Feats/HalfElfBonus/HFSTRBN.SPL~ ~override~ 
    COPY ~3ed/Feats/HalfElfBonus/HFCONBN.SPL~ ~override~ 
    COPY ~3ed/Feats/HalfElfBonus/HFDEXBN.SPL~ ~override~ 
    COPY ~3ed/Feats/HalfElfBonus/HFINTBN.SPL~ ~override~ 
    COPY ~3ed/Feats/HalfElfBonus/HFWISBN.SPL~ ~override~ 
    COPY ~3ed/Feats/HalfElfBonus/HFCHABN.SPL~ ~override~ 

    COMPILE ~3ed/Feats/HalfElfBonus/hfcre.d~  
    COPY ~3ed/Feats/FeatAttribution/SFTCRE.BCS~ ~override/HFCRE.BCS~
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/HFCRE.CRE~
		WRITE_ASCII 0x248 ~HFCRE~ #8//override script
		WRITE_ASCII 0x02cc ~hfcre~ #8//dialog
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/HFCRE.EFF~
		WRITE_ASCII 0x0030 ~HFCRE~ #8//creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/HFCRE.SPL~	
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~HFCRE~ END 
		

//add bonus ability points to  half-elves at lvl1
	LAF ADD_FEATS_LVL INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 delay = 3
						STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\)\.2DA~ mask_file=~3ed/Feats/HalfElfBonus/SHFCRE.SPL~
						feat_name=~HFCRE~ caption=~HFABI~ END

		
//add bonus ability points to  small races  (gnome, halfling, goblin) at lvl1
    COPY ~3ed/Feats/SmallRacesBonus/SMLRCBN.SPL~ ~override~
	LAF ADD_FEATS_LVL INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ mask_file=~3ed/Feats/SmallRacesBonus/SMLRACE.SPL~
						feat_name=~SMLRCBN~ caption=~SMLRC~ END

//fighter and swashbuckler weapon training (+1 to hit, damage at lvls 8, 16, 24)
	LAF ADD_FEATS_LVL INT_VAR min_level=8 max_level=25 d_level=8 add_at_level1=0 indexed = 1
						STR_VAR clab=~\(\(CLABFI01\)\|\(CLABTH04\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/F_THF.SPL~
						feat_name=~SPCL141~ caption=~WPTRFT~ END



//bonus feats for swashbuckler (weapon finesse and insightfull strike)
	LAF ADD_FEATS_LVL INT_VAR min_level=8 max_level=1 d_level=8 add_at_level1=1
						STR_VAR clab=~CLABTH04\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
						feat_name=~SFT99_1~ caption=~SWBFT1~ END
	LAF ADD_FEATS_LVL INT_VAR min_level=8 max_level=1 d_level=8 add_at_level1=1
						STR_VAR clab=~CLABTH04\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
						feat_name=~SFT101_1~ caption=~SWBFT2~ END
                        