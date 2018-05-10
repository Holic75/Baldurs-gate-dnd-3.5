//-------------------------------------------------class-specific bonus feats---------------------------------------------					
//archery feats tree for archer
    COPY ~3ed/Feats/FeatAttribution/SFTCRE_E.SPL~ ~override/ARCHFT.SPL~
		FOR (i=1;i<=7;i=i+1) BEGIN
			SET lvl=4*(i - 1)
			PATCH_IF (lvl==0) BEGIN
				SET lvl=1
			END
            PATCH_IF (lvl==20) BEGIN
				SET lvl=21
			END
			LPF ADD_SPELL_HEADER INT_VAR type=1 location=4 target=5 target_count=0 range=1 required_level=lvl speed=0 END
				SPRINT resource EVALUATE_BUFFER ~SFT115_%i%~
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=12 parameter2=105 timing=0 duration=1 STR_VAR resource END // ranger
				//LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=16 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/druid
		END		
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=16 d_level=4 add_at_level1=1 
						STR_VAR clab=~CLABRN02\.2DA~
							mask_file=~~ feat_type_file=~~ caption=~ARCHFT~ END	
//2 weapon fighting for ranger
    COPY ~3ed/Feats/FeatAttribution/SFTCRE_E.SPL~ ~override/TWFFT.SPL~
		FOR (i=1;i<=7;i=i+1) BEGIN
			SET lvl=4*(i - 1)
			PATCH_IF (lvl==0) BEGIN
				SET lvl=1
			END
            PATCH_IF (lvl==20) BEGIN
				SET lvl=21
			END
			LPF ADD_SPELL_HEADER INT_VAR type=1 location=4 target=5 target_count=0 range=1 required_level=lvl speed=0 END
				SPRINT resource EVALUATE_BUFFER ~SFT114_%i%~
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=12 parameter2=105 timing=0 duration=1 STR_VAR resource END // ranger
				//LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=18 parameter2=105 timing=0 duration=1 STR_VAR resource END // cleric/rgr
		END		
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=16 d_level=4 add_at_level1=1 
						STR_VAR clab=~CLABRN01\.2DA~
							mask_file=~~ feat_type_file=~~ caption=~TWFFT~ END	
//armored arcana (ftr/mage, f/m/c, lvl1 - 6 bard lvl1 -mage/thief ;  f/m/t; battle caster )
    COPY ~3ed/Feats/FeatAttribution/SFTCRE_E.SPL~ ~override/ARMARCFT.SPL~
		FOR (i=1;i<=5;i=i+1) BEGIN
			SET lvl=4*(i - 1)
			PATCH_IF (lvl==0) BEGIN
				SET lvl=1
			END
			LPF ADD_SPELL_HEADER INT_VAR type=1 location=4 target=5 target_count=0 range=1 required_level=lvl speed=0 END
				SPRINT resource EVALUATE_BUFFER ~ARCST%i%FT~
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=7 parameter2=105 timing=0 duration=1 STR_VAR resource END // fighter/mage
                LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=17 parameter2=105 timing=0 duration=1 STR_VAR resource END // fighter/mage/cleric
				
                PATCH_IF (i==1) BEGIN
                    LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=13 parameter2=105 timing=0 duration=1 STR_VAR resource END // mage/thief
                    LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=19 parameter2=105 timing=0 duration=1 STR_VAR resource END // sorcerer (for battle caster)                    
                END
                
                PATCH_IF (i<=2) BEGIN
                    LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=10 parameter2=105 timing=0 duration=1 STR_VAR resource END // fighter/mage/thief
                    LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=5 parameter2=105 timing=0 duration=1 STR_VAR resource END // bard
                END
                
                PATCH_IF (i==4) BEGIN
                    LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=10 parameter2=105 timing=0 duration=1 STR_VAR resource = ARCST3FT END // fighter/mage/thief
                    LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=5 parameter2=105 timing=0 duration=1 STR_VAR resource = ARCST3FT END // bard
                END               
                
		END
                        
         
        
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=16 d_level=4 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~
							mask_file=~~ feat_type_file=~~ caption=~ARMARCFT~ END	
                            
                            
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=1 d_level=5 add_at_level1=1 //light armor for sorcerer
						STR_VAR clab=~CLABSO01\.2DA~
							mask_file=~~ feat_type_file=~~ caption=~ARMARCFT~ END		

	LAF ADD_BONUS_FEATS INT_VAR min_level=6 max_level=12 d_level=6 add_at_level1=1 //light armor for bard, mt and fmt, chain mail for bard and fmt at lvl 6, splint mail at lvl 12
						STR_VAR clab=~\(\(CLABBA.*\)\|\(CLABTH01\)\)\.2DA~
							mask_file=~~ feat_type_file=~~ caption=~ARMARCFT~ END	
                            
//armored training (ftr, ftr-thief, ftr - cleric)
    OUTER_FOR (k=1;k<=5;k=k+1) BEGIN
        COPY ~3ed/Feats/ArmorTraining/ARMTR.SPL~ ~override/ARMTR%k%.SPL~   
           SPRINT resource EVALUATE_BUFFER ~ARMACP%k%~
           LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 2 timing = 9 duration = 1 STR_VAR resource END //dex ac penalty
           SPRINT resource EVALUATE_BUFFER ~ARMSKL%k%~
           LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 2 timing = 9 duration = 1 STR_VAR resource END //skill penalty
    END
    
   
    COPY ~3ed/Feats/FeatAttribution/SFTCRE_E.SPL~ ~override/ARMTRFT.SPL~
		FOR (i=1;i<=5;i=i+1) BEGIN
			SET lvl=4*(i - 1)
			PATCH_IF (lvl==0) BEGIN
				SET lvl=1
			END
			LPF ADD_SPELL_HEADER INT_VAR type=1 location=4 target=5 target_count=0 range=1 required_level=lvl speed=0 END
				SPRINT resource EVALUATE_BUFFER ~ARMTR%i%~
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=2 parameter2=105 timing=0 duration=1 STR_VAR resource END // fighter
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=9 parameter2=105 timing=0 duration=1 STR_VAR resource END // fighter/thief
                LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=8 parameter2=105 timing=0 duration=1 STR_VAR resource END // fighter/cleric
		END
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=16 d_level=4 add_at_level1=1 
						STR_VAR clab=~CLABFI01\.2DA~
							mask_file=~~ feat_type_file=~~ caption=~ARMTRFT~ END		
		


   COPY ~3ed/Feats/FeatAttribution/SFTCRE_E.SPL~ ~override/CM_VSFT.SPL~
// versatile spellcasting (cm)
        FOR (i=1;i<=7;i=i+1) BEGIN       
            SET lvl = (i==1) ? 1 : 2*i+5
            LPF ADD_SPELL_HEADER INT_VAR type=1 location=4 target=5 target_count=0 range=1 required_level=lvl speed=0 END
			SPRINT resource EVALUATE_BUFFER ~CM_VS%i%FT~
			LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=14 parameter2=105 timing=0 duration=1 STR_VAR resource END // cleric_mage
		END
        
	LAF ADD_BONUS_FEATS INT_VAR min_level = 7 d_level = 2 max_level = 19 add_at_level1 = 0
						STR_VAR clab=~CLABPR01\.2DA~
							mask_file=~~ feat_type_file=~~ caption=~CM_VSFT~ END	
    
    COPY ~3ed/Feats/FeatAttribution/SFTCRE_E.SPL~ ~override/FCM_VSFT.SPL~    
// versatile spellcasting (fcm)                            
        FOR (i=1;i<=5;i=i+1) BEGIN       
            SET lvl = (i==1) ? 1 : 3*i+4
            LPF ADD_SPELL_HEADER INT_VAR type=1 location=4 target=5 target_count=0 range=1 required_level=lvl speed=0 END
			SPRINT resource EVALUATE_BUFFER ~CM_VS%i%FT~
			LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=17 parameter2=105 timing=0 duration=1 STR_VAR resource END // fighter_mage_cleric
		END
        
	LAF ADD_BONUS_FEATS INT_VAR min_level = 7 d_level = 3 max_level = 19 add_at_level1 = 0
						STR_VAR clab=~CLABPR01\.2DA~
							mask_file=~~ feat_type_file=~~ caption=~FCM_VSFT~ END	
        
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
		LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~HFCRE~ END
		

//add bonus ability points to  half-elves at lvl1
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 delay = 3
						STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\)\.2DA~ mask_file=~3ed/Feats/HalfElfBonus/SHFCRE.SPL~
						feat_type_file=~HFCRE~ caption=~HLELFBON~ END

		
//add bonus ability points to  small races  (gnome, halfling, goblin) at lvl1
COPY ~3ed/Feats/SmallRacesBonus/SMLRCBN.SPL~ ~override~ 	

	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ mask_file=~3ed/Feats/SmallRacesBonus/SMLRACE.SPL~
						feat_type_file=~SMLRCBN~ caption=~SMLRACE~ END

//fighter weapon training (+1 to hit, damage at lvls 8, 16, 24)
	LAF ADD_BONUS_FEATS INT_VAR min_level=9 max_level=25 d_level=8 add_at_level1=0 
						STR_VAR clab=~CLABFI01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREF.SPL~
						feat_type_file=~SPCL141~ caption=~WPNTRN~ END

		