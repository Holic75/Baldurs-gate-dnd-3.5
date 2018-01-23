//-------------------------------------------bonus feats attribution---------------------------------------------------		
	INCLUDE ~3ed/ADD_BONUS_FEATS.tph~
//add bonus feats to fighter (lvl1 and every even level)
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=30 d_level=2 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREF.SPL~ feat_type_file=~FFTCRE~ caption=~FTRBONFT~ END
						
//add bonus feats to barbarian, wizardslayer and dwarven defender every 5 levels starting from lvl5
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1000001010000100001000010000 
						STR_VAR clab=~\(CLABFI03\)\|\(CLABFI05\)\|\(CLABFI06\)\.2DA~ feat_type_file=~FFTCRE~ caption=~FTRBONFT~ END
						
//add bonus feats to berzerker
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 
						STR_VAR clab=~CLABFI02\.2DA~ feat_type_file=~FFTCRE~ caption=~FTREPCFT~ END
//add bonus feats to  kensai
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 
						STR_VAR clab=~CLABFI04\.2DA~ feat_type_file=~FFTCRE~ caption=~FTREPCFT~ END

//add bonus feats to ftr/cleric at level 4, 8, 12, 16, 20
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=20 d_level=4 add_at_level1=0
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFC.SPL~ feat_type_file=~FFTCRE~ caption=~F_CBONFT~ END
                        
//add bonus feats to ftr/druid at level 4, 8, 12, 16, 20
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=20 d_level=4 add_at_level1=0
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_type_file=~FFTCRE~ caption=~F_DBONFT~ END
						
//set delay to 1 second (to avoid hangup on 1st level character creation)
//	COPY_EXISTING ~F_CBONFT.SPL~ ~override~
//		LPF  ALTER_SPELL_EFFECT INT_VAR duration  =1 timing =3  END
//set delay to 1 second (to avoid hangup on 1st level character creation)
//	COPY_EXISTING ~F_DBONFT.SPL~ ~override~
//		LPF  ALTER_SPELL_EFFECT INT_VAR duration  =1 timing =3  END
	
// ftr/mage (5,10,15,20, 22, 25 ,28)
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010000100001000010000  
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFM.SPL~ feat_type_file=~SFTCRE~ caption=~F_MBONFT~ END
// ftr/mage/thief (10,20, 22, 25 ,28)
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010000000001000000000  
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRFMT.SPL~ feat_type_file=~SFTCRE~ caption=~FMTBONFT~ END
                        
                        
//same for ftr/mage/cleric (10,20,22,28)
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001000000100001000000000  
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRFMC.SPL~ feat_type_file=~SFTCRE~ caption=~FMCBONFT~ END
						
//add bonus feats to ftr/thief every 3 levels starting from lvl1
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=30 d_level=3 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFT.SPL~ feat_type_file=~FFTCRE~ caption=~F_TBONFT~ END	
					
//add bonus feats to thief (everyone except assasin and ninja) (lvl 10,13,16,19,22,25,28 )
	LAF ADD_BONUS_FEATS INT_VAR min_level=10 max_level=30 d_level=3 add_at_level1=0 
						STR_VAR clab=~\(CLABTH01\)\|\(CLABTH04\)\|\(CLABTH05\)\.2DA~
							mask_file=~3ed/Feats/FeatAttribution/SFTCRET.SPL~ feat_type_file=~FFTCRE~ caption=~THFBONFT~ END	
							
//add bonus feats to assasin and ninja
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 
						STR_VAR clab=~\(CLABTH02\)\|\(CLABTH03\)\.2DA~
							mask_file=~3ed/Feats/FeatAttribution/SFTCRET.SPL~ feat_type_file=~FFTCRE~ caption=~THFEPCFT~ END	
 				
//same for mage thief (10,20,22, 25, 28)
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010000000001000000000 
						STR_VAR clab=~CLABMA+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREMT.SPL~ feat_type_file=~SFTCRE~ caption=~M_TBONFT~ END
                        
//add bonus feats to mage and sorcerer every 5 levels starting from lvl 5 till lvl 20, then at lvls 22 and 28
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1000001010000100001000010000
						STR_VAR clab=~CLABMA+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREW.SPL~ feat_type_file=~MFTCRE~ caption=~WIZBONFT~ END
//battle caster
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010000100001000010000
						STR_VAR clab=~CLABSO01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRES.SPL~ feat_type_file=~SFTCRE~ caption=~BCSBONFT~ END

//epic feats for bards
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0
						STR_VAR clab=~CLABBA+.*\.2DA~ mask_file=~~ caption=~SFTCRE~ END		
	                        
//epic feats to cleric
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 
						STR_VAR clab=~CLABPR+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREC.SPL~ feat_type_file=~MFTCRE~ caption=~CEPCCFT~ END
	
//bonus combat feats to priest of helm
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=20 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABPR03\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREC.SPL~ feat_type_file=~FFTCRE~ caption=~HEPCCFT~ END
                        
//epic feats to mage - cleric
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRECM.SPL~ feat_type_file=~SFTCRE~ caption=~MCEPCFT~ END    
                        
//feats to cleric - thief (10,20,22,25,28)
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b1001001010000000001000000000  
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRECT.SPL~ feat_type_file=~SFTCRE~ caption=~CTEPCFT~ END 
                        
//epic feats to cleric - ranger
	LAF ADD_BONUS_FEATS INT_VAR min_level=28 max_level=28 d_level=1 add_at_level1=0 
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRERC.SPL~ feat_type_file=~SFTCRE~ caption=~RCEPCFT~ END
                        
//epic feats to druid
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 
						STR_VAR clab=~CLABDR+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRED.SPL~ feat_type_file=~SFTCRE~ caption=~DEPCCFT~ END
	
//epic feat to fighter-druid
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 
						STR_VAR clab=~CLABDR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_type_file=~SFTCRE~ caption=~FDEPCFT~ END
//epic feat to fighter-cleric
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=3 add_at_level1=0 
						STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFC.SPL~ feat_type_file=~SFTCRE~ caption=~FCEPCFT~ END
                        
//epic feats to rangers and archers
	LAF ADD_BONUS_FEATS INT_VAR min_level=28 max_level=28 d_level=1 add_at_level1=0 
						STR_VAR clab=~CLABRN0[1-2]\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~ feat_type_file=~SFTCRE~ caption=~REPCCFT~ END

//epic feats to beastmasters and stalkers
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 
						STR_VAR clab=~CLABRN0[3-4]\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~ feat_type_file=~SFTCRE~ caption=~REPCFT2~ END
                        
//epic feats to paladin
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 
						STR_VAR clab=~CLABPA+.*\.2DA~ feat_type_file=~SFTCRE~ caption=~PEPCCFT~ END		

//epic feats to monk
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 
						STR_VAR clab=~CLABMO+.*\.2DA~ feat_type_file=~FFTCRE~ caption=~MEPCCFT~ END		

//epic feats to shaman
	LAF ADD_BONUS_FEATS INT_VAR min_level=22 max_level=28 d_level=6 add_at_level1=0 
						STR_VAR clab=~CLABSH+.*\.2DA~ feat_type_file=~SFTCRE~ caption=~SEPCCFT~ END	
						
//add bonus feat to humans at lvl1
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(CLAB+.*\)\|\(OHTYR\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREH.SPL~ feat_type_file=~SFTCRE~ caption=~HUMBONFT~ END