	//icons and wav
	COPY ~3ed/Classes/AnimalCompanion/ANM_CMPB.BAM~ ~override~ 
	COPY ~3ed/Classes/AnimalCompanion/ANM_CMPC.BAM~ ~override~ 
	COPY ~3ed/Classes/AnimalCompanion/ANM_CST.WAV~ ~override~
	COPY ~3ed/Classes/AnimalCompanion/ANM_EFF.WAV~ ~override~
	COPY ~3ed/Classes/AnimalCompanion/ANM_WLF.WAV~ ~override~
    
    
    //create epic animal companion bonuses
    
    COPY_EXISTING ~SPCL221.SPL~ ~override/EP_ANM.SPL~ //use inquisitor immunities as base and add resistances
        LPF CLONE_EFFECT INT_VAR match_ocpode = 30 opcode = 28 END //cold
        LPF CLONE_EFFECT INT_VAR match_ocpode = 30 opcode = 29 END //elec
        LPF CLONE_EFFECT INT_VAR match_ocpode = 30 opcode = 31 END //magic dam
        LPF CLONE_EFFECT INT_VAR match_ocpode = 30 opcode = 166 END //magic
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 345 target = 2 timing = 9 parameter1 = 4 END  //+4 enchantment
	

//copying animal companion script
//animal summon spell
	COPY ~3ed/Classes/AnimalCompanion/ANM_CMP.BCS~ ~override~ 
	
	OUTER_SPRINT move_string ~~
	OUTER_SPRINT kill_string ~~
	
	
//creating wolfs for diffetent levels
    OUTER_SET maxlvl=30

	OUTER_SET name_ref=RESOLVE_STR_REF (@1)
	OUTER_SET descr_ref=RESOLVE_STR_REF (@2)
    
OUTER_FOR (player_id=1;player_id<=6;player_id=player_id+1) BEGIN
	OUTER_SPRINT script_name EVALUATE_BUFFER ~ANWLF%player_id%~
	OUTER_FOR (i=1;i<=maxlvl;i+=1) BEGIN
		COPY ~3ed/Classes/AnimalCompanion/ANMWLF1.CRE~ ~override/ANWLF%player_id%%i%.CRE~ 
	
		//SAY 0x0008 @701
		//SAY 0x000c @701
	    SET lvl_i  = i>20 ? 20 : i
		WRITE_LONG  0x0008 name_ref  //name
		WRITE_LONG  0x000c name_ref  //tooltip
		WRITE_SHORT 0x0024 3+i*(3+2+(1+i/4)/2)+i/2 //Current Hp
		WRITE_SHORT 0x0026 3+i*(3+2+(1+i/4)/2)+i/2//Max Hp
		WRITE_SHORT 0x0046 (7 - i / 2 )//Natural AC
		WRITE_SHORT 0x0048 (7 - i / 2 )//Effective AC
		WRITE_BYTE  0x0052 (20 - (3 * lvl_i) / 4)//THAC0
		//APR
		PATCH_IF (i<8) BEGIN
			WRITE_BYTE   0x0053  1  //1
		END 
		ELSE PATCH_IF (i>=8) && (i<15) BEGIN
			WRITE_BYTE   0x0053  7  //1.5
		END 
		ELSE BEGIN
			WRITE_BYTE   0x0053  2  //2
		END

		
		//saves
        

		WRITE_BYTE   0x0054   12 - lvl_i / 2 //Death
		WRITE_BYTE   0x0055   12 - lvl_i / 2//Wand
		WRITE_BYTE   0x0056   12 - lvl_i / 2 //Polymorph
		WRITE_BYTE   0x0057   12 - lvl_i / 2 //Breath
		WRITE_BYTE   0x0058   14 - lvl_i / 3 //Spells
	
		WRITE_BYTE   0x0234   i //level
		WRITE_BYTE   0x0238   13+i/4 //Str
		WRITE_BYTE   0x023c   15+i/4 //Dex
		WRITE_BYTE   0x023d   15+i/4 //Con
	
		READ_LONG    0x2bc itemsoffset //weapon (damage)
		PATCH_IF (i<4) BEGIN
			WRITE_ASCII itemsoffset ~P1-4~  
		END 
		ELSE PATCH_IF (i>=4) && (i<8) BEGIN
			WRITE_ASCII itemsoffset ~P1-6~  
		END 
		ELSE PATCH_IF (i>=8) && (i<12) BEGIN
			WRITE_ASCII itemsoffset ~P1-8~  
		END 
		ELSE  PATCH_IF (i>=12) && (i<16) BEGIN
			WRITE_ASCII itemsoffset ~P1-10~  
		END 
		ELSE PATCH_IF (i>=16) && (i<20) BEGIN
			WRITE_ASCII itemsoffset  ~P1-12~  
		END 
		ELSE BEGIN
			WRITE_ASCII itemsoffset ~P2-16~  
		END 
		
		WRITE_EVALUATED_ASCII 0x0280 ~%script_name%~
		WRITE_EVALUATED_ASCII 0x0248 ~%script_name%~ #8
	END
	//string for area scripts
	OUTER_SPRINT move_string EVALUATE_BUFFER 
	~%move_string%
	MoveGlobalObject("%script_name%",Player1)
	ChangeEnemyAlly("%script_name%",CONTROLLED)~
	
	//string for baldur.bcs
	OUTER_SPRINT kill_string EVALUATE_BUFFER 
	~%kill_string%
    ActionOverride("%script_name%",Kill(Myself))
	ActionOverride("%script_name%",DestroySelf())~
	
	//companion script
	COPY ~3ed/Classes/AnimalCompanion/ANM_CMP.bcs~ ~override/%script_name%.bcs~	
	EXTEND_TOP ~%script_name%.bcs~ ~3ed/Classes/AnimalCompanion/ANM_CMP.baf~
		EVALUATE_BUFFER
		
	//companion spell
	COPY ~3ed/Classes/AnimalCompanion/ANM_CMP.SPL~ ~override/AN_CMP%player_id%.SPL~ 
	
		WRITE_LONG  0x0008 name_ref  //name
		WRITE_LONG  0x0050 descr_ref  //description
		
		FOR (i=1;i<=maxlvl;i+=1) BEGIN
			SPRINT resource EVALUATE_BUFFER ~ANWLF%player_id%%i%~
			LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=4 target=4 target_count=0 range=1 required_level=i speed=1 projectile=1  STR_VAR icon=~ANM_CMPB~ END
			LPF ADD_SPELL_EFFECT  INT_VAR  header = i opcode = 67 target = 1 power = 0 parameter1 = 0 parameter2 = 0 duration = 7200 resist_dispel = 0 STR_VAR resource END 
			LPF ADD_SPELL_EFFECT  INT_VAR  header = i opcode = 174 target = 1 power = 0 parameter1 = 0 parameter2 = 0 duration = 0   resist_dispel = 0   STR_VAR resource=~ANM_EFF~ END
			LPF ADD_SPELL_EFFECT  INT_VAR  header = i opcode = 174 target = 1 power = 0 parameter1 = 0 parameter2 = 0 duration = 0   resist_dispel = 0   STR_VAR resource=~ANM_WLF~ END
		END	
	
	//create spell giving proper animal companion and removing all other abilities
	COPY ~3ed/Classes/AnimalCompanion/GV_CMP.spl~ ~override/GV_CMP%player_id%.spl~
		FOR (i=1;i<=6;i=i+1) BEGIN
			SPRINT resource EVALUATE_BUFFER ~AN_CMP%i%~
			LPF ADD_SPELL_EFFECT INT_VAR opcode=172 target=2 timing=0 duration=1 STR_VAR resource END
			PATCH_IF (i=player_id) BEGIN
				LPF ADD_SPELL_EFFECT INT_VAR opcode=171 target=2 timing=0 duration=1 STR_VAR resource END
				LPF ADD_SPELL_EFFECT INT_VAR opcode=233 target=2 timing=1 duration=1 parameter1=i parameter2=134 END
			END
		END
		
	//update baldur bcs (global script summon giving ability)
	OUTER_SPRINT spell_name EVALUATE_BUFFER ~GV_CMP%player_id%~
	EXTEND_TOP_REGEXP ~\(BD\)*BALDUR.*\.BCS~ ~3ed/Classes/AnimalCompanion/baldur.baf~
		EVALUATE_BUFFER	
	
END
