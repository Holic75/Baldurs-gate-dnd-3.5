	INCLUDE ~3ed/ADD_SMITE_EVIL_BASE.tph~
	INCLUDE ~3ed/ADD_SMITE_EVIL_VARIATION.tph~


//--------------------- paladin ----------------------------------------
	//saving throws
	COPY ~3ed/Classes/Paladin/PDNSVCR.SPL~ ~override~//correction for paladin saves	
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=40 d_level=1 add_at_level1=1 STR_VAR clab=~CLABPA+.*\.2DA~  caption=~PDNSVCR~ END	//-2 to saves (corrected by chas saves application)
	LAF ADD_BONUS_FEATS INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 STR_VAR clab=~CLABPA+.*\.2DA~  caption=~CHASAVFT~ END // chas saves
	//lay on hands		
	COPY ~3ed/Classes/Paladin/LayOnHands~ ~override~
	OUTER_FOR (player_id=1;player_id<=6;player_id=player_id + 1) BEGIN //script to update number of lay on hands uses depending on charisma
		EXTEND_TOP ~BALDUR.BCS~ ~3ed/Classes/Paladin/PALADIN.baf~
			EVALUATE_BUFFER			
	END

		
	COPY_EXISTING ~GVABSHLT.SPL~ ~override~
		LPF ALTER_SPELL_EFFECT STR_VAR resource = ~SPCL211~ END // lay on hands   !!!!!!!!!!!!!!!!! same for all games
	
	COPY_EXISTING ~GVLAYHDS.SPL~ ~override~
		LPF ALTER_SPELL_EFFECT STR_VAR resource = ~SPCL102~ END //absorb health   !!!!!!!!!!!!!!!!! same for all games
	//smite evil
	LAF ADD_SMITE_EVIL_BASE INT_VAR max_lvl=30 END
	
	LAF ADD_SMITE_EVIL_VARIATION INT_VAR name_ref = 001 descr_ref =002 par1 = 0 par2 =37 STR_VAR SmiteName=~SMTEVL~ END //smite evil
	LAF ADD_SMITE_EVIL_VARIATION INT_VAR name_ref = 003 descr_ref =004 par1 = 0 par2 =1 STR_VAR SmiteName=~SMTUND~  END //smite undead
	LAF ADD_SMITE_EVIL_VARIATION INT_VAR name_ref = 005 descr_ref =006 par1 = 0 par2 =36 STR_VAR SmiteName=~SMTGUD~  END //smite good
	LAF ADD_SMITE_EVIL_VARIATION INT_VAR name_ref = 007 descr_ref =008 par1 = 202 par2 =105 STR_VAR SmiteName=~SMTMAG~  END //smite mage
			
	
	//-------------------------wizardslayer----------------------
	//mr bonus (25%+2/level till level 30)
	COPY ~3ed/Classes/Wizardslayer~ ~override~
	COPY_EXISTING ~WZSLRBR.EFF~ ~override~
		WRITE_ASCII 0x0030 ~SPWI513~ #8 // breach on hit   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! same for all games
	//-------------------------------monk-------------------------
	//(ac bonus (already in 2DA), wis ac bonus, flurry of blows)
	COPY ~3ed/Classes/Monk~ ~override~
    COPY_EXISTING_REGEXP GLOB ~CLABMO+.*\.2DA~ ~override~
		COUNT_2DA_ROWS 20 "nrows"
		INSERT_2DA_ROW nrows 20
			~MNKFLRABI AP_MKFLR1FT **** **** **** AP_MKFLR2FT **** **** **** AP_MKFLR3FT **** AP_MKFLR4FT **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** ****~
		INSERT_2DA_ROW nrows 20
			~WISDACABI AP_WISDACFT **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** ****~				
	
	// fist damage/ enchantment 
	WITH_TRA ~%LANGUAGE%\monk.tra~ BEGIN
		
		//OUTER_SET  fist_0=RESOLVE_STR_REF (@001)
		OUTER_SET  fist_1=RESOLVE_STR_REF (@002)
		OUTER_SET  fist_2=RESOLVE_STR_REF (@003)
		OUTER_SET  fist_3=RESOLVE_STR_REF (@004)
		OUTER_SET  fist_4=RESOLVE_STR_REF (@005)
		OUTER_SET  fist_5=RESOLVE_STR_REF (@006)
		OUTER_SET  fist_6=RESOLVE_STR_REF (@007)
		
		COPY_EXISTING  ~MFIST2.ITM~ ~override~		
			WRITE_LONG 0x0008 fist_1
			WRITE_LONG 0x000c fist_1
		COPY_EXISTING  ~MFIST3.ITM~ ~override~		
			WRITE_LONG 0x0008 fist_2
			WRITE_LONG 0x000c fist_2
		COPY_EXISTING  ~MFIST4.ITM~ ~override~		
			WRITE_LONG 0x0008 fist_3
			WRITE_LONG 0x000c fist_3		
		COPY_EXISTING  ~MFIST5.ITM~ ~override~		
			WRITE_LONG 0x0008 fist_4
			WRITE_LONG 0x000c fist_4
		COPY_EXISTING  ~MFIST6.ITM~ ~override~		
			WRITE_LONG 0x0008 fist_5
			WRITE_LONG 0x000c fist_5		
		COPY_EXISTING  ~MFIST7.ITM~ ~override~		
			WRITE_LONG 0x0008 fist_5
			WRITE_LONG 0x000c fist_5
		COPY_EXISTING  ~MFIST8.ITM~ ~override~	
			WRITE_LONG 0x0008 fist_6
			WRITE_LONG 0x000c fist_6
	END
	//---------------------------- ninja (bounty hunter->ninja)---------------------------------------
	WITH_TRA ~%LANGUAGE%\ninja.tra~ BEGIN
		COPY ~3ed/Classes/Ninja~ ~override~ //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! //spells in the list seem to be the same for all games
		
			
		COPY_EXISTING ~NinjaAbilitiesMap.2DA~ ~override~
			COUNT_2DA_ROWS 3 n_rows
			FOR (i=0;i<n_rows;i=i+1) BEGIN
				READ_2DA_ENTRY %i% 1 3 ninja_spell_name //school name 
				READ_2DA_ENTRY %i% 2 3 original_spell_name //school description 				
				DEFINE_ASSOCIATIVE_ARRAY NinjaSpells BEGIN "%ninja_spell_name%" => "%original_spell_name%" END
			END
		
		
		ACTION_PHP_EACH NinjaSpells AS ninja_spell_name =>original_spell_name BEGIN
			COPY_EXISTING ~%original_spell_name%.SPL~ ~override/%ninja_spell_name%.SPL~ 
				SET header_type = 0 - 1
				LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_type=4 END
				FOR (i=2;i<=30;i=i+1) BEGIN
					LPF DELETE_SPELL_HEADER INT_VAR min_level = i header_type END
				END
				
				LPF ALTER_SPELL_EFFECT INT_VAR duration_high = 10 END //set duration to 10 seconds
                LPF ALTER_SPELL_HEADER INT_VAR target = 5 speed=1 END //set target to self and min speed
		END
			
		COPY_EXISTING ~KIPWR.SPL~ ~override~
			SAY NAME1 @001
			SAY UNIDENTIFIED_DESC @002
	
		COPY_EXISTING ~GV_KIPW.SPL~ ~override~
			FOR (i=3;i<30;i=i+2) BEGIN
				SET copy_header = (i - 1)/2
				LPF ADD_SPELL_HEADER INT_VAR  insert_point=(i + 1)/2 copy_header END
				LPF ALTER_SPELL_HEADER INT_VAR  header = (i + 1)/2 min_level = i END
				LPF CLONE_EFFECT INT_VAR header = (i - 1)/2 match_opcode = 326 match_parameter2 = 0  multi_match = 1 END
			END	
			
		COPY_EXISTING_REGEXP GLOB ~CLABTH03\.2DA~ ~override~
			COUNT_2DA_ROWS 20 "nrows"
			INSERT_2DA_ROW nrows 20
				~WISDACABI AP_WISDACFT **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** ****~				
	
	
		OUTER_FOR (player_id=1;player_id<=6;player_id=player_id + 1) BEGIN
			EXTEND_TOP ~BALDUR.BCS~ ~override/NINJA.baf~
				EVALUATE_BUFFER			
		END
	END
	
	//------------------------------Druid shapeshifts-----------------------------------------		
	WITH_TRA ~%LANGUAGE%\druid_shapeshift.tra~ BEGIN   
		//shapeshifts that can use items
		COPY ~3ed/Classes/Druid/Polymorph2DA~ ~override~ //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		COPY ~3ed/Classes/Druid/FormsWeapons~ ~override~
		COPY_EXISTING ~DRDPOLY.SPL~ ~override~ //standard shapeshift
			SAY NAME1 @001
			SAY UNIDENTIFIED_DESC @002
		
		COPY_EXISTING ~PL_WRWF.SPL~ ~override~ //werewolf
			SAY NAME1 @003
			SAY UNIDENTIFIED_DESC @004
		//elementals transform names
		
		ACTION_DEFINE_ASSOCIATIVE_ARRAY DruidPolymorphStrings BEGIN
			~PL_FIRL.SPL~ => 005
			~PL_EARL.SPL~ => 006
			~PL_FIRH.SPL~ => 007
			~PL_EARH.SPL~ => 008
			~PL_BRBL.SPL~ => 009
			~PL_BRBR.SPL~ => 010
			~PL_WOLF.SPL~ => 011
			~PL_SALA.SPL~ => 012
			~PL_WYVN.SPL~ => 013
			~PL_SPDR.SPL~ => 014
		END
		
		
		OUTER_SET  AttackStrRef=RESOLVE_STR_REF (@017)
		
		ACTION_DEFINE_ASSOCIATIVE_ARRAY DruidWeaponStrings BEGIN
			~WP_FIRL.ITM~ => 017
			~WP_EARL.ITM~ => 017
			~WP_FIRH.ITM~ => 017
			~WP_EARH.ITM~ => 017
			~WP_BRBL.ITM~ => 017
			~WP_BRBR.ITM~ => 017
			~WP_WOLF.ITM~ => 017
			~WP_SALA.ITM~ => 017
			~WP_WYVN.ITM~ => 017
			~WP_SPDR.ITM~ => 017	
			~WP_WRWF.ITM~ => 017
			~WP_WRWFG.ITM~ => 017			
		END
			
		COPY_EXISTING ~NRFRM.SPL~ ~override~ 
			SAY NAME1 @015
			SAY UNIDENTIFIED_DESC @016
			
		ACTION_PHP_EACH DruidPolymorphStrings AS SpellName =>SpellStr BEGIN
			
			COPY_EXISTING ~%SpellName%~  ~override~
				SAY NAME1 (AT "SpellStr")			
		END
		
		ACTION_PHP_EACH DruidWeaponsStrings AS WeaponName =>WeaponStr BEGIN
			
			COPY_EXISTING ~%WeaponName%~  ~override~
				WRITE_LONG 0x0008 AttackStrRef
				WRITE_LONG 0x000c AttackStrRef
		END
			
			
					
	END	
	//--------------------- assasin poison weapon progression change -------------------------- (spells will be done later in spells section)
    ACTION_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
        COPY_EXISTING ~bdpweapn.spl~ ~override~
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 4 insert_point =5 END
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 4 insert_point =6 END
		
            FOR (i=2;i<=6;i=i+i) BEGIN
                LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = (i - 1) *4 END
            END
		
            LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 5 match_opcode = 12 parameter1 = 12 END
            SET savebonus = 0 - 4
            LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 5 match_opcode = 25 duration = 24 savebonus  END
            LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 5 match_opcode = 142 duration = 24 savebonus  END
            SET savebonus = 0 - 5
            LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 6 match_opcode = 12 parameter1 = 16 END
            LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 5 match_opcode = 25 duration = 24 parameter1 = 2 savebonus  END
            LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 5 match_opcode = 142 duration = 24 savebonus  END	
		
		
        WITH_TRA ~%LANGUAGE%\ability_changes.tra~ BEGIN  
            COPY_EXISTING ~SPCL423.SPL~ ~override~ //update description of poison weapon
                READ_LONG 0x0050 ~descr_strref~
                STRING_SET_EVALUATE %descr_strref% @001
        END
    END
	// ---------------------------------------- shadowdancer special abilities (mislead and shadow form)
	COPY ~3ed/Classes/Shadowdancer~ ~override~
	
	COPY_EXISTING ~SPWI607.SPL~ ~override~
		//spell starts from lvl 12 we need to start it from level 9
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 insert_point=1 END
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 insert_point=1 END
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 insert_point=1 END
		
		FOR (i=1;i<=4;i=i+1) BEGIN
			SET lvl = 1+ (7+i)*(i>1)
			LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = lvl END
			LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high = (i + 8)*6 END
		END
	
	
	COPY_EXISTING ~SPWI607.SPL~ ~override\SH_MSLD.SPL~
		LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_type = 4 END //make it innate
	
	//add shadow form if it is not there
	ACTION_IF NOT (~%GameId%~ STR_EQ ~Bg2~) BEGIN
		WITH_TRA ~%LANGUAGE%\shadowdancer.tra~ BEGIN
			COPY_EXISTING ~spcl938.SPL~ ~override~
				SAY NAME1 @001
				SAY UNIDENTIFIED_DESC @002
		END
	END
	//---------------------------------------thief traps at lvls 1,10,15,20
	COPY_EXISTING ~SPCL411.spl~ ~override~
		FOR (i=2;i<=4;i=i+1) BEGIN
			SET lvl = 1+ (7+i)*(i>1)
			LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i*5 END
		END
		
	WITH_TRA ~%LANGUAGE%\ability_changes.tra~ BEGIN //change set snares description
		COPY_EXISTING ~SPCL412.SPL~ ~override~
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @002
			
		COPY_EXISTING ~SPCL414.SPL~ ~override~
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @003
	END		
		
	COPY_EXISTING ~SPCL415.spl~ ~override~
		FOR (i=2;i<=4;i=i+1) BEGIN
			SET lvl = 1+ (7+i)*(i>1)
			LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i*5 END
		END
	
	//--------------------------------------------------//
	//barbarian rage update (tireless, mighty) 
	
WITH_TRA ~%LANGUAGE%\ability_changes.tra~ BEGIN  
	COPY ~3ed/Classes/Barbarian/Rage/BRBFTG.spl~ ~override~  //after rage fatigue
	
	COPY_EXISTING ~SPCL152.SPL~ ~override/BRBRGE.spl~   //rage itself
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
		
			LPF ADD_SPELL_EFFECT INT_VAR opcode=146 target=1 power=0 parameter1=1 parameter2=1 timing=4 resist_dispel=2 duration=60 probability1=100 header=1 STR_VAR resource=~BRBFTG~ END
			
		LPF ALTER_SPELL_HEADER INT_VAR header = 2 min_level = 11 END
			LPF ALTER_SPELL_EFFECT INT_VAR header = 2 match_opcode = 10 parameter1 = 6 END //constitution bonus
			LPF ALTER_SPELL_EFFECT INT_VAR header = 2 match_opcode = 44 parameter1 = 6 END //strength bonus
			LPF ALTER_SPELL_EFFECT INT_VAR header = 2 match_opcode = 37 parameter1 = 3 END //saves bonus
			LPF ADD_SPELL_EFFECT INT_VAR opcode=146 target=1 power=0 parameter1=1 parameter2=1 timing=4 resist_dispel=2 duration=60 probability1=100 header=2 STR_VAR resource=~BRBFTG~ END
		LPF ALTER_SPELL_HEADER INT_VAR header = 3 min_level = 17 END//tireless rage
			LPF ALTER_SPELL_EFFECT INT_VAR header = 3 match_opcode = 10 parameter1 = 6 END //constitution bonus
			LPF ALTER_SPELL_EFFECT INT_VAR header = 3 match_opcode = 44 parameter1 = 6 END //strength bonus
			LPF ALTER_SPELL_EFFECT INT_VAR header = 3 match_opcode = 37 parameter1 = 3 END //saves bonus
		LPF ALTER_SPELL_HEADER INT_VAR header = 4 min_level = 20 END
			LPF ALTER_SPELL_EFFECT INT_VAR header = 4 match_opcode = 10 parameter1 = 8 END //constitution bonus
			LPF ALTER_SPELL_EFFECT INT_VAR header = 4 match_opcode = 44 parameter1 = 8 END //strength bonus
			LPF ALTER_SPELL_EFFECT INT_VAR header = 4 match_opcode = 37 parameter1 = 4 END //saves bonus	
	//change duration
		LPF ALTER_SPELL_EFFECT INT_VAR duration_high=60 END 
		LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=1 power=0 parameter1=26799 parameter2=0 timing=0 duration=59 probability1=100 STR_VAR resource=~BRBRGE~ END //forbid using rage again
		
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @004
END	
	//----------------------------------------------------------//
	//Skald rage
	COPY ~3ed/Classes/Barbarian/Rage/BRBFTG.spl~ ~override/SKLDFTG.SPL~  //after rage fatigue
		LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 206 STR_VAR resource = ~SKLDRGE~ END //constitution bonus

	COPY_EXISTING ~SPCL152.SPL~  ~override/SKALDRGE.spl~  //rage itself
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
	
	//change duration
		LPF ALTER_SPELL_EFFECT INT_VAR duration_high=60 END 
	//add fatigue for low level rage
		LPF ADD_SPELL_EFFECT INT_VAR opcode=146 target=1 power=0 parameter1=1 parameter2=1 timing=4 resist_dispel=2 duration=60 probability1=100 header=1 STR_VAR resource=~SKLDFTG~ END
		LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=1 power=0 parameter1=26799 parameter2=0 timing=0 duration=59 probability1=100 STR_VAR resource=~SKLDRGE~ END //protection from another rage application
	
	//----------------------------------------------------------//
	//swashbuckler luck of heroes and critical hit effects
	COPY ~3ed/Classes/Swashbuckler~ ~override~
	//update display strings
	WITH_TRA ~%LANGUAGE%\swashbuckler.tra~ BEGIN   
		COPY_EXISTING ~CRITSTR.SPL~ ~override~
			SET  effect_strref=RESOLVE_STR_REF (@001)
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=139 parameter1=effect_strref END
		COPY_EXISTING ~CRITCON.SPL~ ~override~
			SET  effect_strref=RESOLVE_STR_REF (@002)
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=139 parameter1=effect_strref END
	END
	
	//-----------------------------------------------//
	COPY ~3ed/Classes/Ranger~ ~override~ //remove twf bonus
	//-----------------------------------------------//
	//--------------------------archer update ------------------------
	COPY ~3ed/Classes/Archer~ ~override~
	
	// (improved called shot
	WITH_TRA ~%LANGUAGE%\archer.tra~ BEGIN 
		COPY_EXISTING ~ARCHARW.SPL~ ~override~
			SAY NAME1 @001
			SAY UNIDENTIFIED_DESC @002
			
		COPY_EXISTING ~SPCL121.SPL~ ~override~ //change description of called shot
			READ_LONG 0x0050 ~descr_strref~
			STRING_SET_EVALUATE %descr_strref% @003
	END
	 
	//create arrows
	//same for all games

		COPY_EXISTING ~AROW01.ITM~ ~override/ARCHARW1.ITM~	//+0	
		COPY_EXISTING ~AROW02.ITM~ ~override/ARCHARW2.ITM~  //+1
			WRITE_SHORT 0x0042 0 
		COPY_EXISTING ~AROW11.ITM~ ~override/ARCHARW3.ITM~  //+2
			WRITE_SHORT 0x0042 0
		//add +3 arrows for iwd
	ACTION_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN
	
		COPY_EXISTING ~AROW15.ITM~ ~override/ARCHARW4.ITM~ //+3
			WRITE_SHORT 0x0042 0
		COPY_EXISTING ~oharow50.ITM~ ~override/ARCHARW5.ITM~ //+4
			WRITE_SHORT 0x0042 0	
	END
	  
	 //----------------------------------------------//
     ACTION_IF NOT (~%GameId%~ STR_EQ ~Iwd~) BEGIN
        //shaman dance update (duration +1 additional round at lvl1, +2 at lvl 6 +3 at lvel 12 +4 at lvl 18)
        COPY ~3ed/Classes/Shaman~ ~override~
	 
        //create major spirits
	 
        //weapons
        COPY_EXISTING ~BDSHA18A.ITM~	~override\BDSHA24A.ITM~
            LPF ALTER_ITEM_EFFECT INT_VAR check_headers = 1 match_opcode = 12 dicenumber = 2 dicesize = 8 END 
		
        COPY_EXISTING ~BDSHA18B.ITM~	~override\BDSHA24B.ITM~
            LPF ALTER_ITEM_HEADER INT_VAR dicenumber = 2 dicesize = 8 END 
		
        COPY_EXISTING ~BDSHA18C.ITM~	~override\BDSHA24C.ITM~
            LPF ALTER_ITEM_HEADER INT_VAR dicenumber = 2 dicesize = 12 END 	
		
        //spirits
        WITH_TRA ~%LANGUAGE%\shaman.tra~ BEGIN  
            OUTER_SET StrRefA = RESOLVE_STR_REF(@001)
            OUTER_SET StrRefB = RESOLVE_STR_REF(@002)
            OUTER_SET StrRefC = RESOLVE_STR_REF(@003)
            OUTER_SET StrRefDisplay = RESOLVE_STR_REF(@004)
        END
	
        COPY_EXISTING ~BDSHA18A.CRE~	~override\BDSHA24A.CRE~
            REPLACE_CRE_ITEM ~BDSHA24A~ #0 #0 #0 ~IDENTIFIED~ ~WEAPON1~
            LPF ALTER_CREATURE INT_VAR MaxHp = 120 CurrentHp = 120 Strength  =19 Constitution = 19 Dexterity = 19 Level1 = 16 THAC0 = 7 LongName = StrRefA Tooltip = StrRefA
							SaveDeath = 5 SaveWand = 7 SaveBreath = 6 SavePoly = 6 SaveSpell = 8 END
		
        COPY_EXISTING ~BDSHA18B.CRE~	~override\BDSHA24B.CRE~
            REPLACE_CRE_ITEM ~BDSHA24B~ #0 #0 #0 ~IDENTIFIED~ ~WEAPON1~
            LPF ALTER_CREATURE INT_VAR MaxHp = 120 CurrentHp = 120 Strength  =20 Constitution = 16 Dexterity = 23 Level1 = 16 THAC0 = 7 LongName = StrRefB Tooltip = StrRefB
							SaveDeath = 5 SaveWand = 7 SaveBreath = 6 SavePoly = 6 SaveSpell = 8 END
									
        COPY_EXISTING ~BDSHA18C.CRE~	~override\BDSHA24C.CRE~
            REPLACE_CRE_ITEM ~BDSHA24C~ #0 #0 #0 ~IDENTIFIED~ ~WEAPON1~	
            LPF ALTER_CREATURE INT_VAR MaxHp = 120 CurrentHp = 120 Strength  =23 Constitution = 10 Dexterity = 23 Level1 = 16 THAC0 = 7 LongName = StrRefC Tooltip = StrRefC
							SaveDeath = 5 SaveWand = 7 SaveBreath = 6 SavePoly = 6 SaveSpell = 8 END
	 
        //shamanic dance update
        COPY_EXISTING ~SPSH004.SPL~ ~override~
            //LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=363 END //remove movement rate checking
            LPF ALTER_SPELL_HEADER INT_VAR header = 20 min_level=20 END
            FOR (i=21;i<=23;i=i+1) BEGIN		
                SET d_prob = (i - 20) *2
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 20 END
                LPF ALTER_SPELL_HEADER INT_VAR header = i min_level=i END
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_probability1 = 74 probability1 = 74 + d_prob END
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_probability2 = 75 probability2 = 75 + d_prob END
            END
		
            FOR (i=24;i<=30;i=i+1) BEGIN		
                SET d_prob = (i - 20) *2
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 20 END
                LPF ALTER_SPELL_HEADER INT_VAR header = i min_level=i END
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_probability1 = 4 probability1 = 0 END //1 % of calling minor animal spirit
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_probability2 = 5 match_probability1 = 14 probability2 = 1 probability1 = 10 END  //9% calling major animal
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_probability2 = 15 match_probability1 = 34 probability2 = 11 probability1 = 20 END // 10% minor nature spirit
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_probability2 = 35 match_probability1 = 74 probability2 = 21 probability1 = 30 END // 10% major nature spirit
				
                    LPF ADD_SPELL_EFFECT INT_VAR header = i opcode = 139 target =1 timing = 1 probability2 = 31 probability1 = 74 + d_prob parameter1 = StrRefDisplay END
                    LPF ADD_SPELL_EFFECT INT_VAR header = i opcode = 331 duration = 2400  target =1 timing = 0 probability2 = 31 probability1 = 74 + d_prob STR_VAR resource =~BDSHAM24~ END
				
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_probability2 = 75 probability2 = 75 + d_prob END
            END
	 
            FOR (i=1;i<=30;i=i+1) BEGIN
                //change duration based on level
                PATCH_IF (i<6) BEGIN
                    LPF ALTER_SPELL_EFFECT INT_VAR header=i match_opcode=328 duration =13 END
                END ELSE PATCH_IF (i<12) BEGIN
                    LPF ALTER_SPELL_EFFECT INT_VAR header=i match_opcode=328 duration =19 END
                END ELSE PATCH_IF (i<18) BEGIN
                    LPF ALTER_SPELL_EFFECT INT_VAR header=i match_opcode=328 duration =25 END
                END ELSE BEGIN
                    LPF ALTER_SPELL_EFFECT INT_VAR header=i match_opcode=328 duration =31 END
                END
            END
	 
            LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=363 END //remove movement rate checking
	
	
            //favored of spirits for non bg1
            ACTION_IF !(~%GameId%~ STR_EQ ~Bg1~) BEGIN
		
			
                //making favored of spirits permanent (just heal)
                COPY_EXISTING ~SPCL941.SPL~ ~override/FVRD_HL.SPL~ //updating heal
                    LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 321 STR_VAR resource = ~FVRD_SP~ END
				
                COPY_EXISTING ~SPCL941B.SPL~ ~override/FVRD_SP.SPL~
                    LPF DELETE_EFFECT INT_VAR  match_opcode = 101 END
                    LPF DELETE_EFFECT INT_VAR  match_opcode = 267 END	
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR  match_timing = 4 opcode = 169 END				
                    LPF DELETE_EFFECT INT_VAR  match_opcode = 169 END
				
                    LPF ALTER_SPELL_EFFECT INT_VAR  timing = 9 END
                    LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 321 timing = 0 STR_VAR resource = ~FVRD_SP~ END
                    LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 215 timing = 0 END
                    LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 174 timing = 0 END
                    LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 50 timing = 0 END
                    LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 232 STR_VAR resource = ~FVRD_HL~ END
				
                OUTER_FOR (player_id=1;player_id<=6;player_id=player_id + 1) BEGIN //apply favored of spirits every time after rest
                    EXTEND_TOP ~BALDUR.BCS~ ~override/SHAMAN.baf~
                        EVALUATE_BUFFER			
                END
				
            END
        END
	 //-------------------------Berserker--------------------------
	 COPY_EXISTING ~SPCL321D.SPL~ ~override~
		LPF DELETE_EFFECT INT_VAR  match_opcode = 139 END
	
	//last berserk
	 COPY ~3ed/Classes/Berserker/LSTBRSK.BAM~ ~override~
	 
	 WITH_TRA ~%LANGUAGE%\berserker.tra~ BEGIN  
	 
		OUTER_SET StrRefProt = RESOLVE_STR_REF(@003)
		COPY_EXISTING ~SPCL321.SPL~ ~override/LSTBRSK.SPL~
			  SAY NAME1 @001
			  SAY UNIDENTIFIED_DESC @002
			  LPF ALTER_SPELL_EFFECT INT_VAR duration_high=36 END //duration to 6 rounds
			  LPF ADD_SPELL_EFFECT INT_VAR  insert_point = 0 opcode = 321 target = 1 duration = 1 STR_VAR resource = ~SPCL321~ END
			  LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode=208 parameter1 = 1 timing = 0 duration=36 END //min hp to 1 
			  LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode=12 parameter1 = 1 parameter2 = 134217728 timing = 3 duration=37 END //damage 1 second after rage 			  
			  LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=206 duration=2400 parameter1 = StrRefProt END //restore duration of inability to rage	
			  LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 73 parameter1 = 15 END //damage
			  LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 278 parameter1 = 5 END //thac0
			  //resistances
			  LPF ADD_SPELL_EFFECT INT_VAR opcode = 86 parameter1 = 30 target = 1 duration = 36 END 
			  LPF ADD_SPELL_EFFECT INT_VAR opcode = 87 parameter1 = 30 target = 1 duration = 36 END 
			  LPF ADD_SPELL_EFFECT INT_VAR opcode = 88 parameter1 = 30 target = 1 duration = 36 END 
			  LPF ADD_SPELL_EFFECT INT_VAR opcode = 89 parameter1 = 30 target = 1 duration = 36 END 
			  


	 //berserker rage update
	 COPY_EXISTING ~SPCL321.SPL~ ~override~
		LPF ALTER_SPELL_EFFECT INT_VAR duration_high=36 END //duration to 6 rounds
		LPF ADD_SPELL_EFFECT INT_VAR  insert_point = 0 opcode = 321 target = 1 duration = 1 STR_VAR resource = ~SPCL321~ END
			//resistances
			  LPF ADD_SPELL_EFFECT INT_VAR opcode = 86 parameter1 = 10 target = 1 duration = 36 END 
			  LPF ADD_SPELL_EFFECT INT_VAR opcode = 87 parameter1 = 10 target = 1 duration = 36 END 
			  LPF ADD_SPELL_EFFECT INT_VAR opcode = 88 parameter1 = 10 target = 1 duration = 36 END 
			  LPF ADD_SPELL_EFFECT INT_VAR opcode = 89 parameter1 = 10 target = 1 duration = 36 END 
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
		LPF ALTER_SPELL_HEADER INT_VAR header = 2 min_level = 8 END
			  //resistances
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 2 match_opcode = 86 parameter1 = 20 END 
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 2 match_opcode = 87 parameter1 = 20 END 
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 2 match_opcode = 88 parameter1 = 20 END 
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 2 match_opcode = 89 parameter1 = 20 END
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 2 match_opcode = 73 parameter1 = 3 END //damage
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 2 match_opcode = 278 parameter1 = 3 END //thac0
			  LPF DELETE_EFFECT INT_VAR header = 2 match_opcode = 206 END //remove protection from spell
		
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 2 END
		LPF ALTER_SPELL_HEADER INT_VAR header = 3 min_level = 16 END
			  //resistances
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 3 match_opcode = 86 parameter1 = 30 END 
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 3 match_opcode = 87 parameter1 = 30 END 
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 3 match_opcode = 88 parameter1 = 30 END 
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 3 match_opcode = 89 parameter1 = 30 END
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 3 match_opcode = 73 parameter1 = 5 END //damage
			  LPF ALTER_SPELL_EFFECT INT_VAR header = 3 match_opcode = 278 parameter1 = 5 END //thac0
		
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 3 END
			LPF ALTER_SPELL_HEADER INT_VAR header = 4 min_level = 18 END		
			  LPF ADD_SPELL_EFFECT INT_VAR header = 4 target = 1 opcode=208 parameter1 = 1 timing = 0 duration=36 END //min hp to 1 
			  LPF ADD_SPELL_EFFECT INT_VAR header = 4 target = 1 opcode=12 parameter1 = 1 parameter2 = 134217728 timing = 3 duration=37 END //damage 1 second after rage 

		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @004			  
	 END
			  		
	 //---------------------------jester-------------------------------
	 //mind shield
	  COPY   ~3ed/Classes/Jester/%GameId%/JSTRIMM.SPL~  ~override~ //immunities !!!!!!!!!!!!!!!!!!!!!!	  	
	 //--------------------------------------------//	 
