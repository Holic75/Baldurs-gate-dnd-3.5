	
	
    
    COPY ~3ed/Core/THAC0/THAC0H.SPL~ ~override~ //high thaco for swashbucklers
	//thaco regularization
	OUTER_FOR (i=0;i<=20;i=i+1) BEGIN
		COPY ~3ed/Core/THAC0/THAC0.SPL~ ~override/THAC0%i%.SPL~
			LPF ALTER_SPELL_EFFECT INT_VAR parameter1=i END
	END
	//medium thaco
	COPY ~3ed/Core/THAC0/THAC0M.SPL~ ~override/THAC0M.SPL~
		FOR (i=1;i<=30;i=i+1) BEGIN
			LPF ADD_SPELL_HEADER INT_VAR type=1 location=4 target=5 target_count=0 range=1 required_level=i speed=0 END
				SET r = 20 - (3*i/4)
                PATCH_IF (r<5) BEGIN
                    SET r=5
                END
				SPRINT resource EVALUATE_BUFFER ~THAC0%r%~
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=8 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/cleric
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=16 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/druid
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=7 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/mage
                LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=17 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/cleric/mage
                LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=10 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/mage/thief
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=9 parameter2=105 timing=0 duration=1 STR_VAR resource END // ftr/thief
                LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=18 parameter2=105 timing=0 duration=1 STR_VAR resource END // cleric/ranger
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=19 parameter2=105 timing=0 duration=1 STR_VAR resource END // sorceror for battle caster
		END
	//low thac0
	COPY ~3ed/Core/THAC0/THAC0M.SPL~ ~override/THAC0L.SPL~
		FOR (i=1;i<=30;i=i+1) BEGIN
			LPF ADD_SPELL_HEADER INT_VAR type=1 location=4 target=5 target_count=0 range=1 required_level=i speed=0 END
				SET r = 20 - (i/2)
                PATCH_IF (r<10) BEGIN
                    SET r=10
                END
				SPRINT resource EVALUATE_BUFFER ~THAC0%r%~
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=13 parameter2=105 timing=0 duration=1 STR_VAR resource END // mage/thief
				LPF ADD_SPELL_EFFECT INT_VAR header=i opcode=326 target=2 parameter1=14 parameter2=105 timing=0 duration=1 STR_VAR resource END // cleric/mage
		END
        

	//high thaco for swashbuckler
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=40 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABTH04\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~THAC0H~ END		
	//medium thaco (fighter-*, ranger - clr*  and battle caster, f/m/t, f/m/c)
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=40 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(\(CLABFI01\)\|\(CLABSO01\)\|\(CLABRN01\)\)\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~THAC0M~ END		
	//low thaco (cleric/mage and mage/thief)
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=40 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(\(CLABTH01\)\|\(CLABPR01\)\)\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~THAC0L~ END		
                        
                        
	
	COPY ~3ed/Core/APR~ ~override~
    COPY_EXISTING ~APR_H.SPL~ ~override~
    FOR (i=2;i<=3;i=i+1) BEGIN
        LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
        LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = 1 + 5*i END
        SPRINT resource EVALUATE_BUFFER ~APRBON%i%~	
        LPF ALTER_SPELL_EFFECT INT_VAR header = i STR_VAR resource END
    END
    
    COPY_EXISTING ~APR_M.SPL~ ~override~ //bonus attack at lvl 8(1) and 15
        LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
        LPF ALTER_SPELL_HEADER INT_VAR header = 2 min_level = 15 END
        SPRINT resource EVALUATE_BUFFER ~APRBON2~	
        LPF ALTER_SPELL_EFFECT INT_VAR header = 2 STR_VAR resource END
        
        
     
	//high apr
		LAF ADD_BONUS_FEATS INT_VAR min_level=6 max_level=20 d_level=5 add_at_level1=0 
						STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\)\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~APR_H~ END	
                        
    //create high apr clab_line
    
   
	//medium apr
		LAF ADD_BONUS_FEATS INT_VAR min_level=8 max_level=20 d_level=7 add_at_level1=0 
						STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\)\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~APR_M~ END	
                        
	//remove line from swashbuckler and replace it with high apr
	COPY_EXISTING ~CLABTH04.2DA~ ~override~
		COUNT_2DA_ROWS 20 "nrows"
		SET nrows=nrows - 1
		REMOVE_2DA_ROW nrows 20
        SET nrows = nrows - 1
        INSERT_2DA_ROW nrows 20 ~APR_SW  ****   ****   ****   ****   ****   AP_APRBON   ****   ****   ****   ****   AP_APRBON2   ****   ****   ****   ****   AP_APRBON3   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****~	
        		
	//low apr
		LAF ADD_BONUS_FEATS INT_VAR min_level=11 max_level=20 d_level=10 add_at_level1=0 
						STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\)\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~APR_L~ END	
	//remove line from battle sorceror and replace it with medium apr
		COPY_EXISTING ~CLABSO01.2DA~ ~override~
		COUNT_2DA_ROWS 20 "nrows"
		SET nrows=nrows - 1
		REMOVE_2DA_ROW nrows 20
        SET nrows = nrows - 1
        INSERT_2DA_ROW nrows 20 ~APR_BC  ****   ****   ****   ****   ****   ****   ****   AP_APRBON   ****   ****   ****   ****   ****   ****   AP_APRBON2   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****   ****~	
		
	
	//saving throws regularization
	COPY ~3ed/Core/THAC0/THAC0H.SPL~ ~override/SAVESDH.SPL~ //high thaco for swashbucklers
		FOR (i=1;i<=30;i=i+1) BEGIN
        
            SET save_val = (12 - i/2)
            PATCH_IF (save_val<6) BEGIN
                SET save_val = 2
            END
			LPF ALTER_SPELL_EFFECT INT_VAR header=i parameter1=save_val new_opcode = 33  END //saving throw vs death value
		END
	COPY_EXISTING ~SAVESDH.SPL~  ~override/SAVESWH.SPL~ LPF ALTER_SPELL_EFFECT INT_VAR new_opcode = 34  END //saving throw vs wand
	COPY_EXISTING ~SAVESDH.SPL~  ~override/SAVESPH.SPL~ LPF ALTER_SPELL_EFFECT INT_VAR new_opcode = 35  END //saving throw vs polymorph
	COPY_EXISTING ~SAVESDH.SPL~  ~override/SAVESBH.SPL~ LPF ALTER_SPELL_EFFECT INT_VAR new_opcode = 36  END //saving throw vs  breath
	COPY_EXISTING ~SAVESDH.SPL~  ~override/SAVESSH.SPL~ LPF ALTER_SPELL_EFFECT INT_VAR new_opcode = 37  END //saving throw vs spell
		
	//reflex saves to barbarian and rangers
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=40 d_level=1 add_at_level1=1 STR_VAR clab=~\(\(CLABRN.*\)\|\(CLABFI05\)\)\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~SAVESWH~ END
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=40 d_level=1 add_at_level1=1 STR_VAR clab=~\(\(CLABRN.*\)\|\(CLABFI05\)\)\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~SAVESBH~ END
	
	//spell saves for bard, hexblade dwarven defender and paladin
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=40 d_level=1 add_at_level1=1 STR_VAR clab=~\(\(CLABBA.*\)\|\(CLABPA.*\)\|\(CLABFI03\)\|\(CLABFI06\)\)\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~SAVESSH~ END	
	//fort saves for battle caster	
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=40 d_level=1 add_at_level1=1 STR_VAR clab=~CLABSO01\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~SAVESDH~ END	
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=40 d_level=1 add_at_level1=1 STR_VAR clab=~CLABSO01\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~SAVESPH~ END	