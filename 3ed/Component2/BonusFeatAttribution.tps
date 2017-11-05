//-------------------------------------------bonus feats attribution---------------------------------------------------		
	INCLUDE ~3ed/ADD_BONUS_FEATS.tph~
//add bonus feats to fighter (lvl1 and every even level)
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=30 d_level=2 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREF.SPL~ feat_type_file=~FFTCRE~ caption=~FTRBONFT~ END
						
//add bonus feats to barbarian and dwarven defender every 5 levels starting from lvl5
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~\(CLABFI05\)\|\(CLABFI06\)\.2DA~ feat_type_file=~FFTCRE~ caption=~FTRBONFT~ END
						
//add bonus feats to berzerker, wizardslayer, kensai
	LAF ADD_BONUS_FEATS INT_VAR min_level=25 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~\(CLABFI02\)\|\(CLABFI03\)\|\(CLABFI04\)\.2DA~ feat_type_file=~FFTCRE~ caption=~FTREPCFT~ END

//add bonus feats to ftr/cleric every 4 levels and at level 1
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=30 d_level=4 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFC.SPL~ feat_type_file=~SFTCRE~ caption=~F_CBONFT~ END
						
//set delay to 1 second (to avoid hangup on 1st level character creation)
	COPY_EXISTING ~F_CBONFT.SPL~ ~override~
		LPF  ALTER_SPELL_EFFECT INT_VAR duration  =1 timing =3  END
	
//same for ftr/mage
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFM.SPL~ feat_type_file=~SFTCRE~ caption=~F_MBONFT~ END
						
//add bonus feats to ftr/thief every 3 levels starting from lvl1
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=30 d_level=3 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFT.SPL~ feat_type_file=~FFTCRE~ caption=~F_TBONFT~ END	
					
//add bonus feats to thief (everyone except assasin and ninja) (lvl 10,13,16,19 )
	LAF ADD_BONUS_FEATS INT_VAR min_level=10 max_level=30 d_level=3 add_at_level1=0 
						STR_VAR clab=~\(CLABTH01\)\|\(CLABTH04\)\|\(CLABTH05\)\.2DA~
							mask_file=~3ed/Feats/FeatAttribution/SFTCRET.SPL~ feat_type_file=~FFTCRE~ caption=~THFBONFT~ END	
							
//add bonus feats to assasin and ninja
	LAF ADD_BONUS_FEATS INT_VAR min_level=25 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~\(CLABTH02\)\|\(CLABTH03\)\.2DA~
							mask_file=~3ed/Feats/FeatAttribution/SFTCRET.SPL~ feat_type_file=~FFTCRE~ caption=~THFEPCFT~ END	
 				
							
//add bonus feats to mage and sorcerer every 5 levels starting from lvl 5
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABMA+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREW.SPL~ feat_type_file=~MFTCRE~ caption=~WIZBONFT~ END
//battle caster
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABSO01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRES.SPL~ feat_type_file=~SFTCRE~ caption=~BCSBONFT~ END
//same for mage thief
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABMA+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREMT.SPL~ feat_type_file=~SFTCRE~ caption=~M_TBONFT~ END
//bards
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABBA+.*\.2DA~ mask_file=~~ caption=~SFTCRE~ END		

//epic feats to cleric, cleric - thief, cleric-ranger
	LAF ADD_BONUS_FEATS INT_VAR min_level=25 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABPR+.*\.2DA~ feat_type_file=~SFTCRE~ caption=~CEPCCFT~ END
						
						
//epic feats to druid, fighter - druid
	LAF ADD_BONUS_FEATS INT_VAR min_level=25 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABDR+.*\.2DA~ feat_type_file=~SFTCRE~ caption=~DEPCCFT~ END
						
//epic feats to rangers
	LAF ADD_BONUS_FEATS INT_VAR min_level=25 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABRN+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~ feat_type_file=~SFTCRE~ caption=~REPCCFT~ END

//epic feats to paladin
	LAF ADD_BONUS_FEATS INT_VAR min_level=25 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABPA+.*\.2DA~ feat_type_file=~SFTCRE~ caption=~PEPCCFT~ END		

//epic feats to monk
	LAF ADD_BONUS_FEATS INT_VAR min_level=25 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABMO+.*\.2DA~ feat_type_file=~FFTCRE~ caption=~MEPCCFT~ END		

//epic feats to shaman
	LAF ADD_BONUS_FEATS INT_VAR min_level=25 max_level=30 d_level=5 add_at_level1=0 
						STR_VAR clab=~CLABSH+.*\.2DA~ feat_type_file=~SFTCRE~ caption=~SEPCCFT~ END	
						
//add bonus feat to humans at lvl1
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(CLAB+.*\)\|\(OHTYR\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREH.SPL~ feat_type_file=~SFTCRE~ caption=~HUMBONFT~ END