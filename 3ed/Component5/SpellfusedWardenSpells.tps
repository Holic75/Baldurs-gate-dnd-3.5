	//spellfused warden 	
	OUTER_SET   yes_response=RESOLVE_STR_REF (@500005)
	OUTER_SET   no_response=RESOLVE_STR_REF (@500006)
	
	LAF SPLIT_SPELLS_BY_SCHOOL END
	OUTER_FOR (k=1;k<=8;k=k+1) BEGIN
        COPY_EXISTING ~Schl%k%.2DA~ ~override~
            DEFINE_ASSOCIATIVE_ARRAY school_list BEGIN "%k%" => "%SOURCE_RES%" END
	
    END
    
    COPY ~3ed/Feats/SpellfusedWarden/school.d~  ~override~ 
    ACTION_PHP_EACH school_list AS school_i =>school_file_name BEGIN
        OUTER_SET school_id=school_i
        OUTER_SPRINT school_file_2DA EVALUATE_BUFFER ~%school_file_name%~
        LAF UPDATE_SPELLFUSED_WARDEN_SCHOOLS INT_VAR school_id yes_response no_response STR_VAR school_file_2DA END	
    END	
	

	
	COPY_EXISTING ~school.d~  ~override~  	
		REPLACE_TEXTUALLY ~%~	~|~
		REPLACE_TEXTUALLY ~|school_description_str|~ ~~
		REPLACE_TEXTUALLY ~|school_str|~ ~~
		COMPILE ~override/school.d~ 
		
		
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/SWFTCRE.CRE~
		WRITE_ASCII 0x248 ~SFTCRE~ #8//override script
		WRITE_ASCII 0x02cc ~school~ #8//dialog
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/SWFTCRE.EFF~
		WRITE_ASCII 0x0030 ~SWFTCRE~ #8//creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/SWFTCRE.SPL~	
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~SWFTCRE~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=2 duration=1 timing=9 STR_VAR resource = ~SWFTCRE~ END
		
	//apply 
	LAF ADD_FEATS_LVL INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 delay = 5
		STR_VAR clab=~CLABDR02\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRED.SPL~
		feat_name=~SWFTCRE~ caption=~SPWDFT~ END