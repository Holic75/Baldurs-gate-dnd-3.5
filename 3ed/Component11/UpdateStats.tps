	//make monsters more powerful
	//+1 thaco +1/3 levels +1/6 levels, +2 ac +1/5 levels, (100+level)% hp, +1/2 APR per 5 levels
	
	 COPY_EXISTING_REGEXP GLOB ~.+\.CRE~ ~override~
		READ_BYTE 0x0234 level
		READ_BYTE 0x0270 allegience 
		SET THAC0_BONUS=1+level/3 + level/6
		SET AC_BONUS=2+level/5
		SET APR_BONUS=0
		SET HP_BONUS= 100 + level //in percent
        SET SAVE_BONUS = level/10
        SET SAVE_BONUS = (SAVE_BONUS>3) ? 3 : SAVE_BONUS
		
		PATCH_IF (allegience=0 OR allegience>5) BEGIN //if not summoned
			PATCH_IF (level>5 AND level<=10) BEGIN
				SET APR_BONUS=6 
			END
			ELSE PATCH_IF (level>10 AND level<=15) BEGIN
				SET APR_BONUS=1
			END
			ELSE PATCH_IF (level>15 AND level<=20) BEGIN
				SET APR_BONUS=7
			END
			ELSE PATCH_IF (level>20) BEGIN
				SET APR_BONUS=2
			END

		
			LPF ADD_CRE_EFFECT INT_VAR opcode=0 timing=1 parameter1=AC_BONUS duration=1 END
			LPF ADD_CRE_EFFECT INT_VAR opcode=278 timing=1 parameter1=THAC0_BONUS duration=1 END
			LPF ADD_CRE_EFFECT INT_VAR opcode=1 timing=1 parameter1=APR_BONUS duration=1 END
			LPF ADD_CRE_EFFECT INT_VAR opcode=18 timing=1 parameter1=HP_BONUS parameter2=2 duration=1 END 
			LPF ADD_CRE_EFFECT INT_VAR opcode=17 timing=1 parameter1=HP_BONUS parameter2=2 duration=1 END
            LPF ADD_CRE_EFFECT INT_VAR opcode=325 timing=1 parameter1=SAVE_BONUS parameter2=0 duration=1 END
		END
		

