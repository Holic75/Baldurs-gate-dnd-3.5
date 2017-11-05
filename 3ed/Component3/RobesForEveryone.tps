

	ACTION_DEFINE_ASSOCIATIVE_ARRAY RobesForEveryone BEGIN
		~CLCK09~ =>1004
		~CLCK10~ =>1005
		~CLCK11~ =>1006
		~CLCK12~ =>1007
		~CLCK13~ =>1008
		~CLCK14~ =>1009	
	END
	

	ACTION_PHP_EACH RobesForEveryone AS RobeName => DescrStrRef BEGIN
		COPY_EXISTING ~%RobeName%.ITM~ ~override~
			WRITE_LONG 0x001e 0  //allow all calsses to use robe
			WRITE_BYTE 0x0029 0  //allow barbarians to use robe	

			READ_LONG 0x0050 ~descr_strref~
						
			READ_LONG 0x0054 ~id_descr_strref~
			
			STRING_SET_EVALUATE %descr_strref% @1003
			STRING_SET_EVALUATE %id_descr_strref% (AT "DescrStrRef")						
	END