	//sorceror bloodlines
	
	OUTER_SET   yes_response=RESOLVE_STR_REF (@500003)
	OUTER_SET   no_response=RESOLVE_STR_REF (@500004)
	
	OUTER_SET k=1
	COPY ~3ed/Feats/SorcBloodlines/Bloodlines2DA~ ~override~
		DEFINE_ASSOCIATIVE_ARRAY bloodline_list BEGIN "%k%" => "%SOURCE_RES%" END
		SET k=k+1
		
	COPY ~3ed/Feats/SorcBloodlines/bldline.d~ ~override~
	ACTION_PHP_EACH bloodline_list AS bloodline_i =>bloodline_file_name BEGIN
		OUTER_SET bloodline_id=bloodline_i
		OUTER_SPRINT bloodline_file_2DA EVALUATE_BUFFER ~%bloodline_file_name%~
		LAF UPDATE_SORC_BLOODLINE INT_VAR bloodline_id yes_response no_response STR_VAR bloodline_file_2DA END	
	END
	
	
	COPY_EXISTING ~bldline.d~  ~override~  	
		REPLACE_TEXTUALLY ~%~	~|~
		REPLACE_TEXTUALLY ~|bloodline_description_str|~ ~~
		REPLACE_TEXTUALLY ~|bloodline_str|~ ~~
		COMPILE ~override/bldline.d~ 
		
		
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/BDFTCRE.CRE~
		WRITE_ASCII 0x248 ~SFTCRE~ #8//override script
		WRITE_ASCII 0x02cc ~bldline~ #8//dialog
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/BDFTCRE.EFF~
		WRITE_ASCII 0x0030 ~BDFTCRE~ #8//creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/BDFTCRE.SPL~	
		LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~BDFTCRE~ END
		
	//apply to sorceror
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 delay = 5
		STR_VAR clab=~CLABMA01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRES.SPL~
		feat_type_file=~BDFTCRE~ caption=~SRBLDLN~ END