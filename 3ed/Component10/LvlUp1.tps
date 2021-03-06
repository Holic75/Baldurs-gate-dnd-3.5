	OUTER_SET reset_xp_mode=3
	
	COPY ~3ed/lvlUp1/SETXP0.SPL~ ~override~    
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 timing = 0 target = 2 duration = 1 insert_point =0 STR_VAR resource = ~MLTXP1~ END
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 timing = 1 target = 2 insert_point =0 STR_VAR resource = ~MLTXP1~ END
             LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 timing = 0 target = 2 duration = 1 insert_point =0 STR_VAR resource = ~MLTXP31~ END
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 timing = 1 target = 2 insert_point =0 STR_VAR resource = ~MLTXP31~ END
            
	COPY ~3ed/lvlUp1/RESETXP.SPL~ ~override/RSTXP0.SPL~
		SPRINT resource EVALUATE_BUFFER ~SETXP0~
		LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=0 duration=1 STR_VAR resource END
		
	//get informartion about xp	
	COPY_EXISTING ~XPLEVEL.2DA~ ~override~
	COUNT_2DA_COLS n_cols
	FOR (i=2;i<n_cols;i=i+1) BEGIN
		READ_2DA_ENTRY 1 %i% %n_cols% 	xp_needed //xp for single class
		SET lvl=i - 1		
        SET lvl_max = lvl
		DEFINE_ASSOCIATIVE_ARRAY XP_TABLE1 BEGIN "%lvl%" => "%xp_needed%" END	
	END
	
    
    COPY ~3ed\lvlUp1\LvlUp0.BAF~  ~override/LvlUp1.BAF~ 
    
    ACTION_PHP_EACH XP_TABLE1 AS lvl => xp1 BEGIN
            
        OUTER_SET xp2=2*xp1
        OUTER_SET xp3=3*xp1
        
        COPY_EXISTING ~LvlUp1.BAF~ ~override~
            APPEND_FILE ~3ed\lvlUp1\LvlUp.BAF~
            EVALUATE_BUFFER	
               
	//adding new setxp spell
		COPY_EXISTING ~SETXP0.SPL~ ~override/SETXP1%lvl%.SPL~
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=104 parameter1=xp1 END
            SPRINT resource EVALUATE_BUFFER ~SETXP1%lvl%~

             
 		COPY_EXISTING ~SETXP0.SPL~ ~override/SETXP2%lvl%.SPL~
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=104 parameter1=xp2 END

 		COPY_EXISTING ~SETXP0.SPL~ ~override/SETXP3%lvl%.SPL~
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=104 parameter1=xp3 END            
            
	//adding it to reset		
		COPY_EXISTING ~3ed/lvlUp1/RESETXP.SPL~ ~override/RSTXP%lvl%.SPL~ 
            SPRINT resource EVALUATE_BUFFER ~SETXP1%lvl%~
			LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=reset_xp_mode duration=reset_xp_mode STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~SETXP2%lvl%~
			LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=reset_xp_mode duration=reset_xp_mode STR_VAR resource END		
            SPRINT resource EVALUATE_BUFFER ~SETXP3%lvl%~
			LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 timing=reset_xp_mode duration=reset_xp_mode STR_VAR resource END		        
    END
    	
	//adding lvl1 xp limiter remover to clabs
	OUTER_SPRINT clab_line ~LVLUPABIL~
	
	OUTER_FOR (i=0;i<=lvl_max;i=i+1) BEGIN
		OUTER_SPRINT clab_line EVALUATE_BUFFER ~%clab_line%  AP_RSTXP%i%~
	END
	
	COPY_EXISTING_REGEXP GLOB ~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ ~override~
		COUNT_2DA_ROWS 20 "nrows"
		INSERT_2DA_ROW nrows 20 ~%clab_line%~
	 

	//appending to bcs
	OUTER_FOR (i=1;i<=6;i=i+1) BEGIN
		EXTEND_TOP_REGEXP ~\(BD\)*BALDUR.*\.BCS~ ~override/LvlUp1.BAF~
			SPRINT object EVALUATE_BUFFER ~Player%i%~
			SET party_size= i - 1
			EVALUATE_BUFFER
	END
    