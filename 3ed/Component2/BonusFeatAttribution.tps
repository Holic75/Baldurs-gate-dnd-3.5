//-------------------------------------------bonus feats attribution---------------------------------------------------		

//add bonus feats to fighter (lvl1 and every even level)
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=2 add_at_level1=1 delay = 2
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREF.SPL~ feat_name=~FFTCRE~ caption=~FTRBFT~ END
						
//add bonus feats to wizardslayer (hexblade) every 5 levels starting from lvl5 (reuse fighter's)
	LAF ADD_FEATS_MASK INT_VAR mask = 0b1000001010000100001000010000 delay = 2 feat_name_indexed = 1
						STR_VAR clab=~CLABFI03\.2DA~ feat_name=~FTRBFT~ caption=~FTRBFT~ END

//add bonus feats to barbarian and dwarven defender every 4 levels starting from lvl5 (reuse fighter's)
	LAF ADD_FEATS_MASK INT_VAR mask = 0b1000001010001000100010001000 delay = 2 feat_name_indexed = 1
						STR_VAR clab=~\(\(CLABFI05\)\|\(CLABFI06\)\)\.2DA~ feat_name=~FTRBFT~ caption=~FTRBFT~ END
						
//add bonus feats to berzerker (reuse fighter's)
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 delay = 2 feat_name_indexed = 1
						STR_VAR clab=~CLABFI02\.2DA~ feat_name=~FTRBFT~ caption=~FTRBFT~ END
//add bonus feats to  kensai (reuse fighter's)
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2 feat_name_indexed = 1
						STR_VAR clab=~CLABFI04\.2DA~ feat_name=~FTRBFT~ caption=~FTRBFT~ END

//add bonus feats to ftr/cleric at level 4, 8, 12, 16, 20
	LAF ADD_FEATS_LVL INT_VAR min_level=4 max_level=20 d_level=4 add_at_level1=0 delay = 2
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFC.SPL~ feat_name=~FFTCRE~ caption=~F_CBFT~ END
                        
//add bonus feats to ftr/druid at level 4, 8, 12, 16, 20
	LAF ADD_FEATS_LVL INT_VAR min_level=4 max_level=20 d_level=4 add_at_level1=0 delay = 2
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_name=~FFTCRE~ caption=~F_DBFT~ END
							
// ftr/mage (4, 8, 12, 16, 20, 22, 25 ,28)
	LAF ADD_FEATS_MASK INT_VAR mask = 0b1001001010001000100010001000 delay = 2 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFM.SPL~ feat_name=~SFTCRE~ caption=~F_MBFT~ END
// ftr/mage/thief (8, 14, 20, 22, 25 ,28)
	LAF ADD_FEATS_MASK INT_VAR mask = 0b1001001010000010000010000000 delay = 2
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRFMT.SPL~ feat_name=~SFTCRE~ caption=~FMTBFT~ END
                                              
//same for ftr/mage/cleric (10,20,22,25,28)
	LAF ADD_FEATS_MASK INT_VAR mask = 0b1001001010000000001000000000 delay = 2
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRFMC.SPL~ feat_name=~SFTCRE~ caption=~FMCBFT~ END
						
//add bonus feats to ftr/thief every 3 levels starting from lvl1
	LAF ADD_FEATS_MASK INT_VAR min_level=4 max_level=30 d_level=3 add_at_level1=1 delay = 2
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFT.SPL~ feat_name=~FFTCRE~ caption=~F_TBFT~ END	
					
//add bonus feats to thief and swashbuckler (lvl 4,8,12,16,20,22, 25 ,28 )
	LAF ADD_FEATS_MASK INT_VAR mask = 0b1001001010001000100010001000 delay = 2
						STR_VAR clab=~\(\(CLABTH04\)\|\(CLABTH01\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRET.SPL~ feat_name=~FFTCRE~ caption=~THFBFT~ END	
//add bonus feats to ninja, assasin and shadowdancer (lvl 8,16,22,28 ) (reuse thief's)
	LAF ADD_FEATS_MASK INT_VAR mask = 0b1000001000001000000010000000 delay = 2 feat_name_indexed = 1
						STR_VAR clab=~\(\(CLABTH02\)\|\(CLABTH05\)\|\(CLABTH03\)\)\.2DA~ feat_name=~THFBFT~ caption=~THFBFT~ END	
                            
//same for mage thief (10,20,22, 25, 28)
	LAF ADD_FEATS_LVL INT_VAR mask = 0b1001001010000000001000000000 delay = 2 
						STR_VAR clab=~CLABMA.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREMT.SPL~ feat_name=~SFTCRE~ caption=~M_TBFT~ END
                        
//add bonus feats to mage and sorcerer every 5 levels starting from lvl 5 till lvl 20, then at lvls 22 and 28
	LAF ADD_FEATS_MASK INT_VAR mask = 0b1000001010000100001000010000 delay = 2 
						STR_VAR clab=~CLABMA.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREW.SPL~ feat_name=~MFTCRE~ caption=~WIZBFT~ END
//battle caster
	LAF ADD_FEATS_MASK INT_VAR mask = 0b1001001010000100001000010000 delay = 2 
						STR_VAR clab=~CLABSO01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRES.SPL~ feat_name=~SFTCRE~ caption=~BCSBFT~ END

//epic feats for bards
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2 
						STR_VAR clab=~CLABBA.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name=~SFTCRE~ caption = ~BREFT~ END		
	                        
//epic feats to cleric
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2 
						STR_VAR clab=~CLABPR.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREC.SPL~ feat_name=~SFTCRE~ caption=~CLREFT~ END
	
//bonus combat feats to priest of helm
	LAF ADD_FEATS_LVL INT_VAR min_level=5 max_level=20 d_level=5 add_at_level1=0 delay = 2 
						STR_VAR clab=~CLABPR03\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREC.SPL~ feat_name=~FFTCRE~ caption=~HLMEFT~ END
                        
//epic feats to mage - cleric
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 delay = 2
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRECM.SPL~ feat_name=~MFTCRE~ caption=~M_CEFT~ END    
                        
//feats to cleric - thief (10,20,22,25,28)
	LAF ADD_FEATS_MASK INT_VAR mask = 0b1001001010000000001000000000 delay = 2 
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRECT.SPL~ feat_name=~SFTCRE~ caption=~C_TEFT~ END 
//style feats to ranger
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=26 d_level=4 add_at_level1=0 delay = 2
						STR_VAR clab=~CLABRN01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~ feat_name=~TFTCRE~ caption=~RNGBFT~ END
//style feats to cleric-ranger
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=26 d_level=8 add_at_level1=0 delay = 2
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRERC.SPL~ feat_name=~TFTCRE~ caption=~R_CBBFT~ END  
                        
//epic feats to cleric - ranger
	LAF ADD_FEATS_LVL INT_VAR min_level=28 max_level=28 d_level=6 add_at_level1=1 delay = 2//replacement feat at level 1 
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRERC.SPL~ feat_name=~SFTCRE~ caption=~R_CEFT~ END
                               
//epic feats to druid
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2
						STR_VAR clab=~CLABDR+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRED.SPL~ feat_name=~SFTCRE~ caption=~DRDEFT~ END
	
//epic feat to fighter-druid
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 delay = 2
						STR_VAR clab=~CLABDR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_name=~SFTCRE~ caption=~F_DEFT~ END
//epic feat to fighter-cleric
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 delay = 2
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFC.SPL~ feat_name=~SFTCRE~ caption=~F_CEFT~ END
                        
//epic feats to rangers and archers
	LAF ADD_FEATS_LVL INT_VAR min_level=28 max_level=28 d_level=1 add_at_level1=1 delay = 2//replacement feat at level 1 
						STR_VAR clab=~CLABRN0[1-2]\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~ feat_name=~SFTCRE~ caption=~RNGEFT~ END

//epic feats to beastmasters and stalkers
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=1 delay = 2//replacement feat at level 1 
						STR_VAR clab=~CLABRN0[3-4]\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~ feat_name=~SFTCRE~ caption=~RNGEFT~ END
                        
//epic feats to paladin
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2
						STR_VAR clab=~CLABPA.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name=~SFTCRE~ caption=~PALEFT~ END		

//epic feats to monk
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2 
						STR_VAR clab=~CLABMO.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name=~FFTCRE~ caption=~MNKEFT~ END		

//epic feats to shaman
	LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2
						STR_VAR clab=~CLABSH.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name=~SFTCRE~ caption=~SHMEFT~ END	
						
//add bonus feat to humans at lvl1
	LAF ADD_FEATS_LVL INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 delay = 3
						STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREH.SPL~ feat_name=~SFTCRE~ caption=~HUMBFT~ END
   
