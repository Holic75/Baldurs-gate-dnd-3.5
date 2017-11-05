	OUTER_SET   yes_response=RESOLVE_STR_REF (@500001)
	OUTER_SET   no_response=RESOLVE_STR_REF (@500002)
	
	
	//priest domain
	OUTER_SET k=1
	COPY ~3ed/Feats/PriestDomains/Domains2DA~ ~override~
		DEFINE_ASSOCIATIVE_ARRAY domain_list BEGIN "%k%" => "%SOURCE_RES%" END
		SET k=k+1
		
		
	ACTION_PHP_EACH domain_list AS domain_i =>domain_file_name BEGIN
		OUTER_SET domain_id=domain_i
		OUTER_SPRINT domain_file_2DA EVALUATE_BUFFER ~%domain_file_name%~
		LAF UPDATE_PRIEST_DOMAIN INT_VAR domain_id yes_response no_response STR_VAR domain_file_2DA END	
	END
	
	
	COPY ~3ed/Feats/PriestDomains/domain.d~  ~3ed/Feats/PriestDomains/domain.d~  	
		REPLACE_TEXTUALLY ~%~	~|~
		REPLACE_TEXTUALLY ~|domain_description_str|~ ~~
		REPLACE_TEXTUALLY ~|domain_str|~ ~~
		COMPILE ~3ed/Feats/PriestDomains/domain.d~ 
		
		
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/DFTCRE.CRE~
		WRITE_ASCII 0x248 ~SFTCRE~ #8//override script
		WRITE_ASCII 0x02cc ~domain~ #8//dialog
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/DFTCRE.EFF~
		WRITE_ASCII 0x0030 ~DFTCRE~ #8//creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/DFTCRE.SPL~	
		LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~DFTCRE~ END