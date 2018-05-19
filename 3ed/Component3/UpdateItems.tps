


ACTION_IF (~%GameId%~ STR_EQ ~Bg1~) BEGIN


	COPY_EXISTING ~SW1H13.ITM~ ~override~  //xan's moonblade
		READ_LONG 0x0054 ~id_descr_strref~
		WRITE_BYTE 0x0031 90
		STRING_SET_EVALUATE %id_descr_strref% @1011
        
        
    COPY_EXISTING ~HALB13.ITM~ ~override~  //chelsey crusher set attack to 1 make only ignore bonus class attacks
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 321 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONA~ END
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 206 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONA~ END 
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 321 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONB~ END
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 206 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONB~ END 
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 321 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONC~ END
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 206 target = 1 duration = 1 timing = 2 STR_VAR resource = ~APRBONC~ END 
        LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 1 parameter2 = 1 END  //set attack to value (instead of final set)

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

ACTION_IF (~%GameId%~ STR_EQ ~Iwd~ ) BEGIN
    ACTION_DEFINE_ASSOCIATIVE_ARRAY RemapProficienciesItems BEGIN
        ~SHILLEL~ => 115 //iwd shillelagh
    END
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





//only description changes
ACTION_IF (IncludesSod) BEGIN

	ACTION_DEFINE_ASSOCIATIVE_ARRAY DescriptionChangeItems BEGIN 
		~BDSW2H01~ => 3004 //dragon blade +3
	END
END

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

//change shillelagh dmg to 2d6 +1
COPY_EXISTING_REGEXP ~SHILLE.*\.ITM~ ~override~ 
    LPF ALTER_ITEM_HEADER INT_VAR dicesize = 6 damage_bonus = 1 END
    READ_LONG 0x0060 1 //enchantment bonus
    
    
    

ACTION_IF (IncludesSod) BEGIN
    COPY_EXISTING ~bdblun07.ITM~ ~override~//backwhacker +2 change backstab to sneak attack
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = 5001  new_substring_ref = 5002 END
       
    COPY_EXISTING ~bdsw1h25.ITM~ ~override~//spell breaker - only effects iquisitors
        LPF DELETE_EFFECT INT_VAR check_globals = 1 match_opcode = 177 match_parameter1 = 16386 END 
		READ_LONG 0x0054 ~id_descr_strref~
		STRING_SET_EVALUATE %id_descr_strref% @5101

    COPY_EXISTING ~bdsw1h21.ITM~ ~override~//vexation + 2
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = 5001  new_substring_ref = 5002 END

    COPY_EXISTING ~bdshld02.ITM~ ~override~//suncatcher +2 change spell saves to breath weapon saves
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = 5003  new_substring_ref = 5004 END
    COPY_EXISTING ~bdshld02.SPL~ ~override~
        LPF ALTER_SPELL_EFFECT_EX INT_VAR match_savingthrow = 1 savingthrow = 2 END
        
    COPY_EXISTING ~bdshld03.ITM~ ~override~//sheild of egons replace turn undead with charisma bonus (+2 -> +4)
        LPF ALTER_ITEM_EFFECT INT_VAR check_globals = 1 match_opcode = 323 new_opcode = 6 parameter1 = 2 END
		READ_LONG 0x0054 ~id_descr_strref~
		STRING_SET_EVALUATE %id_descr_strref% @5102        
    COPY_EXISTING ~bdshld03.EFF~ ~override~
        LPF ALTER_EFF INT_VAR opcode = 6 parameter1 = 2 END
        
    
    COPY_EXISTING ~bdclck06.ITM~ ~override~  //replace +1 caster level with +2 cha/int 
        LPF ALTER_ITEM_EFFECT INT_VAR check_globals = 1 match_opcode = 191 new_opcode = 6 parameter1 = 2 END
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode=19 target=1 timing=2 parameter1 = 2 END
        READ_LONG 0x0054 ~id_descr_strref~
		STRING_SET_EVALUATE %id_descr_strref% @5103 
     
    COPY_EXISTING ~bdboot03.ITM~ ~override~  //replace wizardslayer with hexblade
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = 5009  new_substring_ref = 5010 END
        
    COPY_EXISTING ~bdbrac05.ITM~ ~override~  //replace backstab with +4 wisdom
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = 5011  new_substring_ref = 5012 END       
    COPY_EXISTING ~BDBRAC5A.EFF~ ~override~
        LPF ALTER_EFF INT_VAR opcode = 49 parameter1 = 4 END
        
    COPY_EXISTING ~bdamul07.ITM~ ~override~  //replace +1 caster level with +2 wis 
        LPF ALTER_ITEM_EFFECT INT_VAR check_globals = 1 match_opcode = 191 new_opcode = 49 parameter1 = 2 parameter2 = 0 END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = 5013  new_substring_ref = 5014 END
        
    COPY_EXISTING ~bdbelt02.ITM~ ~override~ //replace +2 offhand thaco with +1 overall thaco
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = 5015  new_substring_ref = 5016 END
    COPY_EXISTING ~BDBELT02.EFF~ ~override~
        LPF ALTER_EFF INT_VAR opcode = 278 parameter1 = 1 END

    COPY_EXISTING ~SHLD07P.ITM~ ~override~//sartessa vengeance description fix
		READ_LONG 0x0054 ~id_descr_strref~
		STRING_SET_EVALUATE %id_descr_strref% @5104         

    COPY_EXISTING ~bdbrd01.ITM~ ~override~ //remove 13 wis requirement from The Forest Queen's Benediction
        WRITE_BYTE 0x002e 0
END    

ACTION_IF (~%GameId%~ STR_EQ ~Bg2~ OR IncludesSod) BEGIN
	COPY_EXISTING ~BDHELM11.ITM~ ~override~  //bard's hat
		LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 99  opcode =6 parameter1 =2 parameter2 = 0 END
		READ_LONG 0x0054 ~id_descr_strref~
		STRING_SET_EVALUATE %id_descr_strref% @3002
	COPY_EXISTING ~BDHELM16.ITM~ ~override~  //circlet of lost souls
		LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 191  opcode =6 parameter1 =2 parameter2 = 0 END
		READ_LONG 0x0054 ~id_descr_strref~
		STRING_SET_EVALUATE %id_descr_strref% @3003
END

//update staff of woodlands  and potion of barkskin(proper barkskin effect)
ACTION_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN
    COPY_EXISTING ~STAF14.ITM~ ~override~
        LPF ALTER_ITEM_EFFECT  INT_VAR check_globals = 1 match_opcode =  0 parameter1 = 3 parameter2 = 0 END //+3 AC BONUS
        LPF ADD_ITEM_EQEFFECT INT_VAR opcode=321 target=1 duration=1 timing=2 STR_VAR resource=~SPPR202~ END
		LPF ADD_ITEM_EQEFFECT INT_VAR opcode=206 target=1 duration=1 timing=2 STR_VAR resource=~SPPR202~ END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = 1012  new_substring_ref = 1013 END
    
    COPY_EXISTING ~OHBPTN01.ITM~ ~override~
        LPF DELETE_EFFECT INT_VAR check_headers = 1 END
        LPF ADD_ITEM_EFFECT INT_VAR opcode = 326 target = 2 duration = 1  STR_VAR resource = ~SPPR202~ END
        LPF REPLACE_SUBSTRING INT_VAR strref_offset=0x0054 substring_to_replace_ref = 1014  new_substring_ref = 1015 END	
        
    //make edwin amulet give only one bonus spell per level
    COPY_EXISTING ~MISC89.ITM~ ~override~
        LPF ALTER_ITEM_EFFECT INT_VAR  check_globals = 1 parameter1 = 1 END
		READ_LONG 0x0050 ~id_descr_strref~
		STRING_SET_EVALUATE %id_descr_strref% @1016
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
        
//correct description of DarkSteelShield +4
    COPY_EXISTING ~SHLD31.ITM~ ~override~
        LPF REPLACE_SUBSTRING INT_VAR  strref_offset=0x0054   substring_to_replace_ref = 501 new_substring_ref = 50 END
        
//yoshimo's katana -> yoshimo's wakizhashi
COPY_EXISTING ~NPSW02.ITM~ ~override~ 
        LPF UPDATE_WEAPON_DMG INT_VAR match_dice_number = 1 match_dice_size = 10 target_dice_number = 1 target_dice_size = 8 END 
        LPF SET_ITEM_USABILITY  STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~assassin~ END
        LPF SET_ITEM_USABILITY  STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~swashbuckler~ END
        
        WRITE_SHORT 0x0022 0x3153 //animation
        WRITE_BYTE 0x0031 0x5f
        READ_LONG 0x000c ~id_name_strref~		
		READ_LONG 0x0054 ~id_descr_strref~
        STRING_SET_EVALUATE %id_name_strref% @54
		STRING_SET_EVALUATE %id_descr_strref% @55
END
