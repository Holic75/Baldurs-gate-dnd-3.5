//beastmaster bonuses
    OUTER_FOR (i = 1; i<=6; i = i + 1) BEGIN
        COPY ~3ed/Classes/AnimalCompanion/BeastMaster/RNGBON%i%.SPL~ ~override~ 
            LPF MAKE_ALWAYS_CASTABLE END
    END

	
	
OUTER_FOR (player_id=1;player_id<=6;player_id=player_id+1) BEGIN

	//scripts
	COPY ~3ed/Classes/AnimalCompanion/BeastMaster/RNGSQR.BCS~ ~override/RNGSQR%player_id%.BCS~

	EXTEND_TOP ~RNGSQR%player_id%.BCS~ ~3ed/Classes/AnimalCompanion/BeastMaster/RNGSQR.baf~
		EVALUATE_BUFFER
		
	COPY ~3ed/Classes/AnimalCompanion/BeastMaster/RNGSQR.CRE~ ~override/RNGSQR%player_id%.CRE~
		WRITE_EVALUATED_ASCII 0x248 ~RNGSQR%player_id%~ #8//override script
		
	COPY ~3ed/Classes/AnimalCompanion/BeastMaster/RNGSQRS.SPL~ ~override/RNGSQS%player_id%.SPL~ //apply effect every 6 secs
        LPF MAKE_ALWAYS_CASTABLE END
		SPRINT resource EVALUATE_BUFFER ~RNGSQS%player_id%~	
		LPF ALTER_SPELL_EFFECT INT_VAR opcode = 272 STR_VAR resource END
	
	COPY ~3ed/Classes/AnimalCompanion/BeastMaster/RNGSQRS.EFF~ ~override/RNGSQS%player_id%.EFF~ 
		WRITE_EVALUATED_ASCII 0x0030 ~RNGSQR%player_id%~	 #8//spell name
		
	COPY ~3ed/Classes/AnimalCompanion/BeastMaster/RNGSQR.SPL~ ~override/RNGSQR%player_id%.SPL~ //summon creature through eff file to avoid summoning cloud
		LPF MAKE_ALWAYS_CASTABLE END
        SPRINT resource EVALUATE_BUFFER ~RNGSQR%player_id%~	
		LPF ALTER_SPELL_EFFECT INT_VAR opcode = 177 STR_VAR resource END
	
	COPY ~3ed/Classes/AnimalCompanion/BeastMaster/RNGSQR.EFF~ ~override/RNGSQR%player_id%.EFF~
		WRITE_EVALUATED_ASCII 0x0030 ~RNGSQR%player_id%~	 #8//creature name
		

END