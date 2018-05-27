
// -------------------------------Creating feat giving creatures (all, fighter-general, mage and kensai), feat cheking creature ---------------------------------
	//Select Feat Ability
	OUTER_SET   yes_response=RESOLVE_STR_REF (@1003)
	OUTER_SET   no_response=RESOLVE_STR_REF (@1004)
	OUTER_SET   kensai_yes_response=RESOLVE_STR_REF (@1005)
	OUTER_SET   kensai_no_response=RESOLVE_STR_REF (@1006)
	
	//name => feat_type
	ACTION_DEFINE_ASSOCIATIVE_ARRAY FtcreArray BEGIN
		~wftcre~ => 1 //weapons 001
        ~fftcre~ => 3 //fighter feats 011
		~mftcre~ => 4 //mage feats 100
		~sftcre~ => 7 //all feats 111
        ~tftcre~ => 2 //style feats 010
	END
	
	ACTION_PHP_EACH FtcreArray AS sftcre_name =>FtcreFeatType BEGIN 
		COPY ~3ed/Feats/FeatAttribution/sftcre.d~  ~override/%sftcre_name%.d~	
	END
	
	COPY ~3ed/Feats/FeatAttribution/SFTCRE.BCS~ ~override~
	
	
	ACTION_DEFINE_ARRAY FeatsData BEGIN
	//  feat1     feat2     feat3      feat4      feat5     feat6          feat7     prof_id   feat_type  tree_name  tree_descr feat_name_start  feat_descr_start
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~89~      ~1~       ~001~     ~002~      ~003~            ~010~  //straight swords
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~90~		 ~1~	   ~021~     ~022~		~003~            ~010~  //blades
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~91~      ~1~       ~023~     ~024~		~003~            ~010~  //axes
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~92~      ~1~       ~025~     ~026~		~003~            ~010~  //curved swords
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~93~      ~1~       ~027~     ~028~		~003~            ~010~  //blunt weapons
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~94~      ~1~       ~029~     ~030~		~003~            ~010~  //spiked weapons
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~95~      ~1~       ~031~     ~032~		~003~            ~010~  //polearms
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~96~      ~1~       ~033~     ~034~		~003~            ~010~  //crossobows
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~97~      ~1~       ~035~     ~036~		~003~            ~010~  //bows
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~98~      ~1~       ~037~     ~038~		~003~            ~010~  //missile weapons
		~WPFNSFT~  ~DODGEFT~  ~LTNGRXFT~ ~FLRSTKFT~ ~ELTSTKFT~ ~WHIRLNFT~ ~WHIRLGFT~   ~99~      ~2~       ~161~     ~162~      ~163~            ~170~  //combat prowess
		~PWRATKFT~ ~CLEAV1FT~ ~GRTFTDFT~ ~CLEAV2FT~ ~TOUGHSFT~ ~EPCSTNFT~ ~EPCSLAFT~   ~100~     ~2~       ~181~     ~182~      ~183~            ~190~  //warfare
		~INSTKFT~  ~CMBEXPFT~ ~IRONWLFT~ ~STUDOPFT~ ~CMBINTFT~ ~EPCCRTFT~ ~EPCEVSFT~   ~101~     ~2~       ~201~     ~202~      ~203~            ~210~  //tactics	
		~PRSLT1FT~ ~PRSLT2FT~ ~PRSLT3FT~ ~PRSLT4FT~ ~PRSLT5FT~ ~PRSLT6FT~ ~PRSLT7FT~   ~102~     ~4~       ~221~     ~222~      ~223~            ~230~  //bonus priest spells	 
		~WZSLT1FT~ ~WZSLT2FT~ ~WZSLT3FT~ ~WZSLT4FT~ ~WZSLT5FT~ ~WZSLT6FT~ ~WZSLT7FT~   ~103~     ~4~       ~241~     ~242~      ~243~            ~250~  //bonus wizard spells	
		~EMPWR1FT~ ~EMPWR2FT~ ~EMPWR3FT~ ~EMPWR4FT~ ~EMPWR5FT~ ~EMPWR6FT~ ~EMPWR7FT~   ~104~     ~4~       ~261~     ~262~      ~263~            ~270~  //empower magic		   
		~EXTND1FT~ ~EXTND2FT~ ~EXTND3FT~ ~EXTND4FT~ ~EXTND5FT~ ~EXTND6FT~ ~EXTND7FT~   ~105~     ~4~       ~281~     ~282~      ~283~            ~290~  //extend magic		
		~MGPTN1FT~ ~MGPTN2FT~ ~MGPTN3FT~ ~MGPTN4FT~ ~MGPTN5FT~ ~MGPTN6FT~ ~MGPTN7FT~   ~106~     ~4~       ~301~     ~302~      ~303~            ~310~  //protection from magic	
		~QUICK1FT~ ~QUICK2FT~ ~QUICK3FT~ ~QUICK4FT~ ~QUICK5FT~ ~QUICK6FT~ ~QUICK7FT~   ~107~     ~4~       ~321~     ~322~      ~323~            ~330~  //quicken magic				
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~111~     ~2~       ~101~     ~102~      ~103~            ~110~  //2h weapons    
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~112~     ~2~	   ~121~     ~122~      ~103~            ~123~  //sword and shield
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~113~     ~2~	   ~131~     ~132~      ~103~            ~133~  //single weapon
		~~		  ~~          ~~         ~~         ~~         ~~          ~~          ~114~     ~2~       ~141~     ~142~      ~103~            ~143~  //two weapon combat
		~RPDSHTFT~ ~PBSHOTFT~ ~RPDSTIFT~ ~DEDAIMFT~ ~RNGCRTFT~ ~HAILANFT~ ~HAILAGFT~   ~115~     ~2~       ~151~     ~152~      ~103~            ~153~  //archery

	END
	
	OUTER_SET Nfeats = 24
	OUTER_SET FeatSize = 13
	OUTER_SET MaxStars = 7
	 
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.BCS~ ~override/CFEATCRE.BCS~
	 
	OUTER_FOR (k=0;k<Nfeats;k=k+1) BEGIN
		OUTER_SET proficiency_id_idx = k*FeatSize + 7
		OUTER_SET feat_type_idx = k*FeatSize + 8
		OUTER_SET tree_name_idx = k*FeatSize + 9
		OUTER_SET tree_descr_idx = k*FeatSize + 10
		OUTER_SET feat_name_idx = k*FeatSize + 11
		OUTER_SET feat_descr_idx = k*FeatSize + 12
		
		OUTER_SET EVALUATE_BUFFER tree_name_ref=$FeatsData("%tree_name_idx%")
		OUTER_SET EVALUATE_BUFFER tree_descr_ref=$FeatsData("%tree_descr_idx%")
		OUTER_SET EVALUATE_BUFFER feat_type=$FeatsData("%feat_type_idx%")
		OUTER_SET EVALUATE_BUFFER feat_name_ref=$FeatsData("%feat_name_idx%")
		OUTER_SET EVALUATE_BUFFER feat_descr_ref=$FeatsData("%feat_descr_idx%")
		OUTER_SET EVALUATE_BUFFER proficiency_id=$FeatsData("%proficiency_id_idx%")
		
		LAF CREATE_PROFICIENCY_DESCRIPTION INT_VAR proficiency_id label_name=tree_name_ref label_desc=tree_descr_ref
												   label_featname_start=feat_name_ref label_featdesc_start=feat_descr_ref n_stars=MaxStars label_slot=1001 label_slots=1002 END
												
		OUTER_SPRINT tree_name (AT "tree_name_ref")
      	OUTER_FOR (i=1;i<=MaxStars;i=i+1) BEGIN
			OUTER_SET n_stars_old = i - 1
			OUTER_SET lvl= 4*(i - 1) + (i = 1) + (i = 6)//feats at lvl 1,4,8,12,16,21,24
			OUTER_SPRINT new_name  EVALUATE_BUFFER ~FT%proficiency_id%_%i%~
			OUTER_SET feat_name_ref_i=feat_name_ref+i - 1
			OUTER_SPRINT feat_name (AT "feat_name_ref_i")
			OUTER_SET feat_descr_ref_i=feat_descr_ref+i -1 
			OUTER_SPRINT feat_descr (AT "feat_descr_ref_i")
			OUTER_SPRINT game_name EVALUATE_BUFFER ~%tree_name% (%i%): %feat_name%~
			OUTER_SPRINT game_description EVALUATE_BUFFER ~%feat_descr%~
			OUTER_SET n_stars=i
			
			OUTER_SET feat_idx = (k*FeatSize + i - 1)
			OUTER_SPRINT feat EVALUATE_BUFFER $FeatsData("%feat_idx%")
			
			LAF ADD_SELECT_FEAT INT_VAR proficiency_id n_stars STR_VAR new_name feat game_name game_description END

			ACTION_PHP_EACH FtcreArray AS sftcre_name =>FtcreFeatType BEGIN 
				ACTION_IF (feat_type BAND FtcreFeatType) BEGIN
					LAF UPDATE_SFTCRE_DLG INT_VAR n_stars_old n_stars proficiency_id lvl STR_VAR sftcre_name new_name conditions_str END
				END
			END
			
			//feat checking (after level up)
			OUTER_FOR (n_stars=MaxStars;n_stars>=1;n_stars=n_stars - 1) BEGIN
				EXTEND_TOP ~CFEATCRE.BCS~ ~3ed/Feats/FeatAttribution/SFEATCRE.baf~
				EVALUATE_BUFFER			
			END
						
		END
    END
	
	ACTION_PHP_EACH FtcreArray AS sftcre_name =>FtcreFeatType BEGIN 
		COPY_EXISTING ~%sftcre_name%.d~  ~override/%sftcre_name%.d~  	
		REPLACE_TEXTUALLY ~%~	~|~
		REPLACE_TEXTUALLY ~|condition_str|~ ~~
		REPLACE_TEXTUALLY ~|give_feat_str|~ ~~	
        SET dialog_string_ref = 10000 + FtcreFeatType
        SPRINT dialog_string (AT "dialog_string_ref")
        REPLACE_TEXTUALLY ~XXXX~	~%dialog_string%~
        REPLACE_TEXTUALLY ~sftcre~	~%sftcre_name%~
		
		COMPILE ~override/%sftcre_name%.d~  
		
		
	
		COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/%sftcre_name%.CRE~
			WRITE_EVALUATED_ASCII 0x248 ~sftcre~ #8//override script
			WRITE_EVALUATED_ASCII 0x02cc ~%sftcre_name%~ #8//dialog
		COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/%sftcre_name%.EFF~
			WRITE_EVALUATED_ASCII 0x0030 ~%sftcre_name%~ #8//creature name
		COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/%sftcre_name%.SPL~	
			SPRINT resource EVALUATE_BUFFER ~%sftcre_name%~
			LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource END
	END
	
	//create checking feat effect
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/CFEATCRE.CRE~
		WRITE_ASCII 0x248 ~CFEATCRE~ //override script
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/CFEATCRE.EFF~
		WRITE_ASCII 0x0030 ~CFEATCRE~ //creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/CFEATCRE.SPL~	
		LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~CFEATCRE~ END

	//add it to every clab file every 3 levels (and lvl1) (should be done at the very end)

	LAF ADD_BONUS_FEATS INT_VAR min_level=3 max_level=40 d_level=3 add_at_level1=1 
						STR_VAR clab=~\(\(CLAB.*\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~ mask_file=~~
						feat_type_file=~~ caption=~CFEATCRE~ END
		
//--------------------------------------------------kensai signature weapon--------------------------------------------------------------------			 
COPY ~3ed/Classes/Kensai/KENSCRE.BCS~ ~override~
COPY ~3ed/Classes/Kensai/kenscre.d~  ~override/kenscre.d~ 

	OUTER_FOR (k=0;k<10;k=k+1) BEGIN

		OUTER_SET proficiency_id_idx = k*FeatSize + 7		
		OUTER_SET tree_name_idx = k*FeatSize + 9
		OUTER_SET tree_descr_idx = k*FeatSize + 10
		
		OUTER_SET EVALUATE_BUFFER tree_name_ref=$FeatsData("%tree_name_idx%")
		OUTER_SET EVALUATE_BUFFER tree_descr_ref=$FeatsData("%tree_descr_idx%")
		OUTER_SET EVALUATE_BUFFER proficiency_id=$FeatsData("%proficiency_id_idx%")
		OUTER_SPRINT tree_name (AT "tree_name_ref")
		OUTER_SPRINT tree_desc (AT "tree_descr_ref")
		
		COPY ~3ed/Classes/Kensai/KENSFT.SPL~ ~override/KNSFT%proficiency_id%.SPL~  //mark chosen category
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=233 parameter2=proficiency_id END
			
		LAF UPDATE_KENSAICRE_DLG INT_VAR proficiency_id STR_VAR tree_name tree_desc END
		
		//script for giving bonus feats based on selected weapon category
		OUTER_FOR (i=2;i<=MaxStars;i=i+1) BEGIN   
			OUTER_SET lvl=4*(i - 1) + (i==6)
			OUTER_SET n_stars = i 
			EXTEND_TOP ~KENSCRE.BCS~  ~3ed/Classes/Kensai/KENSCRE.baf~
				EVALUATE_BUFFER	
		END
		
    END
	OUTER_SPRINT kens_string @10010

      
	COPY_EXISTING ~kenscre.d~  ~override/kenscre.d~
		REPLACE_TEXTUALLY ~%~	~|~
		REPLACE_TEXTUALLY ~|condition_str|~ ~~
		REPLACE_TEXTUALLY ~|give_feat_str|~ ~~
        REPLACE_TEXTUALLY ~XXXX~	~%kens_string%~
		COMPILE ~override/kenscre.d~ 
		
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/KENSCRE.CRE~
		WRITE_ASCII 0x248 ~KENSCRE~ #8//override script
		WRITE_ASCII 0x02cc ~kenscre~ #8//dialog
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/KENSCRE.EFF~
		WRITE_ASCII 0x0030 ~KENSCRE~ #8//creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/KENSCRE.SPL~	
		LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~KENSCRE~ END
	
	
	LAF ADD_BONUS_FEATS INT_VAR mask = 0b100100001000100010001001 //(1,4,8,12,16,21,24)
				STR_VAR clab=~CLABFI04.2DA~ mask_file=~~
					feat_type_file=~~ caption=~KENSCRE~ END 	
