//-------------------------------------------bonus feats attribution---------------------------------------------------		
	INCLUDE ~3ed/ADD_BONUS_FEATS.tph~
//add bonus feats to fighter (lvl1 and every even level)
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=30 d_level=2 add_at_level1=1 delay = 2 indexed = 1
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREF.SPL~ feat_type_file=~FFTCRE~ caption=~FTRBFT~ END
						
//add bonus feats to wizardslayer (hexblade) every 5 levels starting from lvl5
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1000001010000100001000010000 delay = 2 indexed = 1
						STR_VAR clab=~CLABFI03\.2DA~ caption=~FTRBFT~ END

//add bonus feats to barbarian and dwarven defender every 4 levels starting from lvl5
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1000001010001000100010001000 delay = 2 indexed = 1
						STR_VAR clab=~\(\(CLABFI05\)\|\(CLABFI06\)\)\.2DA~ caption=~FTRBFT~ END
						
//add bonus feats to berzerker
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABFI02\.2DA~ caption=~FTRBFT~ END
//add bonus feats to  kensai
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABFI04\.2DA~ caption=~FTRBFT~ END

//add bonus feats to ftr/cleric at level 4, 8, 12, 16, 20
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=20 d_level=4 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFC.SPL~ feat_type_file=~FFTCRE~ caption=~F_CBFT~ END
                        
//add bonus feats to ftr/druid at level 4, 8, 12, 16, 20
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=20 d_level=4 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_type_file=~FFTCRE~ caption=~F_DBFT~ END
						
	
// ftr/mage (4, 8, 12, 16, 20, 22, 25 ,28)
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010001000100010001000 delay = 2  indexed = 1
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFM.SPL~ feat_type_file=~SFTCRE~ caption=~F_MBFT~ END
// ftr/mage/thief (8, 14, 20, 22, 25 ,28)
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010000010000010000000 delay = 2  indexed = 1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRFMT.SPL~ feat_type_file=~SFTCRE~ caption=~FMTBFT~ END
                        
                        
//same for ftr/mage/cleric (10,20,22,25,28)
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010000000001000000000 delay = 2  indexed = 1
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRFMC.SPL~ feat_type_file=~SFTCRE~ caption=~FMCBFT~ END
						
//add bonus feats to ftr/thief every 3 levels starting from lvl1
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=30 d_level=3 add_at_level1=1 delay = 2 indexed = 1
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFT.SPL~ feat_type_file=~FFTCRE~ caption=~F_TBFT~ END	
					
//add bonus feats to ninja, assasin and shadowdancer (lvl 8,16,22,28 )
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1000001000001000000010000000 delay = 2 indexed = 1
						STR_VAR clab=~\(\(CLABTH02\)\|\(CLABTH05\)\|\(CLABTH03\)\)\.2DA~
							mask_file=~3ed/Feats/FeatAttribution/SFTCRET.SPL~ feat_type_file=~FFTCRE~ caption=~THFBFT~ END	
//add bonus feats to thief and swashbuckler (lvl 4,8,12,16,20,22, 25 ,28 )
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010001000100010001000 delay = 2 indexed = 1
						STR_VAR clab=~\(\(CLABTH04\)\|\(CLABTH01\)\)\.2DA~ caption=~THFBFT~ END	
                        
//same for mage thief (10,20,22, 25, 28)
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010000000001000000000 delay = 2 indexed = 1
						STR_VAR clab=~CLABMA.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREMT.SPL~ feat_type_file=~SFTCRE~ caption=~M_TBFT~ END
                        
//add bonus feats to mage and sorcerer every 5 levels starting from lvl 5 till lvl 20, then at lvls 22 and 28
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1000001010000100001000010000 delay = 2 indexed = 1
						STR_VAR clab=~CLABMA.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREW.SPL~ feat_type_file=~MFTCRE~ caption=~WIZBFT~ END
//battle caster
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010000100001000010000 delay = 2 indexed = 1
						STR_VAR clab=~CLABSO01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRES.SPL~ feat_type_file=~SFTCRE~ caption=~BCSBFT~ END

//epic feats for bards
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABBA.*\.2DA~ mask_file=~~ caption=~SFTCRE~ END		
	                        
//epic feats to cleric
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABPR.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREC.SPL~ feat_type_file=~SFTCRE~ caption=~CLREFT~ END
	
//bonus combat feats to priest of helm
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=20 d_level=5 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABPR03\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREC.SPL~ feat_type_file=~FFTCRE~ caption=~HLMEFT~ END
                        
//epic feats to mage - cleric
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRECM.SPL~ feat_type_file=~MFTCRE~ caption=~M_CEFT~ END    
                        
//feats to cleric - thief (10,20,22,25,28)
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010000000001000000000 delay = 2  indexed = 1
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRECT.SPL~ feat_type_file=~SFTCRE~ caption=~C_TEFT~ END 
//style feats to ranger
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=26 d_level=4 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABRN01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~ feat_type_file=~TFTCRE~ caption=~RNGBFT~ END
//style feats to cleric-ranger
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=26 d_level=8 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRERC.SPL~ feat_type_file=~TFTCRE~ caption=~R_CBBFT~ END  
                        
//epic feats to cleric - ranger
	LAF ADD_BONUS_FEATS INT_VAR min_level=28 max_level=28 d_level=6 add_at_level1=1 delay = 2 indexed = 1//replacement feat at level 1 
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRERC.SPL~ feat_type_file=~SFTCRE~ caption=~R_CEFT~ END
                        
       
//epic feats to druid
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABDR+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRED.SPL~ feat_type_file=~SFTCRE~ caption=~DRDEFT~ END
	
//epic feat to fighter-druid
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABDR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_type_file=~SFTCRE~ caption=~F_DEFT~ END
//epic feat to fighter-cleric
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFC.SPL~ feat_type_file=~SFTCRE~ caption=~F_CEFT~ END
                        
//epic feats to rangers and archers
	LAF ADD_BONUS_FEATS INT_VAR min_level=28 max_level=28 d_level=1 add_at_level1=1 delay = 2 indexed = 1//replacement feat at level 1 
						STR_VAR clab=~CLABRN0[1-2]\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~ feat_type_file=~SFTCRE~ caption=~RNGEFT~ END

//epic feats to beastmasters and stalkers
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=1 delay = 2 indexed = 1//replacement feat at level 1 
						STR_VAR clab=~CLABRN0[3-4]\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~ feat_type_file=~SFTCRE~ caption=~RNGEFT~ END
                        
//epic feats to paladin
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABPA.*\.2DA~ feat_type_file=~SFTCRE~ caption=~PALEFT~ END		

//epic feats to monk
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABMO.*\.2DA~ feat_type_file=~FFTCRE~ caption=~MNKEFT~ END		

//epic feats to shaman
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 delay = 2 indexed = 1
						STR_VAR clab=~CLABSH.*\.2DA~ feat_type_file=~SFTCRE~ caption=~SHMEFT~ END	
						
//add bonus feat to humans at lvl1
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 delay = 3
						STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREH.SPL~ feat_type_file=~SFTCRE~ caption=~HUMBONFT~ END
                        
