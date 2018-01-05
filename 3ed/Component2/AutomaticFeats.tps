
//---------------------------automatic feats------------------------------------------
//saving throws 
	LAF ADD_PSBP_FEAT INT_VAR min_val=1 bdr_val=11 max_val=25 step=2 par1=132 STR_VAR ability_name=~CHASAV~ END //cha bonus to saving throws (for paladin and jester)
	LAF ADD_PSBP_FEAT INT_VAR min_val=1 bdr_val=11 max_val=25 step=2 par1=122 STR_VAR ability_name=~DEXSAV~ END //dex bonus to saving throws
	LAF ADD_PSBP_FEAT INT_VAR min_val=1 bdr_val=11 max_val=25 step=2 par1=130 STR_VAR ability_name=~WISSAV~ END //wis bonus to saving throws
	LAF ADD_PSBP_FEAT INT_VAR min_val=1 bdr_val=11 max_val=25 step=2 par1=126 STR_VAR ability_name=~CONSAV~ END //con bonus to saving throws
    
    LAF ADD_PSBP_FEAT INT_VAR min_val=1 bdr_val=11 max_val=25 step=2 par1=132 STR_VAR ability_name=~HEXSAV~ END //cha bonus to spell saving throws for hexblade
	
	//protection against applying saves bonus second time (for multi-class)
	COPY_EXISTING ~DEXSAVFT.SPL~ ~override~ 
		LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=2 duration=1 timing=9 STR_VAR resource=~DEXSAVFT~ END 
	COPY_EXISTING ~WISSAVFT.SPL~ ~override~ 
		LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=2 duration=1 timing=9 STR_VAR resource=~WISSAVFT~ END 
	COPY_EXISTING ~CONSAVFT.SPL~ ~override~ 
		LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=2 duration=1 timing=9 STR_VAR resource=~CONSAVFT~ END 
        
        
    LAF ADD_PSEPB_FEAT INT_VAR min_val = 1 max_val = 25 step = 1 abi_g = 128 min_bonus_val = 55 bonus_step = 5 STR_VAR ability_name=~INTSK~ END //int skill bonuses for thieving skills 

WITH_TRA ~%LANGUAGE%\monk.tra~ BEGIN		
//wisdom ac bonus for monks/kensai/ninja
	LAF ADD_PSB_FEAT INT_VAR min_val=12 max_val=25 step=2 par1=130 STR_VAR ability_name=~WISDAC~ END //monk/kensai wisdom bonus to ac with light or no armor 

//monk flurry of blows
	OUTER_SPRINT game_name @010  OUTER_SPRINT game_description @011
	LAF ADD_ACT_FEAT STR_VAR ability_name=~MKFLR1~ game_name game_description  END //monk flurry of blows (+1 attack, -2 to hit)
	LAF ADD_ACT_FEAT STR_VAR ability_name=~MKFLR2~ game_name game_description  END //monk flurry of blows (+1 attack, -1 to hit)
	//add removal of flurry 1 effect and feat
		COPY_EXISTING ~MKFLR2FT.SPL~ ~override~
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 duration=1 insert_point=0 STR_VAR resource=~MKFLR1BN~ END 
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~MKFLR11~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~MKFLR11~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~MKFLR10~ END

	LAF ADD_PSL_FEAT STR_VAR ability_name=~MKFLR3~ END //flurry of blows +1 attack without penalties
	//add removal of effect of flurry2 and ability buttons, add protection from flurry 2,1
		COPY_EXISTING ~MKFLR3FT.SPL~ ~override~
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~MKFLR21~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~MKFLR2BN~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~MKFLR21~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~MKFLR20~ END
		
	LAF ADD_PSL_FEAT STR_VAR ability_name=~MKFLR4~ END //flurry of blows +2 attacks without penalties
	//add removal of effect of flurry3 feat and effect, add protection from flurry 3,2,1
	COPY_EXISTING ~MKFLR4FT.SPL~ ~override~
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 duration=1 insert_point=0 STR_VAR resource=~MKFLR3BN~ END 
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 duration=1 insert_point=0 STR_VAR resource=~MKFLR3FT~ END 

END




//versatile spellcasting (fcm, cm)
WITH_TRA ~%LANGUAGE%\cleric_mage.tra~ BEGIN
    OUTER_FOR (i=1;i<=7;i=i+1) BEGIN
       MKDIR ~3ed/Feats/ActivatedAbilities/CM_VS%i%~
       COPY ~3ed/Classes/ClericMage/CM_VS%i%0B.BAM~     ~3ed/Feats/ActivatedAbilities/CM_VS%i%/CM_VS%i%0B.BAM~
       COPY ~3ed/Classes/ClericMage/CM_VS%i%0B.BAM~     ~3ed/Feats/ActivatedAbilities/CM_VS%i%/CM_VS%i%0C.BAM~
       COPY ~3ed/Classes/ClericMage/CM_VS%i%1B.BAM~     ~3ed/Feats/ActivatedAbilities/CM_VS%i%/CM_VS%i%1B.BAM~
       COPY ~3ed/Classes/ClericMage/CM_VS%i%1B.BAM~     ~3ed/Feats/ActivatedAbilities/CM_VS%i%/CM_VS%i%1C.BAM~       
       
       COPY ~3ed/Classes/ClericMage/CM_VS%i%.SPL~     ~3ed/Feats/ActivatedAbilities/CM_VS%i%/CM_VS%i%.SPL~
      
       OUTER_SPRINT ability_name EVALUATE_BUFFER ~CM_VS%i%~
    
       OUTER_SET game_name_var = 2*(i - 1) + 1 OUTER_SET game_description_var = 2*(i - 1) + 2 
       OUTER_SPRINT game_name (AT "game_name_var")  OUTER_SPRINT game_description  (AT "game_description_var")
    
       LAF ADD_ACT_FEAT INT_VAR persistent = 0 STR_VAR ability_name game_name game_description  END 
    
       DELETE  ~3ed/Feats/ActivatedAbilities/CM_VS%i%~
    END
END    
