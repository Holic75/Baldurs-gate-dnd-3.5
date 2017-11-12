    //Copy Icons
	COPY ~3ed\Classes\FavoredEnemy\FE_B.BAM~ ~override~
	COPY ~3ed\Classes\FavoredEnemy\FE_C.BAM~ ~override~

    COPY ~3ed/Classes/FavoredEnemy/fecre.d~  ~override/fecre.d~  	
    COPY ~3ed/Classes/FavoredEnemy/feicre.d~  ~override/feicre.d~  
    COPY ~3ed/Classes/FavoredEnemy/FE_DCRE.BAF~  ~override~     
    
    
    
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
    
    OUTER_SPRINT FavoredEnemyString  @001
    OUTER_SPRINT FavoredEnemyStringDescr  @002
    OUTER_SPRINT ImprovedFavoredEnemyString  @003
    OUTER_SPRINT ImprovedFavoredEnemyStringDescr  @004
    
	ACTION_PHP_EACH FavoredEnemies AS FavoredEnemyStrRef => ID BEGIN
	
        ACTION_GET_STRREF FavoredEnemyStrRef_0  FavoredEnemyName 
        ACTION_GET_STRREF FavoredEnemyStrRef_1  FavoredEnemyDescr
                  
        OUTER_SPRINT FullName EVALUATE_BUFFER ~%FavoredEnemyString%: %FavoredEnemyName%~
        OUTER_SPRINT FullDescr EVALUATE_BUFFER ~%FullName%
         
%FavoredEnemyStringDescr% %FavoredEnemyName%.~       
         
		COPY ~3ed/Classes/FavoredEnemy/FE_TEMP.EFF~ ~override/FE_DM%i%.eff~ // damage bonus
            WRITE_SHORT 0x001c ID  // change ID to next favored enemy
		 
		COPY ~3ed/Classes/FavoredEnemy/FE_AC.EFF~ ~override/FE_AC%i%.eff~ // AC bonus
            WRITE_SHORT 0x001c ID  // change ID to next favored enemy
		 
		COPY ~3ed/Classes/FavoredEnemy\FE_TH.EFF~ ~override/FE_TH%i%.eff~ // thac0 bonus
            WRITE_SHORT 0x001c ID  // change ID to next favored enemy
		 //Racial Enemy
		COPY  ~3ed/Classes/FavoredEnemy/FE_TEMP.SPL~ ~override/FE_%i%.spl~		 
            SAY_EVALUATED 0x0008 ~%FullName%~
            SAY_EVALUATED 0x0050 ~%FullDescr%~

            SPRINT resource EVALUATE_BUFFER ~FE_DM%i%~
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 272  STR_VAR resource END  //apply damage bonus to racial enemy effects
            SPRINT resource EVALUATE_BUFFER ~FE_MK%i%~
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 206  STR_VAR resource END //protection from marking
		 
		
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
        
        //racial enemy
		 
		OUTER_SPRINT condition_str EVALUATE_BUFFER  
			
~~~~~IF ~Global("FE_MK%i%","GLOBAL",1)~  THEN REPLY ~%FullName%~ GOTO 1%ID%
|condition_str|~~~~~


        OUTER_SPRINT give_str EVALUATE_BUFFER
~~~~~IF ~True()~ THEN BEGIN 1%ID%
     SAY ~%FavoredEnemyDescr%~
        IF ~True()~ REPLY #%yes_response% DO ~ApplySpellRES("FE_%i%",LastSummonerOf(Myself))~  EXIT
        IF ~True()~ REPLY #%no_response% GOTO 1
END
        
|give_str|~~~~~ 		 

		 
		COPY_EXISTING ~fecre.d~  ~override~ 									
			EVALUATE_BUFFER	
            REPLACE_TEXTUALLY ~|~ ~%~	 
		 
		 
		OUTER_SPRINT FullName EVALUATE_BUFFER ~%ImprovedFavoredEnemyString%: %FavoredEnemyName%~
        OUTER_SPRINT FullDescr EVALUATE_BUFFER ~%FullName%	

%ImprovedFavoredEnemyStringDescr% %FavoredEnemyName%.~          
        
		//Improved Racial Enemy for Stalkers
		COPY  ~3ed\Classes\FavoredEnemy\FE_TEMP.SPL~ ~override/FEI_%i%.spl~		 
            SAY_EVALUATED 0x0008 ~%FullName%~
            SAY_EVALUATED 0x0050 ~%FullDescr%~

            SPRINT resource EVALUATE_BUFFER ~FE_DM%i%~
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 272 header=1 STR_VAR resource END  //apply damage bonus bonus to racial enemy effects
            SPRINT resource EVALUATE_BUFFER ~FE_AC%i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 272 target=2 duration=1 timing=9 parameter1=5 parameter2=3 insert_point=0 STR_VAR resource END  //apply ac/saving throws bonus bonus to racial enemy effects
            SPRINT resource EVALUATE_BUFFER ~FE_TH%i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 272 target=2 duration=1 timing=9 parameter1=5 parameter2=3 insert_point=0 STR_VAR resource END  //apply thac0 bonus bonus to racial enemy effects
		 
            SPRINT resource EVALUATE_BUFFER ~FE_MK%i%~
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 206  STR_VAR resource END //protection from marking
		 
				 
		OUTER_SPRINT condition_str EVALUATE_BUFFER  
			
~~~~~IF ~Global("FE_MK%i%","GLOBAL",1)~  THEN REPLY ~%FullName%~ GOTO 1%ID%
|condition_str|~~~~~

        OUTER_SPRINT give_str EVALUATE_BUFFER
~~~~~IF ~True()~ THEN BEGIN 1%ID%
     SAY ~%FavoredEnemyDescr%~
        IF ~True()~ REPLY #%yes_response% DO ~ApplySpellRES("FEI_%i%",LastSummonerOf(Myself))~  EXIT
        IF ~True()~ REPLY #%no_response% GOTO 1
END
        
|give_str|~~~~~ 		 	 

		 
		COPY_EXISTING ~feicre.d~  ~override~  									
			EVALUATE_BUFFER	
            REPLACE_TEXTUALLY ~|~ ~%~	
		 	     	 								 		 
		i=i+1
	END		 
	

	COPY_EXISTING ~fecre.d~  ~override~  	
        REPLACE_TEXTUALLY ~%c~	~|c~
        REPLACE_TEXTUALLY ~r%~	~r|~
        REPLACE_TEXTUALLY ~%g~	~|g~
        REPLACE_TEXTUALLY ~|condition_str|~ ~~
        REPLACE_TEXTUALLY ~|give_str|~ ~~
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
	
	
	COPY_EXISTING ~feicre.d~  ~override~  	
        REPLACE_TEXTUALLY ~%c~	~|c~
        REPLACE_TEXTUALLY ~r%~	~r|~
        REPLACE_TEXTUALLY ~%g~	~|g~
        REPLACE_TEXTUALLY ~|condition_str|~ ~~
        REPLACE_TEXTUALLY ~|give_str|~ ~~
        COMPILE ~override/feicre.d~  
	
	COPY ~3ed/Classes/FavoredEnemy/FECRE.BAF~ ~override/FEICRE.BAF~
        COMPILE ~override/FEICRE.BAF~
        
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/FEICRE.CRE~
        WRITE_ASCII 0x248 ~FEICRE~ #8//override script
        WRITE_ASCII 0x02cc ~feicre~ #8//dialog
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/FEICRE.EFF~
        WRITE_ASCII 0x0030 ~FEICRE~ #8//creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/FEICRE.SPL~	
        LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~FEICRE~ END


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
        LPF  ALTER_SPELL_EFFECT  STR_VAR resource=~FE_DCRE~ END
        
        
        
        
        
	COPY ~3ed\Classes\FavoredEnemy\HATERACE.2DA~ ~override~ // description for ranger favored enemies at character generation - we leave just one entry
	SET name_ref=RESOLVE_STR_REF (@9)
	SET descr_ref=RESOLVE_STR_REF (@10)
	
	SET_2DA_ENTRY 0 1 4 ~%name_ref%~
	SET_2DA_ENTRY 0 3 4 ~%descr_ref%~
	
    OUTER_SPRINT TpdFolder ~3ed\@Descriptions\%GameId%~	
	LAF UPDATE_TLK_ENTRIES STR_VAR TpdFolder Tpd = ~SetRacialEnemyDescriptions.tpd~ TraFile = ~racial_enemy.tra~ END 
	

//racial enemies to rangers (except stlaker) and  cleric/rangers
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=20 d_level=5 add_at_level1=1 
						STR_VAR clab=~\(CLABRN01\)\|\(CLABRN02\)\|\(CLABRN04\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_type_file=~FECRE~ caption=~FECREAL~ END
		//set delay to 1 second (to avoid hangup on 1st level character creation)
	COPY_EXISTING ~FECREAL.SPL~ ~override~
		LPF  ALTER_SPELL_EFFECT INT_VAR duration  =1 timing =3  END
    
    LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~\(CLABRN01\)\|\(CLABRN02\)\|\(CLABRN04\)\|\(CLABRN03\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_type_file=~FE_DCREG~ caption=~FE_DTR~ END    

        
//improved racial enemies for stalkers
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=20 d_level=5 add_at_level1=1 
						STR_VAR clab=~CLABRN03\.2DA~ mask_file=~~ feat_type_file=~~ caption=~FEICRE~ END
//racial enemies to fighter druids
	LAF ADD_BONUS_FEATS INT_VAR min_level=5 max_level=20 d_level=5 add_at_level1=1 
						STR_VAR clab=~CLABDR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_type_file=~FECRE~ caption=~FECREFD~ END
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
						STR_VAR clab=~CLABDR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ feat_type_file=~FE_DCREG~ caption=~FE_DTFD~ END
                        