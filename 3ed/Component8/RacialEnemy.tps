    //Copy Icons
	COPY ~3ed\Classes\FavoredEnemy\FE_B.BAM~ ~override~
	COPY ~3ed\Classes\FavoredEnemy\FE_C.BAM~ ~override~

    COPY ~3ed/Classes/FavoredEnemy/fecre.d~  ~override/fecre.d~  	
    COPY ~3ed/Classes/FavoredEnemy/FE_DCRE.BAF~  ~override~     
    
    COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~  ~override/FE_APP.SPL~
    COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~  ~override/FEI_APP.SPL~
    COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~  ~override/FEM_APP.SPL~
    COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~  ~override/FE_PR.SPL~
    COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~  ~override/FEI_PR.SPL~
    COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~  ~override/FEM_PR.SPL~
    
    COPY_EXISTING ~SMTEVL.SPL~ ~override/FE_SMT.SPL~
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 248 END	
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 326 parameter2 = 130 END //change charisma to wisdom
		SAY NAME1 @012
		SAY UNIDENTIFIED_DESC @013
     
    ACTION_CLEAR_ARRAY FavoredEnemies   
    //read racial enemies and their descriptions from racetext.2da (playable races)
    COPY_EXISTING ~racetext.2DA~   ~override~
        COUNT_2DA_ROWS 6 n_rows		
		FOR (i=0;i<n_rows;i=i+1) BEGIN       
			READ_2DA_ENTRY %i% 4 6 name_strref
            READ_2DA_ENTRY %i% 1 6 ids
            READ_2DA_ENTRY %i% 3 6 descr_strref
		
            PATCH_IF (ids<=7) BEGIN
                DEFINE_ASSOCIATIVE_ARRAY FavoredEnemies BEGIN           
                    ~%name_strref%~, ~%descr_strref%~ => ~%ids%~
                END
            END
		END	   
    
    //read racial enemies and their descriptions from haterace.2da (non-playable races)
    COPY_EXISTING ~HATERACE.2DA~   ~override~
        COUNT_2DA_ROWS 4 n_rows		
		FOR (i=0;i<n_rows;i=i+1) BEGIN
			READ_2DA_ENTRY %i% 1 4 name_strref
            READ_2DA_ENTRY %i% 2 4 ids
            READ_2DA_ENTRY %i% 3 4 descr_strref
		
            DEFINE_ASSOCIATIVE_ARRAY FavoredEnemies BEGIN           
                ~%name_strref%~, ~%descr_strref%~ => ~%ids%~
            END
		END			        
    	
	COPY  ~3ed/Classes/FavoredEnemy/FE_MRK.SPL~ ~override/FE_MRK.SPL~
	COPY  ~3ed/Classes/FavoredEnemy/FE_MRK.SPL~ ~override/FE_RMV.SPL~
    
    OUTER_SET   yes_response=RESOLVE_STR_REF (@5)
	OUTER_SET   no_response=RESOLVE_STR_REF (@6)
   
    OUTER_SET i=0
        
	ACTION_PHP_EACH FavoredEnemies AS FavoredEnemyStrRef => ID BEGIN
	
        ACTION_GET_STRREF FavoredEnemyStrRef_0  FavoredEnemyName 
        ACTION_GET_STRREF FavoredEnemyStrRef_1  FavoredEnemyDescr
                        
        OUTER_SPRINT i_str EVALUATE_BUFFER ~%i%~
        
        ACTION_IF (i<10) BEGIN
             OUTER_SPRINT i_str EVALUATE_BUFFER ~0%i%~
        END

        COPY ~3ed/Classes/FavoredEnemy/FE_AC.EFF~ ~override/FE_A%i_str%.eff~ // AC bonus
            WRITE_SHORT 0x001c ID  // change ID to next favored enemy
                
        OUTER_FOR (k=2;k<=14;k=k+1) BEGIN
            COPY ~3ed/Classes/FavoredEnemy/FE_TEMP.EFF~ ~override/FED%i_str%%k%.eff~ // damage bonus
                WRITE_SHORT 0x001c ID  // change ID to next favored enemy
                WRITE_LONG 0x0060 k
		 
            COPY ~3ed/Classes/FavoredEnemy\FE_TH.EFF~ ~override/FET%i_str%%k%.eff~ // thac0 bonus
                WRITE_SHORT 0x001c ID  // change ID to next favored enemy
                WRITE_LONG 0x0060 k 
        END
       
        //Racial Enemy
        COPY  ~3ed/Classes/FavoredEnemy/FE_TEMP.SPL~ ~override/FE_%i%.spl~
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END        
            FOR (k=2;k<=8;k=k+1) BEGIN
                SET header = k - 1
                PATCH_IF (header>1) BEGIN
                   LPF ALTER_SPELL_HEADER INT_VAR header min_level = (header - 1)*5 END
                END
                LPF DELETE_EFFECT INT_VAR header check_headers = 1 END

                SPRINT resource EVALUATE_BUFFER ~FE_%i%~
                LPF ADD_SPELL_EFFECT INT_VAR header target=2 duration=1 opcode = 321  insert_point = 0 STR_VAR resource END //remove spell effects
                SPRINT resource EVALUATE_BUFFER ~FE_MK%i%~
                LPF ADD_SPELL_EFFECT INT_VAR header target = 2 duration = 1 opcode  = 206  timing = 9 STR_VAR resource END //protection from marking                
                
                SPRINT resource EVALUATE_BUFFER ~FED%i_str%%k%~
                LPF ADD_SPELL_EFFECT INT_VAR header  opcode = 177  target=2 duration=1 timing=9 parameter1=0 parameter2=2 STR_VAR resource END  //apply damage bonus to racial enemy effects
                SPRINT resource EVALUATE_BUFFER ~FET%i_str%%k%~
                LPF ADD_SPELL_EFFECT INT_VAR header opcode = 177 target=2 duration=1 timing=9 parameter1=0 parameter2=2 STR_VAR resource END  //apply thac0 bonus bonus to racial enemy effect
                SPRINT resource EVALUATE_BUFFER ~FE_PR%i%~
                LPF ADD_SPELL_EFFECT INT_VAR header target=2 duration=1 opcode = 321  STR_VAR resource END //remove protection from marking                
            END    

                
        //Minor Racial Enemy
        COPY  ~3ed/Classes/FavoredEnemy/FE_TEMP.SPL~ ~override/FEM_%i%.spl~	
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END      
            FOR (k=2;k<=5;k=k+1) BEGIN
                SET header = k - 1
                PATCH_IF (header>1) BEGIN
                   LPF ALTER_SPELL_HEADER INT_VAR header min_level = (header - 1)*10 END               
                END
                LPF DELETE_EFFECT INT_VAR header check_headers = 1 END

                SPRINT resource EVALUATE_BUFFER ~FEM_%i%~
                LPF ADD_SPELL_EFFECT INT_VAR header target=2 duration=1 opcode = 321  insert_point = 0 STR_VAR resource END //remove spell effects
                SPRINT resource EVALUATE_BUFFER ~FE_MK%i%~
                LPF ADD_SPELL_EFFECT INT_VAR header target = 2 duration = 1 timing = 9 opcode  = 206  STR_VAR resource END //protection from marking                
                
                SPRINT resource EVALUATE_BUFFER ~FED%i_str%%k%~
                LPF ADD_SPELL_EFFECT INT_VAR header  opcode = 177 target=2 duration=1 timing=9 parameter1=0 parameter2=2  STR_VAR resource END  //apply damage bonus to racial enemy effects
                SPRINT resource EVALUATE_BUFFER ~FET%i_str%%k%~
                LPF ADD_SPELL_EFFECT INT_VAR header opcode = 177 target=2 duration=1 timing=9 parameter1=0 parameter2=2 STR_VAR resource END  //apply thac0 bonus bonus to racial enemy effect
                SPRINT resource EVALUATE_BUFFER ~FEM_PR%i%~
                LPF ADD_SPELL_EFFECT INT_VAR header target=2 duration=1 opcode = 321  STR_VAR resource END //remove protection from marking                
            END  

         
        
        //Improved Racial Enemy for Stalkers
        COPY  ~3ed/Classes/FavoredEnemy/FE_TEMP.SPL~  ~override/FEI_%i%.spl~
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            FOR (k=1;k<=7;k=k+1) BEGIN
                SET header = k
                SET k2 = 2*k
                SET k1 = k + 1
                PATCH_IF (header>1) BEGIN
                   LPF ALTER_SPELL_HEADER INT_VAR header min_level = (header - 1)*5 END
                END               

                SPRINT resource EVALUATE_BUFFER ~FEI_%i%~
                LPF ADD_SPELL_EFFECT INT_VAR header target=2 duration=1 opcode = 321  insert_point = 0 STR_VAR resource END //remove spell effects
                SPRINT resource EVALUATE_BUFFER ~FE_A%i_str%~
                LPF ADD_SPELL_EFFECT INT_VAR header opcode = 177 target=2 duration=1 timing=9 parameter1=0 parameter2=2 STR_VAR resource END  //apply ac/saving throws bonus bonus to racial enemy effects                                   
                SPRINT resource EVALUATE_BUFFER ~FE_MK%i%~
                LPF ADD_SPELL_EFFECT INT_VAR header target = 2 duration = 1 timing = 9 opcode  = 206  STR_VAR resource END //protection from marking                
                
                SPRINT resource EVALUATE_BUFFER ~FED%i_str%%k2%~
                LPF ADD_SPELL_EFFECT INT_VAR header  opcode = 177  target=2 duration=1 timing=9 parameter1=0 parameter2=2 STR_VAR resource END  //apply damage bonus to racial enemy effects
                SPRINT resource EVALUATE_BUFFER ~FET%i_str%%k2%~
                LPF ADD_SPELL_EFFECT INT_VAR header opcode = 177 target=2 duration=1 timing=9 parameter1=0 parameter2=2 STR_VAR resource END  //apply thac0 bonus bonus to racial enemy effect
                SPRINT resource EVALUATE_BUFFER ~FEI_PR%i%~
                LPF ADD_SPELL_EFFECT INT_VAR header target=2 duration=1 timing=9 opcode = 321  STR_VAR resource END //remove protection from marking 
            END    
             
        
        
        //favored smite for stalkers
		COPY_EXISTING ~SMTEVLH.SPL~ ~override/FE_S%i%H.SPL~//hit effect (spell)
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=326 parameter2 = 104 parameter1=ID END         
        
		COPY_EXISTING ~SMTEVLH.EFF~ ~override/FE_S%i%H.EFF~//hit effect
			WRITE_EVALUATED_ASCII 0x0030 ~FE_S%i%H~ #8
            
        COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~ ~override/FE_SA%i%.SPL~
            SPRINT resource EVALUATE_BUFFER ~FE_S%i%H~
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 duration = 1 duration = 10 opcode  = 248  STR_VAR resource END
            
        COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~ ~override/FESMT%i%.SPL~
            SPRINT resource EVALUATE_BUFFER ~FE_S%i%H~
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 duration = 10 opcode  = 248  STR_VAR resource END         
		
        COPY_EXISTING ~FE_SMT.SPL~ ~override~
            SPRINT resource EVALUATE_BUFFER ~FESMT%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 duration = 1 opcode  = 146 parameter2 = 1  STR_VAR resource END        

        
        //apply all favored enemies (it will be filtered by protection spells)
        COPY_EXISTING ~FE_APP.SPL~ ~override~
            SPRINT resource EVALUATE_BUFFER ~FE_%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1 opcode  = 146 parameter2 = 1 STR_VAR resource END
        COPY_EXISTING ~FEI_APP.SPL~ ~override~
            SPRINT resource EVALUATE_BUFFER ~FEI_%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1 opcode  = 146 parameter2 = 1 STR_VAR resource END
        COPY_EXISTING ~FEM_APP.SPL~ ~override~
            SPRINT resource EVALUATE_BUFFER ~FEM_%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1 opcode  = 146 parameter2 = 1 STR_VAR resource END            
            
            
        COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~ ~override/FE_PR%i%.SPL~
            SPRINT resource EVALUATE_BUFFER ~FE_%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1 timing = 9 opcode  = 206  STR_VAR resource END
            
        COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~ ~override/FEM_PR%i%.SPL~
            SPRINT resource EVALUATE_BUFFER ~FEM_%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1 timing = 9 opcode  = 206  STR_VAR resource END

        COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~ ~override/FEI_PR%i%.SPL~
            SPRINT resource EVALUATE_BUFFER ~FEI_%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1 timing = 9 opcode  = 206  STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~FESMT%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1 timing = 9 opcode  = 206  STR_VAR resource END

       COPY ~3ed/Classes/FavoredEnemy/FE_APPLY.SPL~ ~override/FE_RM%i%.SPL~
            SPRINT resource EVALUATE_BUFFER ~FE_PR%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1  opcode  = 321 STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~FEI_PR%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1  opcode  = 321 STR_VAR resource END 
            SPRINT resource EVALUATE_BUFFER ~FEM_PR%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1  opcode  = 321 STR_VAR resource END
            
            
        COPY_EXISTING ~FE_PR.SPL~ ~override~
            SPRINT resource EVALUATE_BUFFER ~FE_PR%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1 opcode = 326 STR_VAR resource END
            
        COPY_EXISTING ~FEI_PR.SPL~ ~override~
            SPRINT resource EVALUATE_BUFFER ~FEI_PR%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1 opcode = 326 STR_VAR resource END
            
        COPY_EXISTING ~FEM_PR.SPL~ ~override~
            SPRINT resource EVALUATE_BUFFER ~FEM_PR%i%~
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 duration = 1 opcode = 326 STR_VAR resource END
            
		COPY  ~3ed/Classes/FavoredEnemy/FE_MK.SPL~   ~override/FE_MK%i%.SPL~ 
            SPRINT resource EVALUATE_BUFFER ~FE_MK%i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 265  target=2 parameter1=1 duration=1000 STR_VAR resource END //marking            
            
		COPY_EXISTING  ~FE_MRK.SPL~   ~override~ 
            SPRINT resource EVALUATE_BUFFER ~FE_MK%i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 326  target=2 duration=1000 STR_VAR resource END //apply marking
		 
		COPY_EXISTING  ~FE_RMV.SPL~   ~override~ 
            SPRINT resource EVALUATE_BUFFER ~FE_MK%i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 265  target=2 parameter1=0 duration=1000 STR_VAR resource END //remove marking
                  
    
    //favored enemy detection
        
        OUTER_SPRINT detect_str EVALUATE_BUFFER
~IF
	!Global("FE_MK%i%","GLOBAL",1)
THEN
	RESPONSE #100
        DisplayStringNoName(Myself,%FavoredEnemyStrRef_0%)
		Continue()
END

|detect_str|~
        
        COPY_EXISTING ~FE_DCRE.BAF~ ~override~
			EVALUATE_BUFFER	
            REPLACE_TEXTUALLY ~|~ ~%~            
        
        //favored enemy creature
		 
		OUTER_SPRINT condition_str EVALUATE_BUFFER  
			
~~~~~IF ~Global("FE_MK%i%","GLOBAL",1)~  THEN REPLY ~%FavoredEnemyName%~ GOTO 1%ID%
|condition_str|~~~~~


        OUTER_SPRINT give_str EVALUATE_BUFFER
~~~~~IF ~True()~ THEN BEGIN 1%ID%
     SAY ~%FavoredEnemyDescr%~
        IF ~True()~ REPLY #%yes_response% DO ~ApplySpellRES("FE_RM%i%",LastSummonerOf(Myself))~  EXIT
        IF ~True()~ REPLY #%no_response% GOTO 1
END
        
|give_str|~~~~~ 		 
		 
		COPY_EXISTING ~fecre.d~  ~override~ 									
			EVALUATE_BUFFER	
            REPLACE_TEXTUALLY ~|~ ~%~	 
		 		 	     	 								 		 
		i=i+1
	END		 
	
    OUTER_SPRINT fe_string @101
    OUTER_SPRINT fei_string @102
    OUTER_SPRINT fem_string @103
    
    
	COPY_EXISTING ~fecre.d~  ~override~  	
        REPLACE_TEXTUALLY ~%c~	~|c~
        REPLACE_TEXTUALLY ~r%~	~r|~
        REPLACE_TEXTUALLY ~%g~	~|g~
        REPLACE_TEXTUALLY ~|condition_str|~ ~~
        REPLACE_TEXTUALLY ~|give_str|~ ~~
        
        
    COPY_EXISTING ~fecre.d~  ~override/feicre.d~    
        REPLACE_TEXTUALLY ~XXXX~	~%fei_string%~ 
        REPLACE_TEXTUALLY ~fecre~	~%feicre%~    
        COMPILE ~override/feicre.d~  
        
    COPY_EXISTING ~fecre.d~  ~override/femcre.d~    
        REPLACE_TEXTUALLY ~XXXX~	~%fem_string%~  
        REPLACE_TEXTUALLY ~fecre~	~%femcre%~    
        COMPILE ~override/femcre.d~  
        
    COPY_EXISTING ~fecre.d~  ~override/fecre.d~    
        REPLACE_TEXTUALLY ~XXXX~	~%fe_string%~   
        COMPILE ~override/fecre.d~          
	
	COPY ~3ed/Classes/FavoredEnemy/FECRE.BAF~ ~override~
        COMPILE ~override/FECRE.BAF~
        
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/FECRE.CRE~
        WRITE_ASCII 0x248 ~FECRE~ #8//override script
        WRITE_ASCII 0x02cc ~fecre~ #8//dialog
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/FECRE.EFF~
        WRITE_ASCII 0x0030 ~FECRE~ #8//creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/FECRE.SPL~	
        LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~FECRE~ END
	
		
	COPY ~3ed/Classes/FavoredEnemy/FEICRE.BAF~ ~override/FEICRE.BAF~
        COMPILE ~override/FEICRE.BAF~
        
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/FEICRE.CRE~
        WRITE_ASCII 0x248 ~FEICRE~ #8//override script
        WRITE_ASCII 0x02cc ~feicre~ #8//dialog
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/FEICRE.EFF~
        WRITE_ASCII 0x0030 ~FEICRE~ #8//creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/FEICRE.SPL~	
        LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~FEICRE~ END
        
	COPY ~3ed/Classes/FavoredEnemy/FEMCRE.BAF~ ~override/FEMCRE.BAF~
        COMPILE ~override/FEMCRE.BAF~
        
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/FEMCRE.CRE~
        WRITE_ASCII 0x248 ~FEMCRE~ #8//override script
        WRITE_ASCII 0x02cc ~femcre~ #8//dialog
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/FEMCRE.EFF~
        WRITE_ASCII 0x0030 ~FEMCRE~ #8//creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/FEMCRE.SPL~	
        LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~FEMCRE~ END        


    //detection
	COPY_EXISTING ~FE_DCRE.BAF~ ~override/FE_DCRE.BAF~
        REPLACE_TEXTUALLY ~%~	~|~
        REPLACE_TEXTUALLY ~|detect_str|~ ~~
        COMPILE ~override/FE_DCRE.BAF~
        
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/FE_DCRE.CRE~
        WRITE_ASCII 0x248 ~FE_DCRE~ #8//override script
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/FE_DCRE.EFF~
        WRITE_ASCII 0x0030 ~FE_DCRE~ #8//creature name
	COPY ~3ed/Classes/FavoredEnemy/FE_DCRE.SPL~ ~override~	
        LPF  ALTER_SPELL_EFFECT INT_VAR check_globals = 1 STR_VAR resource=~FE_DCRE~ END
        LPF  ADD_SPELL_EFFECT INT_VAR opcode =326 duration = 1000 target = 1 STR_VAR resource =~FE_MRK~ insert_point = 0 END 
        SAY 0x0008 @7
        SAY 0x0050 @8
        
    COPY ~3ed/Classes/FavoredEnemy/FE_GIVE.SPL~ ~override/FE_DCREG.SPL~
        LPF ALTER_SPELL_EFFECT  STR_VAR resource=~FE_DCRE~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=2 duration=1 timing=9 STR_VAR resource = ~FE_DCREG~ END
        
    COPY_EXISTING ~FEM_PR.SPL~ ~override/FEM_PR.SPL~
        LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=2 duration=1 timing=9 STR_VAR resource = ~FEM_PR~ END
    COPY_EXISTING ~FEI_PR.SPL~ ~override/FEI_PR.SPL~
        LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=2 duration=1 timing=9 STR_VAR resource = ~FEI_PR~ END 
    COPY_EXISTING ~FE_PR.SPL~ ~override/FE_PR.SPL~
        LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=2 duration=1 timing=9 STR_VAR resource = ~FE_PR~ END
        
        
    LAF CREATE_SPL_COPIES_WITH_PROTECTION INT_VAR index_start = 1 index_end = 8 STR_VAR input_name = ~FECRE~ output_name = ~FECRE~ END
    LAF CREATE_SPL_COPIES_WITH_PROTECTION INT_VAR index_start = 1 index_end = 8 STR_VAR input_name = ~FEICRE~ output_name = ~FEICRE~ END
    LAF CREATE_SPL_COPIES_WITH_PROTECTION INT_VAR index_start = 1 index_end = 8 STR_VAR input_name = ~FEMCRE~ output_name = ~FEMCRE~ END
        
        
	COPY ~3ed\Classes\FavoredEnemy\HATERACE.2DA~ ~override~ // description for ranger favored enemies at character generation - we leave just one entry
	SET name_ref=RESOLVE_STR_REF (@9)
	SET descr_ref=RESOLVE_STR_REF (@10)
	
	SET_2DA_ENTRY 0 1 4 ~%name_ref%~
	SET_2DA_ENTRY 0 3 4 ~%descr_ref%~
	
    OUTER_SPRINT TpdFolder ~3ed\@Descriptions\%GameId%~	
	LAF UPDATE_TLK_ENTRIES STR_VAR TpdFolder Tpd = ~SetRacialEnemyDescriptions.tpd~ TraFile = ~racial_enemy.tra~ END 
	

//racial enemies to rangers (except stlaker)
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=30 d_level=5 add_at_level1=1 delay = 4 indexed = 1
						STR_VAR clab=~\(\(CLABRN01\)\|\(CLABRN02\)\|\(CLABRN04\)\)\.2DA~ 
                        mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~ feat_type_file=~FECRE~ caption=~FE_RN~ END

    
    LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(\(CLABRN01\)\|\(CLABRN02\)\|\(CLABRN04\)\|\(CLABRN03\)\)\.2DA~ caption=~FE_DCREG~ END    
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(\(CLABRN01\)\|\(CLABRN02\)\|\(CLABRN04\)\)\.2DA~ 
                        mask_file=~3ed/Feats/FeatAttribution/SFTCRER.SPL~ feat_type_file=~FE_PR~
                        caption=~FE_PRRN~ END  
        
//improved racial enemies for stalkers
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=30 d_level=5 add_at_level1=1 indexed = 1
						STR_VAR clab=~CLABRN03\.2DA~ caption=~FEICRE~ END
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABRN03\.2DA~ caption=~FEI_PR~ END                         
                           
//racial enemies to fighter druids and cleric rangers
	LAF ADD_BONUS_FEATS INT_VAR min_level=10 max_level=30 d_level=10 add_at_level1=1 delay = 4  indexed = 1
						STR_VAR clab=~CLABDR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_type_file=~FEMCRE~ caption=~FE_FD~ END

	LAF ADD_BONUS_FEATS INT_VAR min_level=10 max_level=30 d_level=10 add_at_level1=1 delay = 4 indexed = 1
						STR_VAR clab=~CLABRN01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRERC.SPL~ feat_type_file=~FEMCRE~ caption=~FE_RC~ END                        
                               
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABDR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_type_file=~FE_DCREG~ caption=~FE_DTFD~ END
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABDR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_type_file=~FEM_PR~ caption=~FE_PRFD~ END
                        
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABRN01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRERC.SPL~ feat_type_file=~FEM_PR~ caption=~FE_PRRC~ END                        
                        