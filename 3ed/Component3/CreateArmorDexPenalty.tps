

//making dex penalty depending on dex value and armor dex limit
COPY ~3ed/Armor~ ~override~


OUTER_FOR (i=10;i<=20;i+=2) BEGIN
	
	COPY_EXISTING ~ARMDEX.EFF~ ~override\ARMDEX%i%.EFF~
		WRITE_LONG 0x001c 0
		WRITE_LONG 0x0020 0
		WRITE_EVALUATED_ASCII 0x0030 ~ARMDEX%i%~
		
		
		COPY_EXISTING ~ARMDEX.SPL~ ~override\ARMDEX%i%.SPL~	
		LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 2 duration = 1 STR_VAR resource=~ARMACPE~ END //ac penalty
			FOR (j=i+2;j<=25;j=j+2) BEGIN								
				LPF ADD_SPELL_EFFECT INT_VAR opcode = 326 target = 2 duration = 1 parameter1 = j parameter2 = 122 STR_VAR resource=~ARMACPE~  END //ac penalty
			END				
END