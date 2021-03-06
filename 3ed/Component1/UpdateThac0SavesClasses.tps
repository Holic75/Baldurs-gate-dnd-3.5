	
	
    
	//thaco regularization
	OUTER_FOR (i= (0 - 5);i<=20;i=i+1) BEGIN
		COPY ~3ed/Core/THAC0/THAC0.SPL~ ~override/THAC0%i%.SPL~
            PATCH_IF (i>=0) BEGIN
                LPF ALTER_SPELL_EFFECT_EX INT_VAR parameter1=i END
            END
            ELSE BEGIN//replace with bonus since base thac0 can not go below 0
                LPF ALTER_SPELL_EFFECT_EX INT_VAR parameter1= (0 - i) parameter2 = 0 timing = 9 END
                LPF CLONE_EFFECT INT_VAR match_opcode = 54 parameter1= 0 parameter2 = 1 timing = 1 END
            END
	END
	//medium thaco
    OUTER_SET prev_high = 0
    OUTER_SET prev_med = 0
    OUTER_SET prev_low = 0
    OUTER_FOR (i=1;i<=30;i=i+1) BEGIN
 
        COPY ~3ed/Core/THAC0/THAC0M.SPL~ ~override/THAC0M%i%.SPL~
			LPF ADD_SPELL_HEADER INT_VAR type=1 location=4 target=5 target_count=0 range=1 required_level=1 speed=0 END
				SET r = 20 - (3*i/4)
                PATCH_IF (i<=20) BEGIN
                    SET r = 20 - (3*i/4)
                END
                ELSE BEGIN
                    SET r = 5 - (3*(i - 20)/8)
                END
				SPRINT resource EVALUATE_BUFFER ~THAC0%r%~
				LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 parameter1=8 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/cleric
				LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 parameter1=16 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/druid
				LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 parameter1=7 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/mage
                LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 parameter1=17 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/cleric/mage
                LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 parameter1=10 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/mage/thief
				LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 parameter1=9 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/thief
                LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 parameter1=18 parameter2=105 timing=0 duration=1 STR_VAR resource END // cleric/ranger
				LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 parameter1=19 parameter2=105 timing=0 duration=1 STR_VAR resource END // sorceror for battle caster
                PATCH_IF (i > 1) BEGIN
                    SPRINT resource EVALUATE_BUFFER ~THAC0%prev_med%~
                    LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode=321 target=2 timing=0 duration=1  STR_VAR resource END //remove effects
                END
                SET prev_med = r
        
        ACTION_IF (i <= 20) BEGIN
            OUTER_SET high_r = 20 - i
        END
        ELSE BEGIN
            OUTER_SET high_r = 0 - ((i - 20)/2)
        END
        COPY_EXISTING ~THAC0%high_r%.SPL~   ~override/THAC0H%i%.SPL~
            PATCH_IF (i > 1) BEGIN
                SPRINT resource EVALUATE_BUFFER ~THAC0H%prev_high%~
                LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode=321 target=2 timing=0 duration=1  STR_VAR resource END //remove effects
            END
            SET prev_high = i
        
	COPY ~3ed/Core/THAC0/THAC0M.SPL~ ~override/THAC0L%i%.SPL~
        LPF ADD_SPELL_HEADER INT_VAR type=1 location=4 target=5 target_count=0 range=1 required_level=1 speed=0 END
            
            PATCH_IF (i <= 20) BEGIN
                SET r = 20 - (i/2)
            END
            ELSE BEGIN
                SET r = 10 - ((i - 20)/4)
            END
            SPRINT resource EVALUATE_BUFFER ~THAC0%r%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 parameter1=13 parameter2=105 timing=0 duration=1 STR_VAR resource END // mage/thief
            LPF ADD_SPELL_EFFECT INT_VAR opcode=326 target=2 parameter1=14 parameter2=105 timing=0 duration=1 STR_VAR resource END // cleric/mage
            PATCH_IF (i > 1) BEGIN
                SPRINT resource EVALUATE_BUFFER ~THAC0%prev_low%~
                LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode=321 target=2 timing=0 duration=1  STR_VAR resource END //remove effects
            END
            SET prev_low = r
            
       
	END
                
	//high thaco for swashbuckler
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=1 feat_name_indexed = 1
						STR_VAR clab=~CLABTH04\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
						feat_name=~THAC0H~ caption=~THACH~ END	
    //high thac0 for epic level warriors
    LAF ADD_FEATS_LVL INT_VAR min_level=21 max_level=30 d_level=1 add_at_level1=0 feat_name_indexed = 1 feat_name_index_start = 21
                    STR_VAR clab=~\(\(CLABFI.+\)\|\(CLABPA.+\)\|\(CLABRN.+\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/APR_H.SPL~
                    feat_name=~THAC0H~ caption=~THACW~ END	
	//medium thaco (fighter-*, ranger - clr*  and battle caster, f/m/t, f/m/c)
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=1 feat_name_indexed = 1
						STR_VAR clab=~\(\(CLABFI01\)\|\(CLABSO01\)\|\(CLABRN01\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
						feat_name=~THAC0M~ caption=~THACM~ END		
	//low thaco (cleric/mage and mage/thief)
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=1 feat_name_indexed = 1
						STR_VAR clab=~\(\(CLABTH01\)\|\(CLABPR01\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
						feat_name=~THAC0L~ caption=~THACL~ END	
                                             	
	COPY ~3ed/Core/APR~ ~override~
  
	//high apr
    LAF ADD_FEATS_LVL INT_VAR min_level=6 max_level=20 d_level=5 add_at_level1=0 feat_name_indexed = 1
                    STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/APR_H.SPL~
                    feat_name=~APRBON~ caption=~APRH~ END	
    //medium apr
    LAF ADD_FEATS_LVL INT_VAR min_level=8 max_level=20 d_level=7 add_at_level1=0 feat_name_indexed = 1
                STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/APR_M.SPL~
                feat_name=~APRBON~ caption=~APRM~ END
	//remove line from swashbuckler and replace it with high apr
	COPY_EXISTING ~CLABTH04.2DA~ ~override~
		COUNT_2DA_ROWS 20 "nrows"
		SET nrows=nrows - 1
		REMOVE_2DA_ROW nrows 20
    LAF ADD_FEATS_LVL INT_VAR min_level=6 max_level=20 d_level=5 add_at_level1=0 feat_name_indexed = 1
                    STR_VAR clab=~CLABTH04\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
                    feat_name=~APRBON~ caption=~SWAPRH~ END        
	//low apr
	LAF ADD_FEATS_LVL INT_VAR min_level=11 max_level=20 d_level=10 add_at_level1=0
					STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/APR_L.SPL~
						feat_name=~APRBON1~ caption=~APRL~ END                
                        
  
	

    
    
    
    OUTER_FOR (i=1;i<=30;i=i+1) BEGIN
        OUTER_SET save_val = (12 - i/2)
        ACTION_IF (save_val<2) BEGIN
                OUTER_SET save_val = 2
        END
        OUTER_SET prev_i = i - 1
        COPY_EXISTING ~THAC01.SPL~ ~override/SAVEDH%i%.SPL~ 
			LPF ALTER_SPELL_EFFECT INT_VAR parameter1=save_val new_opcode = 33  END //saving throw vs death value
            SPRINT resource EVALUATE_BUFFER ~SAVEDH%prev_i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=0 duration=1  STR_VAR resource END //remove effects 
         COPY_EXISTING ~THAC01.SPL~ ~override/SAVEWH%i%.SPL~ 
			LPF ALTER_SPELL_EFFECT INT_VAR parameter1=save_val new_opcode = 34  END //saving throw vs wand value
            SPRINT resource EVALUATE_BUFFER ~SAVEWH%prev_i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=0 duration=1  STR_VAR resource END //remove effects 
         COPY_EXISTING ~THAC01.SPL~ ~override/SAVEPH%i%.SPL~ 
            SPRINT resource EVALUATE_BUFFER ~SAVEPH%prev_i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=0 duration=1  STR_VAR resource END //remove effects 
			LPF ALTER_SPELL_EFFECT INT_VAR parameter1=save_val new_opcode = 35  END //saving throw vs polymorph value
         COPY_EXISTING ~THAC01.SPL~ ~override/SAVEBH%i%.SPL~ 
            SPRINT resource EVALUATE_BUFFER ~SAVEBH%prev_i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=0 duration=1  STR_VAR resource END //remove effects 
			LPF ALTER_SPELL_EFFECT INT_VAR parameter1=save_val new_opcode = 36  END //saving throw vs breath value
         COPY_EXISTING ~THAC01.SPL~ ~override/SAVESH%i%.SPL~ 
            SPRINT resource EVALUATE_BUFFER ~SAVESH%prev_i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=0 duration=1  STR_VAR resource END //remove effects 
			LPF ALTER_SPELL_EFFECT INT_VAR parameter1=save_val new_opcode = 37  END //saving throw vs spell value
            
	END

		
	//reflex saves to kensai,barbarian and rangers
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=1 feat_name_indexed = 1 
                        STR_VAR clab=~\(\(CLABRN.*\)\|\(CLABFI0[4-5]\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
						feat_name=~SAVEWH~ caption=~SAVWHA~ END
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=1 feat_name_indexed = 1 
                        STR_VAR clab=~\(\(CLABRN.*\)\|\(CLABFI0[4-5]\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
						feat_name=~SAVEBH~ caption=~SAVBHA~ END
	
	//spell saves for bard, hexblade dwarven defender and paladin
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=1 feat_name_indexed = 1 
                        STR_VAR clab=~\(\(CLABBA.*\)\|\(CLABPA.*\)\|\(CLABFI03\)\|\(CLABFI06\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
						feat_name=~SAVESH~ caption=~SAVSHA~ END	
	//fort saves for battle caster	and assasin
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=1 feat_name_indexed = 1 
                        STR_VAR clab=~\(\(CLABSO01\)\|\(CLABTH02\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
						feat_name=~SAVEDH~ caption=~SAVDH~ END	
                        
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=1 feat_name_indexed = 1 
                        STR_VAR clab=~\(\(CLABSO01\)\|\(CLABTH02\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~
						feat_name=~SAVEPH~ caption=~SAVPH~ END	