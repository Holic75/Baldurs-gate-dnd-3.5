

COPY  ~3ed/EnemyScripts/%GameId%~ ~override~

ACTION_IF (~%GameId%~ STR_EQ ~Bg1~) BEGIN
	   
    COPY_EXISTING ~Lendar.CRE~ ~override~
		WRITE_ASCII 0x0250 ~LENDARN~ #8
		WRITE_ASCII 0x0258 ~MAGE4~ #8
		
		
	COPY_EXISTING ~Natash.CRE~ ~override~
		WRITE_ASCII 0x0250 ~NATASH~ #8
		WRITE_ASCII 0x0258 ~MAGE5~ #8
		
	COPY_EXISTING ~Hareis.CRE~ ~override~
		WRITE_ASCII 0x0250 ~HAREIS~ #8
		WRITE_ASCII 0x0258 ~MAGE4~ #8
		
	COPY_EXISTING ~OGREMA03.CRE~ ~override~
		WRITE_ASCII 0x0250 ~OGREMA03~ #8



END
