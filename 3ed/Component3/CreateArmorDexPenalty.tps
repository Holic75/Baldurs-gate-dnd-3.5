

//making dex penalty depending on dex value and armor dex limit
COPY ~3ed/Armor~ ~override~

OUTER_FOR (k=1;k<=9;k=k+1) BEGIN
    COPY_EXISTING ~ARMACPE.SPL~ ~override/ARMACP%k%.SPL~
        SPRINT resource EVALUATE_BUFFER ~ARMACP%k%~
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 2 duration = 1 insert_point = 0 STR_VAR resource END //remove effects

END

OUTER_FOR (i=10;i<=20;i+=2) BEGIN
	
	COPY_EXISTING ~ARMDEX.EFF~ ~override\ARMDEX%i%.EFF~
		WRITE_LONG 0x001c 0
		WRITE_LONG 0x0020 0
		WRITE_EVALUATED_ASCII 0x0030 ~ARMDEX%i%~
		
		
		COPY_EXISTING ~ARMDEX.SPL~ ~override\ARMDEX%i%.SPL~	
            SET k=1
			FOR (j=i+2;j<=25;j=j+2) BEGIN
                SPRINT resource EVALUATE_BUFFER ~ARMACP%k%~
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 326 target = 2 duration = 1 parameter1 = j parameter2 = 122 STR_VAR resource  END //ac penalty
                k = k + 1
			END
            
END



//making thief skill penalty depending on armor
// 10 - studded leather, 20 - hide, 30 - chain ,40 - splint , 50 - plate, 60 - full plate
OUTER_FOR (k=1;k<=6;k=k+1) BEGIN
    COPY_EXISTING ~ARMSKL.SPL~ ~override/ARMSKL%k%.SPL~
       SPRINT resource EVALUATE_BUFFER ~ARMSKL%k%~ 
       LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 321 STR_VAR resource END //remove itself
       SET parameter1 = 0 - 10
       LPF ALTER_SPELL_EFFECT_EX INT_VAR match_parameter1 = 100 parameter1 END // set penalty to all skills -10
       
    COPY_EXISTING ~ARMSKL.EFF~ ~override/ARMSKL%k%.EFF~
        WRITE_EVALUATED_ASCII 0x0030 ~ARMSKL%k%~
END
