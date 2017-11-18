


ACTION_IF (~%GameId%~ STR_EQ ~Bg1~) BEGIN


	COPY_EXISTING ~SW1H13.ITM~ ~override~  //xan's moonblade
		READ_LONG 0x0054 ~id_descr_strref~
		WRITE_BYTE 0x0031 90
		STRING_SET_EVALUATE %id_descr_strref% @1011

END


COPY_EXISTING ~AMUL15.ITM~ ~override~ //shield amulet 
	LPF DELETE_ITEM_EFFECT END
	LPF ADD_ITEM_EFFECT INT_VAR opcode =326 target = 1 power = 1 resist_dispel = 1 STR_VAR resource = ~SPWI114~ END //replace effects with shield application
	
	READ_LONG 0x0054 ~id_descr_strref~
	STRING_SET_EVALUATE %id_descr_strref% @1010

	
	
COPY_EXISTING ~SW1HSEEK.ITM~ ~override~ //seeking sword instead of fixed 3 apr add  +1 apr
	
	LPF ALTER_ITEM_EFFECT INT_VAR check_globals = 1 match_opcode =1 parameter2 = 0 parameter1 = 1 END 
	

	
ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN

	COPY_EXISTING ~MOONBLA.ITM~ ~override~ //moonblade from spell ad +4 bonus to thaco
		WRITE_SHORT 0x0031 90
		LPF ALTER_ITEM_HEADER INT_VAR thac0_bonus = 4 END 
	
	COPY_EXISTING ~BCLAW.ITM~ ~override~ //beast claw (set apr to +1 instaed of fix 2)
		WRITE_SHORT 0x001c 28
		LPF ALTER_ITEM_EFFECT INT_VAR check_globals = 1 match_opcode =1 parameter2 = 0 parameter1 = 1 END
		

	
	COPY_EXISTING ~DECASTA.ITM~ ~override~ 	//decastave make it +1 weapon and drain 2d4 hps (to a total of 1d6+1+2d2 dmg)
		LPF ALTER_ITEM_HEADER INT_VAR thac0_bonus = 1 damage_bonus = 1 END 
		LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 12 match_probability1 = 50 parameter1 = 2 END
		LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 17 match_probability1 = 50 parameter1 = 2 END
		LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 12 match_probability1 = 100 parameter1 = 4 END
		LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 17 match_probability1 = 100 parameter1 = 4 END
END

ACTION_IF (~%GameId%~ STR_EQ ~Bg2~ OR ~%GameId%~ STR_EQ ~Iwd~ ) BEGIN

	COPY_EXISTING ~ENEBLADE.ITM~ ~override~ //energy blades as dart
		WRITE_SHORT 0x0031 106

END


//remap proficiencies

ACTION_DEFINE_ASSOCIATIVE_ARRAY RemapProficienciesItems BEGIN
	
	~SW1HSEEK~ => 90 //seeker sword
	~SHAMMR~ => 97 //spiritual hammer
	~BLAKBLAD~ => 90 //black blade of disaster
	~MELFMET~ => 106 //melf minute meteors
	~FIRESEED~ => 106 //fire seeds
	~PHANBLAD~ => 90 //phantom blade
	~PLYFLIND~ => 99 //flind halberd
	~PLYMSTAR~ => 100 //ogre morning star
	~SHILLE~ => 115 //shillelagh
END

ACTION_DEFINE_ASSOCIATIVE_ARRAY RemapCategoryItems BEGIN //polymorph weapons
	
	~EARTHRN~  => 28
	~FIRERN~ => 28
	~GOLIRO~ => 28
	~MINDFLAY~ => 28
	~WOLFGR~ => 28

END
		
ACTION_PHP_EACH RemapProficienciesItems AS ItemName =>TargetProficiency BEGIN

	COPY_EXISTING ~%ItemName%.ITM~ ~override~
		WRITE_BYTE 0x0031 TargetProficiency
END


ACTION_PHP_EACH RemapCategoryItems AS ItemName =>TargetCategory BEGIN

	COPY_EXISTING ~%ItemName%.ITM~ ~override~
		WRITE_SHORT 0x001c TargetCategory
END
	
	
//spiritual hammer to ranged weapons
OUTER_FOR (i=1;i<=5;i=i+1) BEGIN
	COPY_EXISTING ~SHAMMR.ITM~ ~override/SPIHAMM%i%.ITM~
		LPF ALTER_ITEM_HEADER INT_VAR new_header_type = 2 projectile = 10 bullet = 1 damage_bonus = i+1 range = 20 thac0_bonus = i END //ranged 1d4+1+i dmg + i to thac0
		WRITE_LONG 0x0060 i //enchantment bonus
END



ACTION_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN
	COPY_EXISTING ~BDHELM11.ITM~ ~override~  //bard's hat
		LPF ALTER_ITEM_EFFECT INT_VAR check_globals = 1 match_opcode = 99  opcode =6 parameter1 =2 parameter2 = 0 END
		READ_LONG 0x0054 ~id_descr_strref~
		STRING_SET_EVALUATE %id_descr_strref% @3002
	COPY_EXISTING ~BDHELM11.ITM~ ~override~  //circlet of lost souls
		LPF ALTER_ITEM_EFFECT INT_VAR check_globals = 1 match_opcode = 191  opcode =6 parameter1 =2 parameter2 = 0 END
		READ_LONG 0x0054 ~id_descr_strref~
		STRING_SET_EVALUATE %id_descr_strref% @3003
END

//only description changes

ACTION_IF NOT(~%GameId%~ STR_EQ ~Iwd~) BEGIN

	ACTION_DEFINE_ASSOCIATIVE_ARRAY DescriptionChangeItems BEGIN //ring of fire control
		~RING27~  => 3001
	END
END

ACTION_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN

	ACTION_DEFINE_ASSOCIATIVE_ARRAY DescriptionChangeItems BEGIN 
		~BDSW2H01~ => 3004 
		~OHRHELM1~ => 3005
	END
END

ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN

	ACTION_DEFINE_ASSOCIATIVE_ARRAY DescriptionChangeItems BEGIN 
		~JASPER~ => 3006 
		~ROGUE~ => 3007
		~STAFHMG~ => 3008
		~WANDARM~ => 3009
		~WANDCOR~ =>3010
	END
END

ACTION_PHP_EACH DescriptionChangeItems AS ItemName =>DescrStrRef BEGIN

	COPY_EXISTING ~%ItemName%.ITM~ ~override~
		READ_LONG 0x0054 ~id_descr_strref~
		STRING_SET_EVALUATE %id_descr_strref% (AT "DescrStrRef")
END


//remove requirements from npc items
ACTION_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN

    COPY_EXISTING ~NPCLCK.ITM~ ~override~ //clock of high forest
        WRITE_SHORT 0x0026 0  WRITE_BYTE  0x002a 0  WRITE_BYTE  0x002c 0  WRITE_BYTE  0x002e 0 WRITE_BYTE  0x0030 0 WRITE_SHORT 0x0032 0

    COPY_EXISTING ~NPSTAF.ITM~ ~override~ //staff of high forest
        WRITE_SHORT 0x0026 5  WRITE_BYTE  0x002a 0  WRITE_BYTE  0x002c 0  WRITE_BYTE  0x002e 0 WRITE_BYTE  0x0030 0 WRITE_SHORT 0x0032 0
        
    COPY_EXISTING~NPMISC1.ITM~ ~override~ //jan items
        WRITE_BYTE  0x002c 0
        LPF REMOVE_SUBSTRING INT_VAR  strref_offset=0x0050   substring_to_remove_ref = 4101 END
    COPY_EXISTING~NPMISC2.ITM~ ~override~ 
        WRITE_BYTE  0x002c 0
        LPF REMOVE_SUBSTRING INT_VAR  strref_offset=0x0054   substring_to_remove_ref = 4101 END
        
    COPY_EXISTING ~NPSHLD.ITM~ ~override~ //anomen shield
         WRITE_SHORT 0x0026 12  WRITE_SHORT 0x0032 0  
         
 
     COPY_EXISTING ~NPSW03.ITM~ ~override~ //keldorn sword 
        WRITE_SHORT 0x0026 14  WRITE_BYTE  0x002a 0  WRITE_BYTE  0x002c 0  WRITE_BYTE  0x002e 0 WRITE_BYTE  0x0030 0 WRITE_SHORT 0x0032 0
        LPF REPLACE_SUBSTRING INT_VAR  strref_offset=0x0054   substring_to_replace_ref = 4102 new_substring_ref = 4103 END
        
     COPY_EXISTING ~NPSW04.ITM~ ~override~ //valygar katana
        WRITE_SHORT 0x0026 6  WRITE_BYTE  0x002a 0  WRITE_BYTE  0x002c 0  WRITE_BYTE  0x002e 0 WRITE_BYTE  0x0030 0 WRITE_SHORT 0x0032 0
        LPF REPLACE_SUBSTRING INT_VAR  strref_offset=0x0054   substring_to_replace_ref = 4104 new_substring_ref = 4105 END
END
