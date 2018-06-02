	
    OUTER_SET SPONT_DURATION = 6
    //application of heal/harm depeding on alignement or spell burning (ftr/cleric) or spell channeling (ftr/thf)
	COPY ~3ed/SpontaneousCasting/HealHarm/GSPCAST.spl~ ~override~
	COPY ~3ed/SpontaneousCasting/HealHarm/rgspcast.spl~ ~override~
	COPY ~3ed/SpontaneousCasting/HealHarm/rgspcast.bam~ ~override~
    COPY ~3ed/SpontaneousCasting/HealHarm/rgspheal.eff~ ~override~
	COPY ~3ed/SpontaneousCasting/HealHarm/rgspharm.eff~ ~override~
	//Spontaneous Heal
	COPY ~3ed/SpontaneousCasting/HealHarm/rgspheal.bam~ ~override~
	COPY ~3ed/SpontaneousCasting/HealHarm/rgspheal.spl~ ~override~
		SAY NAME1 @1
		SAY UNIDENTIFIED_DESC @2

	/////////////////////////////
	//Spontaneous Harm (it is different from everything else since we need to increase level depending on caster's wisdom)
	COPY ~3ed/SpontaneousCasting/HealHarm/rgspharm.bam~ ~override~
	COPY ~3ed/SpontaneousCasting/HealHarm/rgspharm.spl~ ~override~
    
        LPF ALTER_SPELL_EFFECT INT_VAR check_globals = 1 duration_high = SPONT_DURATION END
        FOR (i=0;i<8;i=i+1) BEGIN
            SPRINT resource EVALUATE_BUFFER ~spharm%i%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode =146 target = 1 parameter2 = 1 insert_point=0 STR_VAR resource END
        END       
        SAY NAME1 @3
		SAY UNIDENTIFIED_DESC @4
        
     OUTER_FOR (i=0;i<8;i=i+1) BEGIN
        COPY ~3ed/SpontaneousCasting/HealHarm/spharm0.spl~ ~override/spharm%i%.spl~
            PATCH_IF (i>0) BEGIN
                SPRINT resource EVALUATE_BUFFER ~spharm%i%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode =318 target = 1 parameter2 = 131 parameter1 = 10+2*i insert_point = 0 STR_VAR resource END
            END
     END
	

	//////////////////////////////
	//Spontaneous Summon
	COPY ~3ed/SpontaneousCasting/Summon/rgsummon.bam~ ~override~
	COPY ~3ed/SpontaneousCasting/Summon/rgsummon.vvc~ ~override~
	COPY ~3ed/SpontaneousCasting/Summon/rgspsumm.bam~ ~override~
	COPY ~3ed/SpontaneousCasting/Summon/RGSPSUMM.EFF~ ~override~
	COPY ~3ed/SpontaneousCasting/Summon/rgspsumm.spl~ ~override~
		SAY NAME1 @5
		SAY UNIDENTIFIED_DESC @6
	
	

	//spontaneous battlecasting
	COPY ~3ed/SpontaneousCasting/BattleCasting/BAM~ ~override~ //bam icons
	COPY ~3ed/SpontaneousCasting/BattleCasting/RGSPBCST.EFF~ ~override~ //mask for attribution
	COPY ~3ed/SpontaneousCasting/BattleCasting/RGSPBCST.SPL~ ~override~ //spontaneous conversion to battle casting innate ability
		SPRINT icon EVALUATE_BUFFER ~BTLCTNGB~
		LPF ALTER_SPELL_HEADER STR_VAR icon END
		WRITE_ASCII 0x003a ~BTLCTNGC~ #8
		SAY NAME1 @7
		SAY UNIDENTIFIED_DESC @8
	
	OUTER_FOR (i=1;i<=7;i=i+1) BEGIN
		COPY ~3ed/SpontaneousCasting/BattleCasting/BCST.SPL~ ~override/BCST%i%.SPL~
			WRITE_LONG 0x0034 i //spell level
			LPF ALTER_SPELL_EFFECT INT_VAR power=i END
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=73 parameter1=(i+1)/2 END //damage bonus
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=278 parameter1=(i+1)/2 END //thac0
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=0 parameter1=i/2 END //ac
			FOR (k=1;k<=7;k=k+1) BEGIN
				SPRINT resource EVALUATE_BUFFER ~BCST%k%~
				LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 power=i duration=1 timing=0 STR_VAR resource END //remove previous casts
			END
			SPRINT icon EVALUATE_BUFFER ~BTLCTN%i%B~
			LPF ALTER_SPELL_HEADER STR_VAR icon END
			WRITE_ASCII 0x003a ~BTLCTN%i%C~ #8
			SET SpellName=8 + i
			SAY NAME1 (AT "SpellName")
	END
	// spell channeling 
	COPY ~3ed/SpontaneousCasting/ChannelStrike/BAM~ ~override~ //bam icons
	COPY ~3ed/SpontaneousCasting/ChannelStrike/RGSPCSTK.EFF~ ~override~ //mask for attribution
	COPY ~3ed/SpontaneousCasting/ChannelStrike/RGSPCSTK.SPL~ ~override~ //spontaneous conversion to spell channeling
			SPRINT icon EVALUATE_BUFFER ~CHSTRKB~
			LPF ALTER_SPELL_HEADER STR_VAR icon END
			WRITE_ASCII 0x003a ~CHSTRKC~ #8
			SAY NAME1 @16
			SAY UNIDENTIFIED_DESC @17
	
	OUTER_FOR (i=1;i<=7;i=i+1) BEGIN
		COPY ~3ed/SpontaneousCasting/ChannelStrike/CHSTKE.SPL~ ~override/CHSTKE%i%.SPL~
			WRITE_LONG 0x0034 i //spell level
			LPF ALTER_SPELL_EFFECT INT_VAR power=i END
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=12 dicenumber=i END //number of 1d4 dices
			
		COPY ~3ed/SpontaneousCasting/ChannelStrike/CHSTK.SPL~ ~override/CHSTK%i%.SPL~
			WRITE_LONG 0x0034 i //spell level
			LPF ALTER_SPELL_EFFECT INT_VAR power=i END
			SPRINT resource EVALUATE_BUFFER ~CHSTKE%i%~
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=340 STR_VAR resource END //backstab hit effect

			FOR (k=1;k<=7;k=k+1) BEGIN
				SPRINT resource EVALUATE_BUFFER ~CHSTK%k%~
				LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 power=i duration=1 timing=0 STR_VAR resource END //remove previous casts
			END
			SPRINT icon EVALUATE_BUFFER ~CSTRK%i%B~
			LPF ALTER_SPELL_HEADER STR_VAR icon END
			WRITE_ASCII 0x003a ~CSTRK%i%C~ #8
			SET SpellName=17 + i
			SAY NAME1 (AT "SpellName")
	END
    
    LAF UPDATE_SP_CASTING_LEVEL INT_VAR target_caster_level=cure_level max_levels=30 STR_VAR ability_name=~rgspheal~ END
	LAF UPDATE_SP_CASTING_LEVEL INT_VAR target_caster_level=summ_level max_levels=30 STR_VAR ability_name=~rgspsumm~ END
	LAF UPDATE_SP_CASTING_LEVEL INT_VAR target_caster_level=bcst_level max_levels=30 STR_VAR ability_name=~rgspbcst~ END
	LAF UPDATE_SP_CASTING_LEVEL INT_VAR target_caster_level=cstk_level max_levels=30 STR_VAR ability_name=~rgspcstk~ END
        
    OUTER_FOR (i=0;i<8;i=i+1) BEGIN
        OUTER_SPRINT ability_name EVALUATE_BUFFER ~spharm%i%~
        LAF UPDATE_SP_CASTING_LEVEL INT_VAR target_caster_level=harm_level+i max_levels=30 STR_VAR ability_name END
    END
    