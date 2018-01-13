
//air - 25% protection from lightning

    COPY_EXISTING ~SPPR407.SPL~  ~override/LTNGPR.SPL~
        LPF DELETE_ALL_SPELL_HEADERS_EXCEPT_FIRST END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_timing = 4 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_timing = 142 END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 29 parameter1 = 0 parameter2 = 25 END
        LPF ALTER_SPELL_EFFECT INT_VAR timing = 1 duration = 1 resist_dispel = 0 END
    
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN ~AirD~ => ~LTNGPR~ END
    
//fire - 25% protection from fire

    COPY_EXISTING ~SPPR306.SPL~  ~override/FIREPR.SPL~
        LPF DELETE_ALL_SPELL_HEADERS_EXCEPT_FIRST END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_timing = 4 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_timing = 142 END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 84 parameter1 = 0 parameter2 = 25 END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 30 parameter1 = 0 parameter2 = 25 END
        LPF ALTER_SPELL_EFFECT INT_VAR timing = 1 duration = 1 resist_dispel = 0 END
        
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~FireD~ => ~FIREPR~ END
    
    
//cold - 25% protection from cold

    COPY_EXISTING ~SPWI320.SPL~  ~override/COLDPR.SPL~
        LPF DELETE_ALL_SPELL_HEADERS_EXCEPT_FIRST END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_timing = 4 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_timing = 142 END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 28 parameter1 = 0 parameter2 = 25 END
        LPF ALTER_SPELL_EFFECT INT_VAR timing = 1 duration = 1 resist_dispel = 0 END
        
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~ColdD~ => ~COLDPR~ END
    
//earth - 25% protection from acid

    COPY_EXISTING ~SPWI517.SPL~  ~override/ACIDPR.SPL~
        LPF DELETE_ALL_SPELL_HEADERS_EXCEPT_FIRST END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_timing = 4 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_timing = 142 END
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 27 parameter1 = 0 parameter2 = 25 END
        LPF ALTER_SPELL_EFFECT INT_VAR timing = 1 duration = 1 resist_dispel = 0 END
        
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~EarthD~ => ~ACIDPR~ END
    
//time - immunity to sneak attack
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~TimeD~ => ~IMMSNK~ END
    
//war - free weapon focus
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~WarD~ => ~wftcre~ END    
    
    
//glory - aura of faith
	COPY ~3ed/Feats/LimitedUseAbilities/Template/LUAFT.SPL~  ~override/GLORYFT.SPL~
		LPF ADD_SPELL_EFFECT INT_VAR opcode=171 target=2 timing=9 duration=1 STR_VAR resource = ~AURAFAI~ END
    
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~GloryD~ => ~GLORYFT~ END
    
//plant - poison weapon
	COPY ~3ed/Feats/LimitedUseAbilities/Template/LUAFT.SPL~  ~override/PLANTFT.SPL~
		LPF ADD_SPELL_EFFECT INT_VAR opcode=171 target=2 timing=9 duration=1 STR_VAR resource = ~SPCL423~ END
    
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~PlantD~ => ~PLANTFT~ END
    
//animal- charm animal 10'

 WITH_TRA ~%LANGUAGE%\domain_abilities.tra~ BEGIN
    COPY_EXISTING ~SPIN108.SPL~ ~override/ANIM10.SPL~
        LPF ALTER_SPELL_HEADER INT_VAR projectile = 178 target = 5 END
        SAY NAME1 @001
        SAY UNIDENTIFIED_DESC @002
END    
	COPY ~3ed/Feats/LimitedUseAbilities/Template/LUAFT.SPL~  ~override/ANIMFT.SPL~
		LPF ADD_SPELL_EFFECT INT_VAR opcode=171 target=2 timing=9 duration=1 STR_VAR resource = ~ANIM10~ END
    
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~AnmlD~ => ~ANIMFT~ END
    
    
//death - death touch
WITH_TRA ~%LANGUAGE%\domain_abilities.tra~ BEGIN
    COPY_EXISTING ~SPPR511.SPL~ ~override/DTHTCH.SPL~
        LPF DELETE_ALL_SPELL_HEADERS_EXCEPT_FIRST END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 12 END //no damage on fail
    COPY_EXISTING ~DTHTCH.SPL~ ~override/DTHTCH.SPL~    
        LPF ALTER_SPELL_EFFECT_EX INT_VAR savebonus = 0 power = 0 END
        
        FOR (i=1;i<=7;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1  END 
            LPF ALTER_SPELL_HEADER INT_VAR header = i+1 min_level =  4*i END   
            SET savebonus = 0 - i
            LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i+1 savebonus END            
        END
        
        LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_type = 4 END
        SAY NAME1 @003
        SAY UNIDENTIFIED_DESC @004
END    

	COPY ~3ed/Feats/LimitedUseAbilities/Template/LUAFT.SPL~  ~override/DTHFT.SPL~
		LPF ADD_SPELL_EFFECT INT_VAR opcode=171 target=2 timing=9 duration=1 STR_VAR resource = ~DTHTCH~ END
    
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~DeathD~ => ~DTHFT~ END

//trickery - mirror image (from dark moon monk)
 
	COPY ~3ed/Feats/LimitedUseAbilities/Template/LUAFT.SPL~  ~override/TRCKFT.SPL~
		LPF ADD_SPELL_EFFECT INT_VAR opcode=171 target=2 timing=9 duration=1 STR_VAR resource = ~SPDM106~ END
        
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~TrickD~ => ~TRCKFT~ END

  
//sun - divine light
WITH_TRA ~%LANGUAGE%\domain_abilities.tra~ BEGIN
    COPY_EXISTING ~SPCL239A.SPL~ ~override/SUNHIT.SPL~
        
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 215 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 142 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 177 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 74 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 139 END
        
        SET savingthrow = 1 << 24
        LPF ALTER_SPELL_EFFECT_EX INT_VAR savingthrow savebonus = 0 END //no saves
    
    COPY_EXISTING ~SPCL239.SPL~ ~override/SUNLGT.SPL~    
        LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPCL239A~ resource = ~SUNHIT~ END
        LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 206 opcode = 318 parameter1 =0 parameter2 = 2 target = 2 END //protect everyone except undead
        SAY NAME1 @005
        SAY UNIDENTIFIED_DESC @006   
END    

	COPY ~3ed/Feats/LimitedUseAbilities/Template/LUAFT.SPL~  ~override/SUNFT.SPL~
		LPF ADD_SPELL_EFFECT INT_VAR opcode=171 target=2 timing=9 duration=1 STR_VAR resource = ~SUNLGT~ END
        
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~SunD~ => ~SUNFT~ END
    

//moon  - immunity to blindness
    COPY_EXISTING ~SPWI106.SPL~ ~override~
        LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 139 RET BlndStrRef = parameter1 END
    COPY ~3ed/Feats/PriestDomains/BLNDPR.SPL~ ~override~
        LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 267 parameter1 = BlndStrRef timing = 1 duration = 1 END //protection from display string
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~MoonD~ => ~BLNDPR~  END

//protection - +1 bonus to saving throws
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~PrtctD~ => ~LKHRS~  END  

//magic - dispelling touch
WITH_TRA ~%LANGUAGE%\domain_abilities.tra~ BEGIN
    COPY_EXISTING ~SPCL231.SPL~ ~override/DSPTCH.SPL~ //using inquistors dispel as template
        LPF ALTER_SPELL_HEADER INT_VAR target = 1 projectile = 1 range = 1 END
        SAY NAME1 @007
        SAY UNIDENTIFIED_DESC @008 
END        
	COPY ~3ed/Feats/LimitedUseAbilities/Template/LUAFT.SPL~  ~override/MAGDOFT.SPL~
		LPF ADD_SPELL_EFFECT INT_VAR opcode=171 target=2 timing=9 duration=1 STR_VAR resource = ~DSPTCH~ END
        
    ACTION_DEFINE_ASSOCIATIVE_ARRAY DomainAbilities BEGIN~MagicD~ => ~MAGDOFT~ END  