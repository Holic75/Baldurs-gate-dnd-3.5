	//spellfused warden 	
	OUTER_SET   yes_response=RESOLVE_STR_REF (@500005)
	OUTER_SET   no_response=RESOLVE_STR_REF (@500006)
	
	LAF SPLIT_SPELLS_BY_SCHOOL END
	OUTER_SET k=1
	COPY ~3ed/Feats/SpellfusedWarden/Schools2DA~ ~override~
		DEFINE_ASSOCIATIVE_ARRAY school_list BEGIN "%k%" => "%SOURCE_RES%" END
		SET k=k+1
		
		
		ACTION_PHP_EACH school_list AS school_i =>school_file_name BEGIN
		OUTER_SET school_id=school_i
		OUTER_SPRINT school_file_2DA EVALUATE_BUFFER ~%school_file_name%~
		LAF UPDATE_SPELLFUSED_WARDEN_SCHOOLS INT_VAR school_id yes_response no_response STR_VAR school_file_2DA END	
	END	
	

	
	COPY ~3ed/Feats/SpellfusedWarden/school.d~  ~3ed/Feats/SpellfusedWarden/school.d~  	
		REPLACE_TEXTUALLY ~%~	~|~
		REPLACE_TEXTUALLY ~|school_description_str|~ ~~
		REPLACE_TEXTUALLY ~|school_str|~ ~~
		COMPILE ~3ed/Feats/SpellfusedWarden/school.d~ 
		
		
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/SWFTCRE.CRE~
		WRITE_ASCII 0x248 ~SFTCRE~ #8//override script
		WRITE_ASCII 0x02cc ~school~ #8//dialog
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/SWFTCRE.EFF~
		WRITE_ASCII 0x0030 ~SWFTCRE~ #8//creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/SWFTCRE.SPL~	
		LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~SWFTCRE~ END
		
	//apply 
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
		STR_VAR clab=~CLABDR02\.2DA~ mask_file=~~
		feat_type_file=~~ caption=~SWFTCRE~ END