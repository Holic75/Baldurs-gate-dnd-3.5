	INCLUDE ~3ed/ADD_SMITE_EVIL_BASE.tph~
	INCLUDE ~3ed/ADD_SMITE_EVIL_VARIATION.tph~
//---------------------ranger twf fix-----------------------
 COPY ~3ed/Classes/Ranger~ ~override~
//--------------------- kensai -----------------------------
//replace permanent THAC0/dmg bonus with persistent (to be able to block it with weapons)

    OUTER_SET max_kensai_bonus = 7

    OUTER_FOR (i=1;i<=max_kensai_bonus;i=i+1) BEGIN

        OUTER_SPRINT resource EVALUATE_BUFFER ~KENSBN%i%~
        COPY ~3ed/Classes/Kensai/KENSBN.SPL~ ~override/KENSBN%i%.SPL~         
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode =321 STR_VAR resource END
            
        COPY ~3ed/Classes/Kensai/KENSBN.EFF~ ~override/KENSBN%i%.EFF~
            LPF ALTER_EFF STR_VAR resource END
            
        COPY ~3ed/Classes/Kensai/KENSBNA.SPL~ ~override/KENSBNA%i%.SPL~
            LPF ALTER_SPELL_EFFECT STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~KENSBNA%i%~
          
    END
    
    COPY ~3ed/Classes/FeatTables/KENSAI_FEATS.2DA~  ~override~
        LAF ADD_FEATS_2DA   STR_VAR clab=~CLABFI04\.2DA~ caption=~KENABI~ 2DA_file = ~KENSAI_FEATS~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~  END

    //kensai bonuses regularization
    OUTER_FOR (i=89;i<=98;i=i+1) BEGIN     
    
         OUTER_SPRINT resource EVALUATE_BUFFER ~KENSR%i%~     
         
		 COPY ~3ed\Classes\Kensai\KENSR.SPL~ ~override\KENSR%i%.SPL~    
            LPF ADD_SPELL_EFFECT INT_VAR opcode =321 target =2 duration =1 STR_VAR resource END //remove protections and add them again
            FOR (j=1;j<=max_kensai_bonus;j=j+1) BEGIN
                SPRINT resource EVALUATE_BUFFER ~KENSBN%j%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode =321 target =2 duration =1 STR_VAR resource END
                LPF ADD_SPELL_EFFECT INT_VAR opcode =206 target =2 duration =1 STR_VAR resource END
            END
         
         OUTER_SPRINT resource EVALUATE_BUFFER ~KENSR%i%~
         COPY ~3ed\Classes\Kensai\KENSR.EFF~ ~override\KENSR%i%.EFF~
            LPF ALTER_EFF STR_VAR resource END
            
         COPY ~3ed\Classes\Kensai\KNSPR.SPL~ ~override\KNSPR%i%.SPL~
            LPF MAKE_ALWAYS_CASTABLE END
            LPF ALTER_SPELL_EFFECT STR_VAR resource END
    END
    
//--------------------- paladin ----------------------------------------
	//saving throws
    COPY ~3ed/Classes/Paladin/PDNSVCR.SPL~ ~override~
       
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=1  
        STR_VAR clab=~CLABPA.*\.2DA~  mask_file = ~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name = ~PDNSVCR~ caption=~PSVFIX~ END	//-2 to saves (corrected by chas saves application)
	LAF ADD_FEATS_LVL INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
        STR_VAR clab=~CLABPA.*\.2DA~  mask_file = ~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name = ~CHASAVFT~ caption=~PCHSVFT~ END // cha saves
       
	//lay on hands		
	COPY ~3ed/Classes/Paladin/LayOnHands~ ~override~
    COPY_EXISTING ~LAYHND0.SPL~ ~override~
        LPF MAKE_ALWAYS_CASTABLE END
    COPY_EXISTING ~LAYHND1.SPL~ ~override~
        LPF MAKE_ALWAYS_CASTABLE END
        
	OUTER_FOR (player_id=1;player_id<=6;player_id=player_id + 1) BEGIN //script to update number of lay on hands uses depending on charisma
		EXTEND_TOP_REGEXP ~\(BD\)*BALDUR.*\.BCS~ ~3ed/Classes/Paladin/PALADIN.baf~
			EVALUATE_BUFFER			
	END
	
	COPY_EXISTING ~GVABSHLT.SPL~ ~override~
		LPF ALTER_SPELL_EFFECT STR_VAR resource = ~SPCL211~ END // absorb health   !!!!!!!!!!!!!!!!! same for all games
	
	COPY_EXISTING ~GVLAYHDS.SPL~ ~override~
		LPF ALTER_SPELL_EFFECT STR_VAR resource = ~SPCL102~ END //lay on hands   !!!!!!!!!!!!!!!!! same for all games
    LAF ADD_FEATS_LVL INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1    
        STR_VAR clab=~\(\(CLABPA01\)\|\(CLABPA02\)\|\(CLABPA06\)\)\.2DA~  mask_file = ~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ 
            feat_name = ~LAYHND1~ caption=~PLAYHD~ END // initial lay on hands        

    
	//smite evil
	LAF ADD_SMITE_EVIL_BASE INT_VAR max_lvl=30 END
	
	LAF ADD_SMITE_EVIL_VARIATION INT_VAR name_ref = 001 descr_ref =002 par1 = 0 par2 =37 STR_VAR SmiteName=~SMTEVL~ END //smite evil
	LAF ADD_SMITE_EVIL_VARIATION INT_VAR name_ref = 003 descr_ref =004 par1 = 0 par2 =1 STR_VAR SmiteName=~SMTUND~  END //smite undead
	LAF ADD_SMITE_EVIL_VARIATION INT_VAR name_ref = 005 descr_ref =006 par1 = 0 par2 =36 STR_VAR SmiteName=~SMTGUD~  END //smite good
    
    COPY_EXISTING ~SMTGUD.SPL~ ~override~
        LPF ALTER_SPELL_HEADER INT_VAR projectile = 195 END //red holy might
    
	LAF ADD_SMITE_EVIL_VARIATION INT_VAR name_ref = 007 descr_ref =008 par1 = 202 par2 =105 //mage_all 
                                                                       par11 = 19 par21 = 105 //sorcerer
                                                                       par12 = 5 par22 = 105 //bard
                                                                       par13 = 146 par23 = 104 //dragons
                                                                       par14 = 160 par24 = 105 //tanari      
                                                                       par15 = 147 par25 = 104 //genie 
                                                                       par16 = 166 par26 = 105 //rakshasa
                                                                       par17 = 126 par27 = 105 //ogre mage
                                                                       par18 = 141 par28 = 104 //imp
                                                                       par19 = 139 par29 = 104 //mephit
                                                                       STR_VAR SmiteName=~SMTMAG~  END //smite mage
	
    LAF ADD_SMITE_EVIL_VARIATION INT_VAR name_ref = 009 descr_ref =010 par1 = 0 par2 =0 STR_VAR SmiteName=~SMTDST~ END //destructive smite
    //aura of faith
    WITH_TRA ~%LANGUAGE%\paladin.tra~ BEGIN
        COPY ~3ed/Classes/Paladin/AuraFaith~ ~override~ //copy icons
    
        
        OUTER_FOR (cha=10;cha<=25;cha=cha+2) BEGIN
        
            OUTER_SET aura_duration = 6*(3 + (cha - 10)/2)
            OUTER_FOR (i=1;i<=4;i=i+1) BEGIN
                COPY_EXISTING ~SPPR108.SPL~ ~override/AURF%i%%cha%.SPL~ //use remove fear as base for a spell
                    WRITE_LONG 0x0008 0 
                    WRITE_ASCII 0x003a ~AURAFAIC~ #8 //spellbook icon
                    LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_type = 4 END
                    LPF ADD_SPELL_EFFECT INT_VAR opcode = 73 target = 2 parameter1 = i resist_dispel = 2 duration = aura_duration END //damage bonus
                    LPF ADD_SPELL_EFFECT INT_VAR opcode = 278 target = 2 parameter1 = i resist_dispel = 2 duration = aura_duration END //thaco bonus
                    LPF ADD_SPELL_EFFECT INT_VAR opcode = 0 target = 2 parameter1 = i resist_dispel = 2 duration = aura_duration END //ac bonus
                    LPF ADD_SPELL_EFFECT INT_VAR opcode = 142 target = 2 parameter2 = 17 resist_dispel = 2 duration = aura_duration END //bless icon       
                    LPF ALTER_SPELL_EFFECT INT_VAR duration_high = aura_duration  power = 0 resist_dispel = 2 END
                    LPF ALTER_SPELL_HEADER INT_VAR target = 5 speed = 0 STR_VAR icon = ~AURAFAIB~ END //set to caster only and update icon                              
            END
            
            COPY_EXISTING ~SPPR103.SPL~ ~override/AURD1%cha%.SPL~ //aura of despair
                WRITE_LONG 0x0008 0 
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 321 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 6 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 15 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 20 END
                LPF ALTER_SPELL_EFFECT INT_VAR duration_high = aura_duration  power = 0 resist_dispel = 1 END
                
            COPY_EXISTING ~SPCL103.SPL~ ~override/AURD2%cha%.SPL~ //aura of despair
                WRITE_LONG 0x0008 0 
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 321 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 1 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 15 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 20 END
                LPF ALTER_SPELL_HEADER INT_VAR min_level = 1 END
                LPF ALTER_SPELL_EFFECT INT_VAR duration_high = aura_duration  power = 0 resist_dispel = 1 END
                
            COPY_EXISTING ~SPCL103.SPL~ ~override/AURD3%cha%.SPL~ //aura of despair
                WRITE_LONG 0x0008 0 
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 321 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 1 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 6 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 20 END
                LPF ALTER_SPELL_HEADER INT_VAR min_level = 1 END
                LPF ALTER_SPELL_EFFECT INT_VAR duration_high = aura_duration  power = 0 resist_dispel = 1 END
                
             COPY_EXISTING ~SPCL103.SPL~ ~override/AURD4%cha%.SPL~ //aura of despair
                WRITE_LONG 0x0008 0 
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 321 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 1 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 15 END
                LPF DELETE_SPELL_HEADER INT_VAR header_type = 3 min_level = 6 END
                LPF ALTER_SPELL_HEADER INT_VAR min_level = 1 END
                LPF ALTER_SPELL_EFFECT INT_VAR duration_high = aura_duration  power = 0 resist_dispel = 1 END
        END
        
        
        COPY_EXISTING ~SPPR108.SPL~ ~override/AURAFAI.SPL~ //use remove fear as base for a spell
            READ_BYTE 0x001b spell_flags
            SET spell_flags = spell_flags BAND 2
            WRITE_BYTE 0x001b spell_flags
            WRITE_ASCII 0x003a ~AURAFAIC~ #8 //spellbook icon
            
            LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_type = 4 END            
            FOR (i=1;i<=3;i=i+1) BEGIN
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
                LPF ALTER_SPELL_HEADER INT_VAR header=i+1 min_level = 3+i*6 END
            END                
            LPF DELETE_EFFECT INT_VAR check_headers = 1 END
            SAY NAME1 @001
            SAY UNIDENTIFIED_DESC @002
            LPF ADD_ABILITY_DEPENDENT_EFFECTS INT_VAR target =2 remove_in_effect = 1  n_headers = 4 stat_begin = 10 stat_step = 2 stat_end = 24 stat_ge_par = 132 resist_dispel = 2 STR_VAR abil_name = ~AURF~ END
            LPF ALTER_SPELL_HEADER INT_VAR target = 5 speed = 0 STR_VAR icon = ~AURAFAIB~  END
        
        COPY_EXISTING ~SPCL103.SPL~ ~override/SPCL103.SPL~ //use remove fear as base for a spell
            LPF DELETE_EFFECT INT_VAR check_headers = 1 END
            LPF ALTER_SPELL_HEADER INT_VAR header = 2 min_level = 9 END
            LPF ALTER_SPELL_HEADER INT_VAR header = 4 min_level = 21 END
            LPF ADD_ABILITY_DEPENDENT_EFFECTS INT_VAR target =2 remove_in_effect = 1 n_headers = 4 stat_begin = 10 stat_step = 2 stat_end = 24 stat_ge_par = 132 resist_dispel = 1 STR_VAR abil_name = ~AURD~ END
            LPF ALTER_SPELL_HEADER INT_VAR projectile = 1  END
            
            READ_LONG 0x0050 ~descr_strref~
            STRING_SET_EVALUATE %descr_strref% @003
	END
	//-------------------------inquisitor----------------------
	//mr bonus (25%+2/level till level 30)
    OUTER_FOR (i = 1; i<=30; i = i + 1) BEGIN
        COPY ~3ed/Classes/Inquisitor/INQMR.SPL~ ~override/INQMR%i%.SPL~
            SET prev = i - 1
            SPRINT resource ~INQMR%prev%~
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 2 insert_point = 0 duration = 1 STR_VAR resource END
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 166 parameter1 = 25 + i*2 END
    END
    LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=1 feat_name_indexed = 1
        STR_VAR clab=~CLABPA03\.2DA~  mask_file = ~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name = ~INQMR~ caption=~IINQMR~ END 
	
    
    //-------------------------------hexblade----------------------    
    
	LAF ADD_FEATS_LVL INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1 
        STR_VAR clab=~CLABFI03\.2DA~  mask_file = ~3ed/Feats/FeatAttribution/SFTCREF.SPL~ feat_name = ~CHASAVFT~ caption=~HCHSVFT~ END // cha saves
    
    WITH_TRA ~%LANGUAGE%\hexblade.tra~ BEGIN
    
    //aura of unluck
     OUTER_FOR (cha=10;cha<=25;cha=cha+2) BEGIN
            OUTER_SET aura_duration = 6*(3 + (cha - 10)/2)
            OUTER_FOR (i=1;i<=4;i=i+1) BEGIN
                COPY ~3ed/Classes/Hexblade/AURUNLK.SPL~ ~override/AURU%i%%cha%.SPL~
                WRITE_LONG 0x0008 0
                SET parameter1 = 0 - i
                LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 22 parameter1 END //luck penalty  
                LPF ALTER_SPELL_EFFECT INT_VAR duration_high = aura_duration power = 0 END
            END
    
     END
        COPY ~3ed/Classes/Hexblade/AURUNLK.SPL~ ~override/AURUNLK.SPL~
            
            FOR (i=1;i<=3;i=i+1) BEGIN
                
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
                LPF ALTER_SPELL_HEADER INT_VAR header=i+1 min_level = 12+i*4 END      
            END
            SAY NAME1 @001
            SAY UNIDENTIFIED_DESC @002
            LPF DELETE_EFFECT INT_VAR check_headers = 1 END
            LPF ADD_ABILITY_DEPENDENT_EFFECTS INT_VAR target =2 remove_in_effect = 1 n_headers = 4 stat_begin = 10 stat_step = 2 stat_end = 24 stat_ge_par = 132 resist_dispel = 1 STR_VAR abil_name = ~AURU~ END
            LPF ALTER_SPELL_HEADER INT_VAR projectile = 1  END                
                          
        //hexblade curse
        COPY_EXISTING ~SPPR113.SPL~ ~override/HEXCR.SPL~
            LPF ALTER_SPELL_HEADER INT_VAR speed = 1 END
            LPF CLONE_EFFECT INT_VAR match_opcode = 54 opcode = 0 END //add ac penalty
            LPF CLONE_EFFECT INT_VAR match_opcode = 54 opcode = 73 END //add dmg penalty
            LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_type = 4 END
            LPF DELETE_EFFECT INT_VAR match_opcode = 321 END
            FOR (cha = 10;cha<=25;cha=cha+2) BEGIN
                SPRINT resource EVALUATE_BUFFER ~HEXCR%cha%~
                LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 321 target = 2 duration = 1 STR_VAR resource END
            END
            SAY NAME1 @003
            SAY UNIDENTIFIED_DESC @004
    
        COPY ~3ed/Classes/Hexblade/GV_HEX.SPL~ ~override/GV_HEX1.SPL~ //give one ability depending on charisma
        COPY ~3ed/Classes/Hexblade/GV_HEX.SPL~ ~override/GV_HEXA.SPL~ //gives multiple uses depnding on charisma   
            LPF MAKE_ALWAYS_CASTABLE END
        
        OUTER_FOR (cha = 10;cha<=25;cha=cha+2) BEGIN
            COPY_EXISTING ~HEXCR.SPL~ ~override/HEXCR%cha%.SPL~                              
                SET base_savebonus = 0 - (cha - 10)/2
                LPF ALTER_SPELL_EFFECT_EX INT_VAR savingthrow = 1 power = 0 savebonus = base_savebonus END
        
                FOR (i=2;i<=30;i=i+1) BEGIN
                    LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
                    LPF ALTER_SPELL_HEADER INT_VAR header=i min_level = i END
                    SET savebonus = base_savebonus - (i/4)
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i savebonus END //savingthrow
                    
                    SET parameter1 = 0 - 2
                    
                    PATCH_IF (i>=7) BEGIN                       
                        SET parameter1 = parameter1 - 2
                    END
                    
                    PATCH_IF (i>=17) BEGIN                       
                        SET parameter1 = parameter1 - 2
                    END
                    
                    PATCH_IF (i>=27) BEGIN                       
                        SET parameter1 = parameter1 - 2
                    END
                    
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_opcode = 54 parameter1 END
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_opcode = 0  parameter1 END
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_opcode = 73 parameter1 END
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_opcode = 33 parameter1 END
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_opcode = 34 parameter1 END
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_opcode = 35 parameter1 END
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_opcode = 36 parameter1 END
                    LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i match_opcode = 37 parameter1 END                        
                END
                
            //giving hexblade curse
            COPY ~3ed/Classes/Hexblade/GV_HEX.SPL~ ~override/GV_HEX%cha%.SPL~
                SPRINT resource EVALUATE_BUFFER ~HEXCR%cha%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 171 target = 2 duration = 1 STR_VAR resource END
                

            COPY_EXISTING ~GV_HEX1.SPL~ ~override~           
                  
                PATCH_IF (cha>=12) BEGIN                   
                    SET cha_m2 = cha - 2
                    SPRINT resource EVALUATE_BUFFER ~GV_HEX%cha_m2%~ 
                    LPF ADD_SPELL_EFFECT INT_VAR opcode = 318 target = 2 parameter1 = cha parameter2 = 132 duration = 1 insert_point = 0 STR_VAR resource END 
                END  
                SPRINT resource EVALUATE_BUFFER ~GV_HEX%cha%~ 
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 326 target = 2 parameter1 = cha parameter2 = 132 duration = 1 insert_point = 0 STR_VAR resource END


            COPY_EXISTING ~GV_HEXA.SPL~ ~override~
                SPRINT resource EVALUATE_BUFFER ~HEXCR%cha%~
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 172 target = 2 duration = 1 insert_point = 0 STR_VAR resource END //removes existing hexes
                PATCH_IF (cha>=12) BEGIN
                    LPF ADD_SPELL_EFFECT INT_VAR opcode = 326 target = 2 parameter1 = cha parameter2 = 132 duration = 1 STR_VAR resource = ~GV_HEX1~ END                                
                END
        END
            
        COPY_EXISTING ~GV_HEXA.SPL~ ~override~
            LPF ADD_SPELL_EFFECT INT_VAR opcode = 326 target = 2  duration = 1 STR_VAR resource = ~GV_HEX1~ END
                FOR (i=1;i<=7;i=i+1) BEGIN
                    LPF ADD_SPELL_HEADER INT_VAR copy_header = i END
                    LPF ALTER_SPELL_HEADER INT_VAR header = i+1 min_level = 1 + 4*i END
                    LPF ADD_SPELL_EFFECT INT_VAR header = i+1 opcode = 326 target = 2  duration = 1 STR_VAR resource = ~GV_HEX1~ END
                END
                              
        //swift spell
        COPY ~3ed/Classes/Hexblade/SWIFTCST.SPL~ ~override~
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = 6 END
            SAY NAME1 @005
            SAY UNIDENTIFIED_DESC @006  

        //dispelling strike 
        COPY ~3ed/Classes/Hexblade/DispellingStrike~ ~override~
        COPY_EXISTING ~DSPLHIT.SPL~ ~override~
            SAY NAME1 @007
            SAY UNIDENTIFIED_DESC @008  
         
    END
        
    OUTER_FOR (player_id=1;player_id<=6;player_id=player_id + 1) BEGIN
		EXTEND_TOP_REGEXP ~\(BD\)*BALDUR.*\.BCS~ ~3ed/Classes/Hexblade/GV_HEX.baf~
			EVALUATE_BUFFER			
	END
    

    COPY ~3ed/Classes/FeatTables/HEXBLADE_FEATS.2DA~  ~override~
        LAF ADD_FEATS_2DA   STR_VAR clab=~CLABFI03\.2DA~ caption=~HEXABI~ 2DA_file = ~HEXBLADE_FEATS~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCREF.SPL~  END        
	//-------------------------------monk-------------------------
	//(ac bonus, wis ac bonus, flurry of blows)
    COPY ~3ed/Classes/FeatTables/MONK_FEATS.2DA~  ~override~
        LAF ADD_FEATS_2DA   STR_VAR clab=~CLABMO.*\.2DA~ caption=~MACABI~ 2DA_file = ~MONK_FEATS~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~  END 
    COPY ~3ed/Classes/FeatTables/MONK_FLURRY.2DA~  ~override~
        LAF ADD_FEATS_2DA   STR_VAR clab=~CLABMO.*\.2DA~ caption=~MFLABI~ 2DA_file = ~MONK_FLURRY~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~  END                                    
	COPY ~3ed/Classes/Monk~ ~override~
  
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
            
        //sun soul beam    
        COPY_EXISTING ~SPCL239A.SPL~ ~override~ //make damage ~1d4 level             
            FOR (i=1;i<=29;i=i+1) BEGIN
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 1  END
                LPF ALTER_SPELL_HEADER INT_VAR header = i + 1 min_level =  i+1 END
            END
            FOR (i=1;i<=30;i=i+1) BEGIN
                LPF ALTER_SPELL_EFFECT INT_VAR header = i match_opcode = 12 parameter1 = 2*(i - 2*(i / 2)) dicenumber = i/2 dicesize = 4 END
                SET savebonus = 0 - (i/4)
                LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i savebonus END
            END
        COPY_EXISTING ~SPCL239A.SPL~ ~override~ 
            LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 177 END //remove +3 undead damage
            
        //update description 
        COPY_EXISTING ~SPCL239.SPL~ ~override~
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 206 target = 4 opcode = 318 parameter2 = 52 END //protect non-enemies
            READ_LONG 0x0050 ~descr_strref~
            STRING_SET_EVALUATE %descr_strref% @023
            
            
        //monk stunning blow and quivering palm
        //create header placeholders
        OUTER_FOR (i=1;i<=7;i=i+1) BEGIN
            OUTER_SET lvl = 4*i
            ACTION_IF (i == 1) BEGIN
                OUTER_SET lvl = 1
            END
            COPY_EXISTING ~SPCL811.SPL~ ~override~ //stunning blow
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 1  END 
                LPF ALTER_SPELL_HEADER INT_VAR header = i min_level =  lvl END
                
            COPY_EXISTING ~SPCL820.SPL~ ~override~ //quivering palm
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 1  END 
                LPF ALTER_SPELL_HEADER INT_VAR header = i + 1 min_level =  lvl END

        END
        
        
      
        OUTER_FOR (i=0;i<=7;i=i+1) BEGIN
            OUTER_SET savebonus = 0 -  i
            OUTER_SET savingthrow = 4
            COPY_EXISTING ~SPCL811.EFF~ ~override/MNKSTNH%i%.EFF~
                LPF ALTER_EFF INT_VAR savebonus savingthrow END
            COPY_EXISTING ~STUNSTRG.EFF~ ~override/MNKSTNS%i%.EFF~
                LPF ALTER_EFF INT_VAR savebonus savingthrow END
            COPY_EXISTING ~STUNVIS.EFF~ ~override/MNKSTNV%i%.EFF~
                LPF ALTER_EFF INT_VAR savebonus savingthrow END
            
            COPY_EXISTING ~SPCL820.EFF~ ~override/MNKQVPH%i%.EFF~
                 LPF ALTER_EFF INT_VAR savebonus savingthrow END
            COPY_EXISTING ~QUIVVIS.EFF~ ~override/MNKQVPV%i%.EFF~
                 LPF ALTER_EFF INT_VAR savebonus savingthrow END
            
            COPY_EXISTING ~SPCL811.SPL~ ~override~    
                SPRINT resource EVALUATE_BUFFER ~MNKSTNH%i%~
                LPF ALTER_SPELL_EFFECT_EX INT_VAR header =  i+1 STR_VAR match_resource = ~SPCL811~ resource END
                SPRINT resource EVALUATE_BUFFER ~MNKSTNS%i%~
                LPF ALTER_SPELL_EFFECT_EX INT_VAR header =  i+1 STR_VAR match_resource = ~STUNSTRG~ resource END
                SPRINT resource EVALUATE_BUFFER ~MNKSTNV%i%~
                LPF ALTER_SPELL_EFFECT_EX INT_VAR header =  i+1 STR_VAR match_resource = ~STUNVIS~ resource END
                
            COPY_EXISTING ~SPCL820.SPL~ ~override~    
                SPRINT resource EVALUATE_BUFFER ~MNKQVPH%i%~
                LPF ALTER_SPELL_EFFECT_EX INT_VAR header =  i+1 STR_VAR match_resource = ~SPCL820~ resource END
                SPRINT resource EVALUATE_BUFFER ~MNKQVPV%i%~
                LPF ALTER_SPELL_EFFECT_EX INT_VAR header =  i+1 STR_VAR match_resource = ~QUIVVIS~ resource END            
        END    
        //update descriptions
        COPY_EXISTING ~SPCL811.SPL~ ~override~
			SAY UNIDENTIFIED_DESC @021
        COPY_EXISTING ~SPCL820.SPL~ ~override~
			SAY UNIDENTIFIED_DESC @022
            
        //frozen fist damage increase at every 10th level
        OUTER_FOR (i = 1; i<=3; i = i + 1) BEGIN
            COPY_EXISTING ~MONKCHIL.EFF~ ~override/MNKCHIL%i%.EFF~
                LPF ALTER_EFF INT_VAR parameter1 = 2+i END
        END
        COPY_EXISTING ~SPDM105.SPL~ ~override~
            FOR (i = 1; i<=3; i = i + 1) BEGIN
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
                LPF ALTER_SPELL_HEADER INT_VAR header = i+1 min_level = i*10 END
                SPRINT resource EVALUATE_BUFFER ~MNKCHIL%i%~
                LPF ALTER_SPELL_EFFECT INT_VAR header = i+1 match_opcode = 248 STR_VAR resource END
            END
            READ_LONG 0x0050 ~descr_strref~
            STRING_SET_EVALUATE %descr_strref% @024
        
	END
	//---------------------------- ninja (bounty hunter->ninja)---------------------------------------
	WITH_TRA ~%LANGUAGE%\ninja.tra~ BEGIN
		COPY ~3ed/Classes/Ninja~ ~override~ //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! //spells in the list seem to be the same for all games
		
			
		COPY_EXISTING ~NinjaAbilitiesMap.2DA~ ~override~
			COUNT_2DA_ROWS 3 n_rows
			FOR (i=0;i<n_rows;i=i+1) BEGIN
				READ_2DA_ENTRY %i% 1 3 ninja_spell_name 
				READ_2DA_ENTRY %i% 2 3 original_spell_name 				
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
                
                PATCH_IF (~NJ_HST~ STR_EQ ~%ninja_spell_name%~) BEGIN //make haste work only on ninja and remove fatigue
                    LPF ALTER_SPELL_HEADER INT_VAR projectile = 1 END
                    LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 93 END
                END
               
		END
			
		COPY_EXISTING ~KIPWR.SPL~ ~override~
			SAY NAME1 @001
			SAY UNIDENTIFIED_DESC @002
	
		COPY_EXISTING ~GV_KIPW.SPL~ ~override~
            LPF MAKE_ALWAYS_CASTABLE END
			FOR (i=3;i<30;i=i+2) BEGIN
				SET copy_header = (i - 1)/2
				LPF ADD_SPELL_HEADER INT_VAR  insert_point=(i + 1)/2 copy_header END
				LPF ALTER_SPELL_HEADER INT_VAR  header = (i + 1)/2 min_level = i END
				LPF CLONE_EFFECT INT_VAR header = (i - 1)/2 match_opcode = 326 match_parameter2 = 0  multi_match = 1 END
			END	
			
        LAF ADD_FEATS_2DA   STR_VAR clab=~CLABTH03\.2DA~ caption=~NACABI~ 2DA_file = ~MONK_FEATS~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~  END

        //add abilities to ninja and silent hunter
        LAF ADD_FEATS_LVL INT_VAR min_level=1 max_level=1 d_level=1 add_at_level1=1
            STR_VAR clab=~\(\(CLABTH03\)\|\(CLABRN04\)\)\.2DA~  mask_file = ~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name = ~GV_KIPW~ caption=~NJKIABI~ END 
       
	
		OUTER_FOR (player_id=1;player_id<=6;player_id=player_id + 1) BEGIN
			EXTEND_TOP_REGEXP ~\(BD\)*BALDUR.*\.BCS~ ~override/NINJA.baf~
				EVALUATE_BUFFER			
		END
	END
    

	//------------------------------Druid shapeshifts and other polymorph forms and charm animal update-----------------------------------------		
	WITH_TRA ~%LANGUAGE%\druid_shapeshift.tra~ BEGIN   
		//shapeshifts that can use items
		COPY ~3ed/Classes/Druid/Polymorph2DA~ ~override~ 
		COPY ~3ed/Classes/Druid/Forms~ ~override~
        COPY ~3ed/Classes/Druid/Misc~ ~override~
        COPY ~3ed/Classes/Druid/Icons~ ~override~
        
        
        //winter wolf breath
        COPY ~3ed/Classes/Druid/WinterWolfBreath~ ~override~
        COPY_EXISTING ~WOLW_BL.SPL~ ~override~
            SAY NAME1 @201
            SAY UNIDENTIFIED_DESC @202
        
		COPY_EXISTING ~DRDPOLY.SPL~ ~override~ //standard shapeshift
			SAY NAME1 @001
            PATCH_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN //add polar bear, winter wolf, boring beatle and water elementals
                SAY UNIDENTIFIED_DESC @200
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~DRDPL3~ resource = ~DRDPL31~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~DRDPL4~ resource = ~DRDPL41~ END
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 insert_point = 2 END
                LPF ALTER_SPELL_HEADER INT_VAR header = 3 min_level = 11 END
                LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 3 STR_VAR resource = ~DRDPL2A~ END
            END ELSE BEGIN
                SAY UNIDENTIFIED_DESC @002
            END
		
        ACTION_DEFINE_ASSOCIATIVE_ARRAY PolymorphForms BEGIN ~PL_WRWF~ => ~druid~ END
		COPY_EXISTING ~PL_WRWF.SPL~ ~override~ //werewolf
			SAY NAME1 @003
			SAY UNIDENTIFIED_DESC @004

		LAF ADD_FEATS_MASK INT_VAR mask = 0b100010001000100010001001110000
            STR_VAR clab=~CLABDR0[14]\.2DA~  mask_file = ~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_type = ~GA~ feat_name = ~DRDPOLY~ caption=~DRDPLY~ END        
		ACTION_DEFINE_ASSOCIATIVE_ARRAY DruidPolymorphStrings BEGIN
			~PL_FIRL~ => 005
			~PL_EARL~ => 006
			~PL_FIRH~ => 007
			~PL_EARH~ => 008
			~PL_BRBL~ => 009
			~PL_BRBR~ => 010
			~PL_WOLF~ => 011
			~PL_SALA~ => 012
			~PL_WYVN~ => 013
			~PL_SPDR~ => 014
            ~PL_BRPO~ => 031
            ~PL_BORB~ => 032
            ~PL_WOLW~ => 033
            ~PL_WATL~ => 034
            ~PL_WATH~ => 035
		END
		
		
		OUTER_SET  AttackStrRef=RESOLVE_STR_REF (@017)
        COPY ~3ed/Classes/Druid/Weapons~ ~override~
			WRITE_LONG 0x0008 AttackStrRef
			WRITE_LONG 0x000c AttackStrRef	
             LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 144 target = 1 timing = 2 parameter1 = 0 parameter2 = 7 END
             LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 144 target = 1 timing = 2 parameter1 = 0 parameter2 = 3 END
             LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 144 target = 1 timing = 2 parameter1 = 0 parameter2 = 4 END
             LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 144 target = 1 timing = 2 parameter1 = 0 parameter2 = 5 END
             LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 144 target = 1 timing = 2 parameter1 = 0 parameter2 = 2 END
 

			       
		COPY_EXISTING ~PL_NFRM.SPL~ ~override~ 
			SAY NAME1 @015
			SAY UNIDENTIFIED_DESC @016
			
            
		ACTION_PHP_EACH DruidPolymorphStrings AS SpellName =>SpellStr BEGIN
			
			COPY_EXISTING ~%SpellName%.SPL~  ~override~
				SAY NAME1 (AT "SpellStr")
                SET DescStr = SpellStr + 100
                SAY UNIDENTIFIED_DESC (AT "DescStr")                

            ACTION_DEFINE_ASSOCIATIVE_ARRAY PolymorphForms BEGIN ~%SpellName%~ => ~druid~ END
		END
		

        
        //add correct protection from display string to baby wyvern
        LAF TRANSFER_PROTECTION_FROM_DISPLAY_STRING STR_VAR Origin = ~RING97.ITM~ Target = ~WP_WYVN.ITM~ END
            
        //add other polymorph forms   
        COPY ~3ed/Classes/Polymorphs/Weapons~ ~override~
            WRITE_LONG 0x0008 AttackStrRef
			WRITE_LONG 0x000c AttackStrRef	
            LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 144 target = 1 timing = 2 parameter1 = 0 parameter2 = 7 END
            LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 144 target = 1 timing = 2 parameter1 = 0 parameter2 = 3 END
            LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 144 target = 1 timing = 2 parameter1 = 0 parameter2 = 4 END
            LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 144 target = 1 timing = 2 parameter1 = 0 parameter2 = 5 END
            LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 144 target = 1 timing = 2 parameter1 = 0 parameter2 = 2 END
            
        COPY ~3ed/Classes/Polymorphs/Forms~ ~override~
        ACTION_DEFINE_ASSOCIATIVE_ARRAY SpellPolymorphStrings BEGIN
			~PL_FLIN~ => 021
			~PL_GOLI~ => 022
			~PL_JELL~ => 023
			~PL_MIND~ => 024
			~PL_OGRE~ => 025
			~PL_SPDN~ => 026
			~PL_TROL~ => 027
			~PL_WLFW~ => 028
		END
        
        //additional copies for polymorph and shape change spell spell
        COPY_EXISTING ~PL_BRBL.SPL~ ~override/PS_BRBL.SPL~
        COPY_EXISTING ~PL_BRBR.SPL~ ~override/PS_BRBR.SPL~
        COPY_EXISTING ~PL_WOLF.SPL~ ~override/PS_WOLF.SPL~
        COPY_EXISTING ~PL_EARH.SPL~ ~override/PS_EARH.SPL~
        COPY_EXISTING ~PL_FIRH.SPL~ ~override/PS_FIRH.SPL~
        

        
        ACTION_DEFINE_ASSOCIATIVE_ARRAY PolymorphForms BEGIN 
            ~PS_BRBL~ => ~spell~
            ~PS_BRBR~ => ~spell~             
            ~PS_WOLF~ => ~spell~ 
            ~PS_EARH~ => ~spell~ 
            ~PS_FIRH~ => ~spell~ 
        END
                     
        
        ACTION_PHP_EACH SpellPolymorphStrings AS SpellName =>SpellStr BEGIN
			
			COPY_EXISTING ~%SpellName%.SPL~  ~override~
				SAY NAME1 (AT "SpellStr")
                SET DescStr = SpellStr + 100
                SAY UNIDENTIFIED_DESC (AT "DescStr")                

            ACTION_DEFINE_ASSOCIATIVE_ARRAY PolymorphForms BEGIN ~%SpellName%~ => ~spell~ END
		END
        
        //transfer protection from strings
        LAF TRANSFER_PROTECTION_FROM_DISPLAY_STRING STR_VAR Origin = ~RING95.ITM~ Target = ~WP_JELL.ITM~ END
        LAF TRANSFER_PROTECTION_FROM_DISPLAY_STRING STR_VAR Origin = ~IRONGOL.ITM~ Target = ~WP_GOLI.ITM~ END
        
        ACTION_DEFINE_ASSOCIATIVE_ARRAY PolymorphForms BEGIN ~PL_NFRM~ => ~normal_form~ END

                    
        ACTION_PHP_EACH PolymorphForms AS SpellName => Source BEGIN
            
            COPY_EXISTING ~%SpellName%.SPL~ ~override~   
                //polymorph effects
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 172 target = 1 duration = 1 insert_point = 0 STR_VAR resource=~PL_NFRM~ END
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 135 target = 1 duration = 1 insert_point = 0 STR_VAR resource=~~ END
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 215 target = 1 duration = 3 parameter1 = 0 parameter2 = 1 insert_point = 0 STR_VAR resource = ~POLYBACK~ END
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 215 target = 1 duration = 3 parameter1 = 0 parameter2 = 1 insert_point = 0 STR_VAR resource = ~SPPOLYMP~ END
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 172 target = 1 duration = 1 timing = 1 insert_point = 0 STR_VAR resource = ~SPIN160~ END //salamander fireball
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 172 target = 1 duration = 1 timing = 1 insert_point = 0 STR_VAR resource = ~WOLW_BL~ END //winter wolf breath
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 172 target = 1 duration = 1 timing = 1 insert_point = 0 STR_VAR resource = ~SPIN529~ END //slayer
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 172 target = 1 duration = 1 timing = 1 insert_point = 0 STR_VAR resource = ~SPIN917~ END //slayer
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 172 target = 1 duration = 1 timing = 1 insert_point = 0 STR_VAR resource = ~SPIN718~ END //slayer
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 172 target = 1 duration = 1 timing = 1 insert_point = 0 STR_VAR resource = ~SPIN667~ END //slayer
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 172 target = 1 duration = 1 timing = 1 insert_point = 0 STR_VAR resource = ~SPIN974~ END //slayer
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 172 target = 1 duration = 1 timing = 1 insert_point = 0 STR_VAR resource = ~SPMDSLAY~ END //slayer
                PATCH_IF NOT (~%Source%~ STR_EQ ~normal_form~) BEGIN
                    LPF ADD_SPELL_EFFECT INT_VAR opcode = 171 target = 1 duration = 1 timing = 1 STR_VAR resource=~PL_NFRM~ END 
                END
                PATCH_IF (~%Source%~ STR_EQ ~spell~) BEGIN //give another use of ability on polymorph
                    SPRINT resource EVALUATE_BUFFER ~%SpellName%~
                    LPF ADD_SPELL_EFFECT INT_VAR opcode = 171 target = 1 duration = 1 timing = 1 STR_VAR resource END 
                END
        END
        //fix polymorph 
        COPY_EXISTING ~SPWI416.SPL~ ~override~
            LPF DELETE_EFFECT INT_VAR match_opcode = 171 STR_VAR match_resource = ~SPWI490~  END
            LPF DELETE_EFFECT INT_VAR match_opcode = 171 STR_VAR match_resource = ~SPWI489~  END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI489~ resource = ~PL_NFRM~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI496~ resource = ~PL_JELL~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI493~ resource = ~PL_FLIN~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI495~ resource = ~PL_SPDN~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI494~ resource = ~PL_OGRE~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI497~ resource = ~PS_BRBR~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI498~ resource = ~PS_BRBL~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI499~ resource = ~PS_WOLF~ END            
            LPF DELETE_EFFECT INT_VAR match_opcode = 171  STR_VAR match_resource ~PL_NFRM~ END
            
        //fix shapechange
        COPY_EXISTING ~SPWI916.SPL~ ~override~        
            LPF DELETE_EFFECT INT_VAR match_opcode = 171  STR_VAR match_resource~SPIN151~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN151~ resource = ~PL_NFRM~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN152~ resource = ~PL_MIND~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN153~ resource = ~PL_GOLI~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN154~ resource = ~PL_TROL~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN155~ resource = ~PL_WLFW~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN156~ resource = ~PS_FIRH~ END
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN157~ resource = ~PS_EARH~ END
            LPF DELETE_EFFECT INT_VAR match_opcode = 171  STR_VAR match_resource ~PL_NFRM~ END

        
        //fix  relair's mistake (wolf)
        ACTION_IF (~%GameId%~ STR_EQ ~Bg1~) OR (~%GameId%~ STR_EQ ~Bg2~) BEGIN
            COPY_EXISTING ~CLCK04.ITM~ ~override~
                 LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN122~ resource = ~PL_NFRM~ END
                 LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 111  STR_VAR resource = ~WP_WOLF~ END
        END
        
        //fix clock of sewers (troll, wolf, rat)
        ACTION_IF  (~%GameId%~ STR_EQ ~Bg2~) BEGIN
            COPY_EXISTING ~CLCK27.ITM~ ~override~   
                 LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN151~ resource = ~PL_NFRM~ END
                 LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI491~ resource = ~PL_NFRM~ END
                 LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~PLYTROLL~ resource = ~WP_TROL~ END
                 LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~PLYJELLY~ resource = ~WP_JELL~ END                
        END
        
        //add removals of abilities
        COPY_EXISTING_REGEXP ~.*\.SPL~ ~override~
            LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 172 STR_VAR match_resource = ~SPWI490~ 
                                        RET need_change = found_match my_target=target my_power = power my_savingthrow = savingthrow my_savebonus = savebonus END
            
            PATCH_IF (need_change) BEGIN
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 171 duration = 1 power = 0 timing = 0 insert_point = 0 target = my_target 
                    power = my_power savingthrow = my_savingthrow savebonus = my_savebonus STR_VAR resource = ~PL_NFRM~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN151~ resource = ~PL_NFRM~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN152~ resource = ~PL_MIND~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN153~ resource = ~PL_GOLI~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN154~ resource = ~PL_TROL~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN155~ resource = ~PL_WLFW~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN156~ resource = ~PS_FIRH~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPIN157~ resource = ~PS_EARH~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI489~ resource = ~PL_NFRM~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI496~ resource = ~PL_JELL~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI493~ resource = ~PL_FLIN~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI495~ resource = ~PL_SPDN~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI494~ resource = ~PL_OGRE~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI497~ resource = ~PS_BRBR~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI498~ resource = ~PS_BRBL~ END
                LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI499~ resource = ~PS_WOLF~ END
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 172 target = 1 duration = 1 timing = 1 insert_point = 0 STR_VAR resource = ~WOLW_BL~ END //remove winter wolf breath
            END
        
        BUT_ONLY
			
			
    END    
    
    WITH_TRA ~%LANGUAGE%\ability_changes.tra~ BEGIN  
        COPY_EXISTING_REGEXP ~\(\(SPIN108\)\|\(SPCL311\)\)\.SPL~ ~override~
            LPF ALTER_SPELL_EFFECT INT_VAR power = 0 END
            
            FOR (i=1;i<=7;i=i+1) BEGIN
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
                LPF ALTER_SPELL_HEADER INT_VAR header = i+1 min_level = 4*i END
                
                SET savebonus = 0 - i
                LPF ALTER_SPELL_EFFECT_EX INT_VAR header = i+1 savebonus END
            
            END
            LPF ALTER_SPELL_EFFECT_EX INT_VAR match_savingthrow = 8 savingthrow = 1 END
            READ_LONG 0x0050 ~descr_strref~
            STRING_SET_EVALUATE %descr_strref% @005
	END				
    //--------------------------Priest of talos lightning dmg ----------------------------------------------------------
    
    OUTER_SPRINT clab_line  ~ABIL_TALOS~
    OUTER_FOR (i=2;i<=12;i=i+2) BEGIN
        COPY ~3ed/Classes/Talos/TALWPN.EFF~ ~override/TLWPN%i%.EFF~
            WRITE_LONG 0x003c i
        
        COPY ~3ed/Classes/Talos/TALWPN.SPL~ ~override/TLWPN%i%.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR dicesize = i END
            
        COPY ~3ed/Classes/Talos/TALWPA.SPL~ ~override/TLWPA%i%.SPL~    
            SPRINT resource EVALUATE_BUFFER ~TLWPN%i%~
            LPF ALTER_SPELL_EFFECT STR_VAR resource END
            
            PATCH_IF (i>2) BEGIN
                SET i_old  = i - 2
                SPRINT resource EVALUATE_BUFFER ~TLWPA%i_old%~
                LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 opcode = 321 target = 2 duration = 1 STR_VAR resource END
            END
    END
    
    LAF ADD_FEATS_MASK INT_VAR mask = 0b10000100001000010000100001  feat_name_indexed = 1
            STR_VAR clab=~CLABPR02\.2DA~  mask_file = ~3ed/Feats/FeatAttribution/SFTCREAL.SPL~  feat_name = ~TLWPA~ caption=~TALWPN~ END 
   
        
    
    
	//--------------------- assassin poison weapon progression change -------------------------- (spells will be done later in spells section)
    ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN //replace with bg poison weapon
    
        //replace spell name and descr ref
        COPY_EXISTING ~SPCL423.SPL~ ~override~
            READ_LONG 0x0008 ~name_strref~
            READ_LONG 0x0050 ~descr_strref~
            
        COPY ~3ed/Classes/Assassin/PoisonWeaponIwd~ ~override~
        COPY_EXISTING ~SPCL423.SPL~ ~override~
            WRITE_LONG 0x0008 ~name_strref~
            WRITE_LONG 0x0050 ~descr_strref~
    END
    COPY_EXISTING ~bdpweapn.spl~ ~override~
        LPF ADD_SPELL_HEADER INT_VAR copy_header = 4 insert_point =5 END
        LPF ADD_SPELL_HEADER INT_VAR copy_header = 4 insert_point =6 END
        LPF ADD_SPELL_HEADER INT_VAR copy_header = 4 insert_point =7 END

        FOR (i=1;i<=6;i=i+1) BEGIN
            LPF ALTER_SPELL_HEADER INT_VAR header = i + 1 min_level = i*4 END
        END
    
        LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 5 match_opcode = 12 parameter1 = 12 END
        SET savebonus = 0 - 4
        LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 5 match_opcode = 25 duration = 24 savebonus  END
        LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 5 match_opcode = 142 duration = 24 savebonus  END
        SET savebonus = 0 - 5
        LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 6 match_opcode = 12 parameter1 = 16 END
        LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 6 match_opcode = 25 duration = 24 parameter1 = 2 savebonus  END
        LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 6 match_opcode = 142 duration = 24 savebonus  END
        SET savebonus = 0 - 6
        LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 7 match_opcode = 12 parameter1 = 16 END
        LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 7 match_opcode = 25 duration = 24 parameter1 = 2 savebonus  END
        LPF ALTER_SPELL_EFFECT_EX INT_VAR header = 7 match_opcode = 142 duration = 24 savebonus  END	            
       
        WITH_TRA ~%LANGUAGE%\ability_changes.tra~ BEGIN  
            COPY_EXISTING ~SPCL423.SPL~ ~override~ //update description of poison weapon
                READ_LONG 0x0050 ~descr_strref~
                STRING_SET_EVALUATE %descr_strref% @001
    END


    //quiet death
	COPY ~3ed/Feats/PermanentAbilities/QuietDeath~  ~override~
    LAF ADD_FEATS_LVL INT_VAR min_level=10 max_level=10 d_level=1 add_at_level1=0 
            STR_VAR clab=~CLABTH02\.2DA~  mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name = ~QTDTHFT~ caption=~AQTDTH~ END
    
    
    //script for giving assasin spells
	OUTER_FOR (player_id=1;player_id<=6;player_id=player_id + 1) BEGIN
		EXTEND_TOP_REGEXP ~\(BD\)*BALDUR.*\.BCS~ ~3ed/Classes/Assassin/Spells/ASN.baf~
			EVALUATE_BUFFER			
	END
	// ---------------------------------------- shadowdancer special abilities (simulacrum and shadow form)
	COPY ~3ed/Classes/Shadowdancer~ ~override~
	
    //fix shadow step to not get bonus attacks from rapid shot and flurry of strikes
    COPY_EXISTING ~SPSD02.SPL~ ~override~ 
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 1 duration = 1 insert_point = 0 STR_VAR resource = ~RPDSHTBN~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 1 duration = 1 insert_point = 0 STR_VAR resource = ~FLRSTKBN~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 1 duration = 7 insert_point = 0 STR_VAR resource = ~RPDSHTBN~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 1 duration = 7 insert_point = 0 STR_VAR resource = ~FLRSTKBN~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 311 target = 1 duration = 1 insert_point = 0 STR_VAR resource = ~APRBONA~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 1 duration = 7 insert_point = 0 STR_VAR resource = ~APRBONA~ END 
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 311 target = 1 duration = 1 insert_point = 0 STR_VAR resource = ~APRBONB~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 1 duration = 7 insert_point = 0 STR_VAR resource = ~APRBONB~ END 
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 311 target = 1 duration = 1 insert_point = 0 STR_VAR resource = ~APRBONC~ END
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 target = 1 duration = 7 insert_point = 0 STR_VAR resource = ~APRBONC~ END         
    
    COPY_EXISTING ~SPSD01.SPL~ ~override~ //remove bonus from non spell saves
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 33 END 
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 34 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 35 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 36 END
    //add levels to simulacrum   
	COPY_EXISTING ~SPWI804.SPL~ ~override~
		//spell starts from lvl 16 we need to start it from level 9
        FOR (i=1;i<16;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 insert_point=1 END
        END
		
		FOR (i=1;i<=16;i=i+1) BEGIN
			SET lvl = 1+ (7+i)*(i>1)
			LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = lvl END
			LPF ALTER_SPELL_EFFECT INT_VAR header = i duration_high = (i + 8)*6 END
		END

	
	COPY_EXISTING ~SPWI804.SPL~ ~override\SH_COPY.SPL~
		LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_type = 4 END //make it innate
        LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource = ~SPWI804~ resource = ~SH_COPY~ END
	
	//add shadow form if it is not there
	ACTION_IF NOT (~%GameId%~ STR_EQ ~Bg2~) BEGIN
		WITH_TRA ~%LANGUAGE%\shadowdancer.tra~ BEGIN
			COPY_EXISTING ~spcl938.SPL~ ~override~
				SAY NAME1 @001
				SAY UNIDENTIFIED_DESC @002
		END
	END
    
    //update shadow maze (description + save at -5)
    ACTION_IF NOT (~%GameId%~ STR_EQ ~Bg1~) BEGIN
        WITH_TRA ~%LANGUAGE%\shadowdancer.tra~ BEGIN
			COPY_EXISTING ~spcl937.SPL~ ~override~				
                SET new_save_bonus = 0 - 5 
                LPF UPDATE_SPELL_SAVES INT_VAR original_save = 1 new_save_bonus END
                SAY UNIDENTIFIED_DESC @003
    
        END
    END
    
	//---------------------------------------thief traps at lvls 1,10,15,20 and exploding trap
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
            
            //update exploding trap to have -5 penalty
        ACTION_IF NOT (~%GameId%~ STR_EQ ~Bg1~) BEGIN
            
            COPY_EXISTING ~SPCL911.SPL~ ~override~
                SAY UNIDENTIFIED_DESC @006
                
            COPY_EXISTING ~SPCL911B.SPL~ ~override~           
                SET new_save_bonus = 0 - 5 
                LPF UPDATE_SPELL_SAVES INT_VAR original_save = 1 new_save_bonus END
                LPF ALTER_SPELL_EFFECT INT_VAR power = 0 END 
        END
	END		
		
  
	COPY_EXISTING ~SPCL415.spl~ ~override~
		FOR (i=2;i<=4;i=i+1) BEGIN
			SET lvl = 1+ (7+i)*(i>1)
			LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i*5 END
		END
//fighter/thief dirty combat ----------------------------------------------------------
    COPY ~3ed/Classes/FighterThief~ ~override~
WITH_TRA ~%LANGUAGE%\fighter_thief.tra~ BEGIN          
    //slow    
    COPY_EXISTING ~F_T_DRH.SPL~ ~override/F_T_DR1.SPL~
        SET  SlowStrRef=RESOLVE_STR_REF (@001)
        FOR (i=1;i<=4;i=i+1) BEGIN
            SET probability2 = 25*(i - 1) + 1
            SET probability2 = probability2 > 0 ? probability2 : 0 
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 40 duration = 6*i probability1 = 25*i probability2 END
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 142 parameter2 = 41 duration = 6*i probability1 = 25*i probability2 END
        END
        LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 139 parameter1 = SlowStrRef duration = 1  END
        
    //blindness   
    COPY_EXISTING ~F_T_DRH.SPL~ ~override/F_T_DR2.SPL~
        SET  BlindStrRef=RESOLVE_STR_REF (@002)
        FOR (i=1;i<=4;i=i+1) BEGIN
            SET probability2 = 25*(i - 1) + 1
            SET probability2 = probability2 > 0 ? probability2 : 0 
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 74 duration = 6*i probability1 = 25*i probability2 END
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 142 parameter2 = 8 duration = 6*i probability1 = 25*i probability2 END
        END
        LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 139 parameter1 = BlindStrRef duration = 1 END
    //Sickened
    COPY_EXISTING ~F_T_DRH.SPL~ ~override/F_T_DR3.SPL~
        SET  SickenedStrRef=RESOLVE_STR_REF (@003)
        FOR (i=1;i<=4;i=i+1) BEGIN
            SET probability2 = 25*(i - 1) + 1
            SET probability2 = probability2 > 0 ? probability2 : 0 
            SET parameter1 = 0 - 2
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 278 parameter1 duration = 6*i probability1 = 25*i probability2 END //thac0
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 73 parameter1 duration = 6*i probability1 = 25*i probability2 END //damage
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 325 parameter1 duration = 6*i probability1 = 25*i probability2 END //saves
            LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 142 parameter2 = 100 duration = 6*i probability1 = 25*i probability2 END          
        END    
        LPF ADD_SPELL_EFFECT INT_VAR target = 2 opcode = 139 parameter1 = SickenedStrRef duration = 1 END
    
    COPY_EXISTING ~F_T_DRH.SPL~ ~override~       
        FOR (i=2;i<=30;i=i+1) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = i END
            LPF ADD_SPELL_EFFECT INT_VAR header = i target = 2 opcode = 326  duration = 1  probability1  = 5+i STR_VAR resource = ~F_T_DR1~  END 
            PATCH_IF (i>=10) BEGIN
                LPF ADD_SPELL_EFFECT INT_VAR header = i target = 2 opcode = 326  duration = 1  probability2 = 31 probability1 = 35+i STR_VAR resource = ~F_T_DR2~ END
            END
            PATCH_IF (i>=15) BEGIN
                LPF ADD_SPELL_EFFECT INT_VAR header = i target = 2 opcode = 326  duration = 1  probability2 = 61 probability1 = 65+i STR_VAR resource = ~F_T_DR3~ END            
            END
        END
                        
    COPY_EXISTING ~F_T_DRT.SPL~ ~override~
        LPF ADD_SPELL_EFFECT INT_VAR  opcode = 206 target = 2 duration = 1 timing = 9 STR_VAR resource = ~F_T_DRT~ END //protection from subsequent applies
        
    LAF ADD_FEATS_LVL INT_VAR min_level=5 max_level=5 d_level=1 add_at_level1=0 
            STR_VAR clab=~CLABTH01\.2DA~  mask_file=~3ed/Feats/FeatAttribution/SFTCREFT.SPL~ feat_name = ~F_T_DRT~ caption=~DRT_CMB~ END
END
	
	//--------------------------------------------------//
	//barbarian and skald rage update (tireless, mighty) 
	
WITH_TRA ~%LANGUAGE%\ability_changes.tra~ BEGIN  
	COPY ~3ed/Classes/Barbarian/Rage/BRBFTG.spl~ ~override~  //after rage fatigue
	COPY ~3ed/Classes/Barbarian/Rage/BRBFTG.spl~ ~override/SKLDFTG.SPL~  //after rage fatigue for non-barbarians
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 206 STR_VAR resource = ~SKLDRGE~ END
        
    OUTER_FOR (con = 10;con<=24;con=con+2) BEGIN
        OUTER_SET rage_duration = 6*(3 + (con + 4 - 10)/2)
        COPY_EXISTING ~SPCL152.SPL~ ~override/BRBR1%con%.SPL~
            WRITE_LONG 0x0008 0       
            LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 321 STR_VAR match_resource = ~SPCL152~ END 
            //replace strength bonus with +% damage and thac0
            LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode =  44 END
            FOR (d = 7; d<=9; d = d + 1) BEGIN
                LPF ADD_SPELL_EFFECT INT_VAR opcode=332 target=1 parameter1 = 20 parameter2=d timing=0 resist_dispel=2 duration=rage_duration END
            END
            SET missile_bonus = 0 - 2
            LPF ADD_SPELL_EFFECT INT_VAR opcode=278 target=1 parameter1 = 2 timing=0 resist_dispel=2 duration=rage_duration END
            LPF ADD_SPELL_EFFECT INT_VAR opcode=167 target=1 parameter1 = missile_bonus timing=0 resist_dispel=2 duration=rage_duration END
            LPF ADD_SPELL_EFFECT INT_VAR opcode=145 target=1 parameter2=0 timing=0 resist_dispel=2 duration=rage_duration END //disable wizard spells
            LPF ADD_SPELL_EFFECT INT_VAR opcode=145 target=1 parameter2=1 timing=0 resist_dispel=2 duration=rage_duration END //disable cleric spells
            
            LPF ADD_SPELL_EFFECT INT_VAR opcode=146 target=1 parameter1=1 parameter2=1 timing=4 resist_dispel=2 duration=rage_duration STR_VAR resource=~BRBFTG~ END  
            PATCH_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN //forbid using blood and animal rage
                LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=1 duration=rage_duration resist_dispel=2 STR_VAR resource=~SPPR422~ END
                LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=1 duration=rage_duration resist_dispel=2 STR_VAR resource=~SPPR522~ END
            END
            LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=1 duration=(rage_duration - 1) resist_dispel=2 STR_VAR resource=~BRBRGE~ END //forbid using rage again
            //LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 10 new_opcode = 272 parameter1 = 1 parameter2 = 3 STR_VAR resource = ~ABNCON4~ END //replace constitution bonus
            
        COPY_EXISTING ~override/BRBR1%con%.SPL~ ~override/SKLR1%con%.SPL~
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource=~BRBFTG~  resource = ~SKLDFTG~ END  
            LPF ALTER_SPELL_EFFECT_EX STR_VAR match_resource=~BRBRGE~  resource = ~SKLDRGE~ END
        
        COPY_EXISTING ~override/BRBR1%con%.SPL~ ~override/BRBR2%con%.SPL~
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 10 parameter1 = 6 END //constitution bonus
            //LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 272 STR_VAR resource = ~ABNCON6~ END //constitution bonus
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=332 parameter1 = 30 END //+%dmg
            SET missile_bonus = 0 - 3
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=278 parameter1 = 3 END //+ melee thac0
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=167 parameter1 = missile_bonus END //+ melee thac0
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 37 parameter1 = 3 END //saves bonus
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = rage_duration + 6 END
            LPF ALTER_SPELL_EFFECT_EX INT_VAR duration = rage_duration+5 STR_VAR match_resource=~BRBRGE~ END 
            
        COPY_EXISTING ~override/BRBR2%con%.SPL~ ~override/BRBR3%con%.SPL~
            LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 146 STR_VAR match_resource = ~BRBFTG~ END //remove fatigue
             
        COPY_EXISTING ~override/SKLR1%con%.SPL~ ~override/SKLR2%con%.SPL~
            LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 146 STR_VAR match_resource = ~SKLDFTG~ END //remove fatigue
                         
        COPY_EXISTING ~override/BRBR3%con%.SPL~ ~override/BRBR4%con%.SPL~
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 10 parameter1 = 8 END //constitution bonus
            //LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 272 STR_VAR resource = ~ABNCON8~ END //constitution bonus
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=332 parameter1 = 40 END //+%dmg
            SET missile_bonus = 0 - 4
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=278 parameter1 = 4 END //+ melee thac0
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode=167 parameter1 = missile_bonus END //+ melee thac0
			LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 37 parameter1 = 4 END //saves bonus
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = rage_duration + 12 END
            LPF ALTER_SPELL_EFFECT_EX INT_VAR duration = rage_duration+11 STR_VAR match_resource=~BRBRGE~ END 
    END
    
	COPY_EXISTING ~SPCL152.SPL~ ~override/BRBRGE.spl~   //rage itself       
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
        LPF ALTER_SPELL_HEADER INT_VAR header = 2 min_level = 11 END
        
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
        LPF ALTER_SPELL_HEADER INT_VAR header = 3 min_level = 17 END//tireless rage
        
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
		LPF ALTER_SPELL_HEADER INT_VAR header = 4 min_level = 20 END

        LPF DELETE_EFFECT INT_VAR check_headers=1 END
        LPF ADD_ABILITY_DEPENDENT_EFFECTS INT_VAR n_headers = 4 stat_begin = 10 stat_step = 2 stat_end = 24 stat_ge_par = 126 STR_VAR abil_name = ~BRBR~ END
     
		READ_LONG 0x0050 ~descr_strref~
		STRING_SET_EVALUATE %descr_strref% @004

	COPY_EXISTING ~SPCL152.SPL~  ~override/SKLDRGE.spl~  //rage itself
		LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
        LPF DELETE_EFFECT INT_VAR check_headers=1 END
        LPF ALTER_SPELL_HEADER INT_VAR header = 2 min_level = 17 END//tireless rage
        LPF ADD_ABILITY_DEPENDENT_EFFECTS INT_VAR n_headers = 2 stat_begin = 10 stat_step = 2 stat_end = 24 stat_ge_par = 126 STR_VAR abil_name = ~SKLR~ END


END	


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
	COPY ~3ed/Classes/Archer/Common~ ~override~
	
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
    //+3 and +4 arrows for iwd      
	ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
    	WITH_TRA ~%LANGUAGE%\archer.tra~ BEGIN 
            COPY ~3ed/Classes/Archer/IwdArrows/ARCHARW3.ITM~ ~override~ //+3
                WRITE_SHORT 0x0042 0
                SAY NAME2 @004
                SAY IDENTIFIED_DESC @005
            COPY ~3ed/Classes/Archer/IwdArrows/ARCHARW4.ITM~ ~override~ //+4
                WRITE_SHORT 0x0042 0
                SAY NAME2 @006
                SAY IDENTIFIED_DESC @007
        END
    END	
    
	ACTION_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN	
		COPY_EXISTING ~AROW15.ITM~ ~override/ARCHARW4.ITM~ //+3
			WRITE_SHORT 0x0042 0
		COPY_EXISTING ~oharow50.ITM~ ~override/ARCHARW5.ITM~ //+4
			WRITE_SHORT 0x0042 0	
	END
	  
	 //---------------------- shaman dance update (replace with innate summoning one spirit)------------------------// 
    COPY ~3ed/Classes/Shaman/BDSHAM03.2DA~ ~override~ //list for 3rd level summon
    COPY ~3ed/Classes/Shaman/BDSHAM09.2DA~ ~override~ //list for 9th level summon
    COPY ~3ed/Classes/Shaman/BDSHAM15.2DA~ ~override~ //list for 15th level summon
    COPY ~3ed/Classes/Shaman/BDSHAM21.2DA~ ~override~ //list for 21th level summon
    COPY ~3ed/Classes/Shaman/BDSHAM24.2DA~ ~override~ //list for 24th level summon
    COPY ~3ed/Classes/Shaman/bdshunsu.BCS~ ~override~ //script for shaman summons
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

    COPY_EXISTING ~BDSHA01A.CRE~   ~override\BDSHA01A.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 20 MaxHp = 8 CurrentHp = 8 Level1 = 1 END 
    COPY_EXISTING ~BDSHA01B.CRE~   ~override\BDSHA01B.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 20 MaxHp = 8 CurrentHp = 8 Level1 = 1 END
    COPY_EXISTING ~BDSHA01C.CRE~   ~override\BDSHA01C.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 20 MaxHp = 8 CurrentHp = 8 Level1 = 1 END
        
    COPY_EXISTING ~BDSHA01A.CRE~   ~override\BDSHA03A.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 18  AC = 5 MaxHp = 16 CurrentHp = 16 END  
    COPY_EXISTING ~BDSHA01B.CRE~   ~override\BDSHA03B.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 18  AC = 5 MaxHp = 16 CurrentHp = 16 END 
    COPY_EXISTING ~BDSHA01C.CRE~   ~override\BDSHA03C.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 18  AC = 4 MaxHp = 16 CurrentHp = 16 END 
        
    COPY_EXISTING ~BDSHA06A.CRE~   ~override\BDSHA09A.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 15  AC = 4 MaxHp = 48 CurrentHp = 48 Level1 = 6 END    
    COPY_EXISTING ~BDSHA06B.CRE~   ~override\BDSHA09B.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 15  AC = 4 MaxHp = 48 CurrentHp = 48 Level1 = 6 END 
    COPY_EXISTING ~BDSHA06C.CRE~   ~override\BDSHA09C.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 15  AC = 4 MaxHp = 48 CurrentHp = 48 Level1 = 6 END 
        
    COPY_EXISTING ~BDSHA12A.CRE~   ~override\BDSHA15A.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 11  AC = 2 MaxHp = 80 CurrentHp = 80 Level1 = 10 END    
    COPY_EXISTING ~BDSHA12B.CRE~   ~override\BDSHA15B.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 11  AC = 2 MaxHp = 80 CurrentHp = 80 Level1 = 10 END 
    COPY_EXISTING ~BDSHA12C.CRE~   ~override\BDSHA15C.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 11  AC = 2 MaxHp = 80 CurrentHp = 80 Level1 = 10 END     

    COPY_EXISTING ~BDSHA18A.CRE~   ~override\BDSHA21A.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 7  AC = 0 MaxHp = 108 CurrentHp = 108 Level1 = 14 END    
    COPY_EXISTING ~BDSHA18B.CRE~   ~override\BDSHA21B.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 7  AC = 0 MaxHp = 108 CurrentHp = 108 Level1 = 14 END 
    COPY_EXISTING ~BDSHA18C.CRE~   ~override\BDSHA21C.CRE~
        LPF ALTER_CREATURE INT_VAR THAC0 = 7  AC = 0 MaxHp = 108 CurrentHp = 108 Level1 = 14 END              
        
    OUTER_SET AcEffective = 0 - 2                    
    COPY_EXISTING ~BDSHA18A.CRE~	~override\BDSHA24A.CRE~
        REPLACE_CRE_ITEM ~BDSHA24A~ #0 #0 #0 ~IDENTIFIED~ ~WEAPON1~
        LPF ALTER_CREATURE INT_VAR MaxHp = 128 CurrentHp = 128 Strength = 19 Constitution = 19 Dexterity = 19 Level1 = 16 THAC0 = 5 LongName = StrRefA Tooltip = StrRefA
                        SaveDeath = 5 SaveWand = 7 SaveBreath = 6 SavePoly = 6 SaveSpell = 8 AcEffective END
    
    COPY_EXISTING ~BDSHA18B.CRE~	~override\BDSHA24B.CRE~
        REPLACE_CRE_ITEM ~BDSHA24B~ #0 #0 #0 ~IDENTIFIED~ ~WEAPON1~
        LPF ALTER_CREATURE INT_VAR MaxHp = 128 CurrentHp = 128 Strength = 20 Constitution = 16 Dexterity = 23 Level1 = 16 THAC0 = 5 LongName = StrRefB Tooltip = StrRefB
                        SaveDeath = 5 SaveWand = 7 SaveBreath = 6 SavePoly = 6 SaveSpell = 8 AcEffective END
                                
    COPY_EXISTING ~BDSHA18C.CRE~	~override\BDSHA24C.CRE~
        REPLACE_CRE_ITEM ~BDSHA24C~ #0 #0 #0 ~IDENTIFIED~ ~WEAPON1~	
        LPF ALTER_CREATURE INT_VAR MaxHp = 128 CurrentHp = 128 Strength = 23 Constitution = 10 Dexterity = 23 Level1 = 16 THAC0 = 5 LongName = StrRefC Tooltip = StrRefC
                        SaveDeath = 5 SaveWand = 7 SaveBreath = 6 SavePoly = 6 SaveSpell = 8 AcEffective END
 
                           
    
    //set duration to 3 rounds + (cha - 10)/2
    OUTER_FOR (cha = 10;cha<=24;cha=cha+2) BEGIN
        OUTER_SET spirit_duration = 6*(3 + (cha - 10)/2)            
        COPY ~3ed/Classes/Shaman/SHM_DNC.SPL~ ~override/SHMD1%cha%.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = spirit_duration END
        COPY ~3ed/Classes/Shaman/SHM_DNC.SPL~ ~override/SHMD2%cha%.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = spirit_duration STR_VAR resource = ~BDSHAM03~ END
        COPY ~3ed/Classes/Shaman/SHM_DNC.SPL~ ~override/SHMD3%cha%.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = spirit_duration STR_VAR resource = ~BDSHAM06~ END
        COPY ~3ed/Classes/Shaman/SHM_DNC.SPL~ ~override/SHMD4%cha%.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = spirit_duration STR_VAR resource = ~BDSHAM09~ END
        COPY ~3ed/Classes/Shaman/SHM_DNC.SPL~ ~override/SHMD5%cha%.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = spirit_duration STR_VAR resource = ~BDSHAM12~ END
        COPY ~3ed/Classes/Shaman/SHM_DNC.SPL~ ~override/SHMD6%cha%.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = spirit_duration STR_VAR resource = ~BDSHAM15~ END  
        COPY ~3ed/Classes/Shaman/SHM_DNC.SPL~ ~override/SHMD7%cha%.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = spirit_duration STR_VAR resource = ~BDSHAM18~ END
        COPY ~3ed/Classes/Shaman/SHM_DNC.SPL~ ~override/SHMD8%cha%.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = spirit_duration STR_VAR resource = ~BDSHAM21~ END            
    END
    
    WITH_TRA ~%LANGUAGE%\shaman.tra~ BEGIN  
        COPY ~3ed/Classes/Shaman/SHM_DNC.SPL~ ~override/SHM_DNC.SPL~ //shamanic dance innante
            FOR (i = 1; i<=7; i = i+1) BEGIN
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
                LPF ALTER_SPELL_HEADER INT_VAR header = i+1 min_level = i*3 END
            END
                         
            LPF DELETE_EFFECT INT_VAR check_headers = 1 END
            LPF ADD_ABILITY_DEPENDENT_EFFECTS INT_VAR n_headers = 8 stat_begin = 10 stat_step = 2 stat_end = 24 stat_ge_par = 132 resist_dispel = 0 STR_VAR abil_name = ~SHMD~ END 
                        
            SAY NAME1 @005
            SAY UNIDENTIFIED_DESC @006                                  
    END
    //give 1 use of ability
    COPY ~3ed/Classes/Shaman/GV_SDNC.SPL~ ~override/GVSDNC1.SPL~
        SPRINT resource ~SHM_DNC~
        LPF ADD_SPELL_EFFECT INT_VAR opcode = 171 target = 2 duration = 1 STR_VAR resource END
        
    COPY ~3ed/Classes/Shaman/GV_SDNC.SPL~ ~override/GV_SDNC.SPL~
        LPF MAKE_ALWAYS_CASTABLE END
        SPRINT resource ~SHM_DNC~
        LPF ADD_SPELL_EFFECT INT_VAR header = 1 opcode = 172 target = 2 duration = 1 STR_VAR resource END //remove
        SPRINT resource ~GVSDNC1~
        FOR (cha = 10; cha <= 24; cha = cha + 2) BEGIN
            LPF ADD_SPELL_EFFECT INT_VAR header = 1 opcode = 326 target = 2 parameter1 = cha parameter2 = 132 duration = 1 STR_VAR resource END
        END
        SPRINT resource ~SHM_DNC~
        //now add spell on every 2nd level
        FOR (i  = 1; i < 30 ;i = i + 2) BEGIN
            LPF ADD_SPELL_HEADER INT_VAR copy_header = (i+1)/2 END
            LPF ALTER_SPELL_HEADER INT_VAR header = (i+3)/2 min_level = i+1 END
            LPF ADD_SPELL_EFFECT INT_VAR header = (i+3)/2 opcode = 171 target = 2 duration = 1 STR_VAR resource END
        END
        
    COPY ~3ed/Classes/Shaman/GV_SDNC.SPL~ ~override/DSBLDNC.SPL~			
        LPF ADD_SPELL_EFFECT INT_VAR header=1 opcode=144 target=2 parameter1=0 parameter2=10 timing=9 duration=1 END //disable shamanic dance button
        
    //bonus uses at level 1 
    LAF ADD_FEATS_LVL INT_VAR min_level=1 max_level=1 d_level=4 add_at_level1=1 
                    STR_VAR clab=~CLABSH.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name=~GV_SDNC~ caption=~SHDNCA~ END		

                    



    //favored of spirits for non bg1
    ACTION_IF !(~%GameId%~ STR_EQ ~Bg1~) BEGIN           
        //making favored of spirits permanent (just heal)
        COPY_EXISTING ~SPCL941B.SPL~ ~override/FVRD_HL.SPL~ //updating heal
            LPF MAKE_ALWAYS_CASTABLE END
            LPF ALTER_SPELL_EFFECT INT_VAR target = 2 END
            LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 321 STR_VAR resource = ~FVRD_SP~ END
        
        COPY_EXISTING ~SPCL941.SPL~ ~override/FVRD_SP.SPL~ 
            LPF MAKE_ALWAYS_CASTABLE END
            LPF ALTER_SPELL_EFFECT INT_VAR target = 2 END
            LPF DELETE_EFFECT INT_VAR  check_headers = 1 match_opcode = 101 END
            LPF DELETE_EFFECT INT_VAR  check_headers = 1 match_opcode = 267 END	
            LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 208 END
            LPF ALTER_SPELL_EFFECT_EX INT_VAR  match_timing = 4 opcode = 169 END				
            LPF DELETE_EFFECT INT_VAR  check_headers = 1 match_opcode = 169 END
       
            LPF ALTER_SPELL_EFFECT INT_VAR  timing = 9 END
            LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 321 timing = 0 STR_VAR resource = ~FVRD_SP~ END
            LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 215 timing = 0 END
            LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 174 timing = 0 END
            LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 50 timing = 0 END         
            LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 232 STR_VAR parameter2 = 3 resource = ~FVRD_HL~ END //set to 25%
                    
    END
    OUTER_FOR (player_id=1;player_id<=6;player_id=player_id + 1) BEGIN //apply favored of spirits and shamanic dance uses every time after rest
        EXTEND_TOP_REGEXP ~\(BD\)*BALDUR.*\.BCS~ ~3ed/Classes/Shaman/SHAMAN.baf~
            EVALUATE_BUFFER			
    END            
	 //-------------------------Berserker--------------------------
	 COPY_EXISTING ~SPCL321D.SPL~ ~override~
		LPF DELETE_EFFECT INT_VAR  check_headers = 1 match_opcode = 139 END
	
	//last berserk icon
	 COPY ~3ed/Classes/Berserker/LSTBRSK.BAM~ ~override~
     

	 WITH_TRA ~%LANGUAGE%\berserker.tra~ BEGIN
        OUTER_SET HpDmgStrRef=RESOLVE_STR_REF (@006)     
        OUTER_SET StrRefProt = RESOLVE_STR_REF(@003)
        OUTER_SET StrRefWarn = RESOLVE_STR_REF(@005)   
        OUTER_FOR (con = 10;con<=24;con=con+2) BEGIN
            OUTER_SET brsrk_duration = 6*(3 + (con - 10)/2)
            //berserker rage update
            COPY_EXISTING ~SPCL321.SPL~ ~override/BRSR1%con%.SPL~
                WRITE_LONG 0x0008 0
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 18 END //remove max hp bonus
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 17 END //remove current hp bonus
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 12 END //remove damage
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 321 STR_VAR match_resource = ~SPCL321~ END //remove effects removal (will be in external spl)
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 139 END //remove damage string
                LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 0  parameter1 = ~-2~ END
                LPF ALTER_SPELL_EFFECT INT_VAR duration_high=brsrk_duration END 
                LPF ALTER_SPELL_EFFECT_EX INT_VAR match_opcode = 206 duration = brsrk_duration+1 STR_VAR match_resource = ~SPCL321~ END
                PATCH_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
                    LPF CLONE_EFFECT INT_VAR match_opcode = 206 STR_VAR match_resource = ~SPCL321~ resource = ~SPPR422~ END
                    LPF CLONE_EFFECT INT_VAR match_opcode = 206 STR_VAR match_resource = ~SPCL321~ resource = ~SPPR522~ END
                END
                //resistances
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 86 parameter1 = 10 target = 1 duration = brsrk_duration insert_point = 0 END 
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 87 parameter1 = 10 target = 1 duration = brsrk_duration insert_point = 0 END 
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 88 parameter1 = 10 target = 1 duration = brsrk_duration insert_point = 0 END 
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 89 parameter1 = 10 target = 1 duration = brsrk_duration insert_point = 0 END
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 73 parameter1 = 3 END //damage
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 278 parameter1 = 3 END //thac0

                
            COPY_EXISTING ~BRSR1%con%.SPL~  ~override/BRSR2%con%.SPL~	
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 206 STR_VAR match_resource = ~SPCL321~ END //remove protection from spell
                //display string that rage ends one round before       					       
                SET warning_time = brsrk_duration - 6
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 330 parameter1 = StrRefWarn parameter2 = 0 target = 1 duration = warning_time timing = 3 END 
                
            COPY_EXISTING ~BRSR2%con%.SPL~  ~override/BRSR3%con%.SPL~	
                //resistances
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 86 parameter1 = 20 END 
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 87 parameter1 = 20 END 
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 88 parameter1 = 20 END 
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 89 parameter1 = 20 END
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 73 parameter1 = 5 END //damage
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 278 parameter1 = 5 END //thac0              
                              
 
            COPY_EXISTING ~BRSR3%con%.SPL~  ~override/BRSR4%con%.SPL~	
                //resistances
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 86 parameter1 = 30 END 
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 87 parameter1 = 30 END 
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 88 parameter1 = 30 END 
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 89 parameter1 = 30 END
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 73 parameter1 = 7 END //damage
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 278 parameter1 = 7 END //thac0
                
            //COPY_EXISTING ~BRSR4%con%.SPL~  ~override/BRSR5%con%.SPL~
            //   LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 146 END //remove fatigue

            COPY_EXISTING ~BRSR4%con%.SPL~ ~override/LBRSR%con%.SPL~
               LPF ADD_SPELL_EFFECT INT_VAR opcode = 206 duration = 2400 target =1 parameter1 = StrRefProt STR_VAR resource = ~SPCL321~ END //fatigue	
               LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 73 parameter1 = 15 END //damage
			   LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 278 parameter1 = 7 END //thac0
               LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode=208 parameter1 = 1 timing = 0 duration = (brsrk_duration - 1) END //min hp to 1 
               LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode=12 parameter2 = 0 parameter1 = 71 timing = 4 duration = brsrk_duration resist_dispel = 2 END //50/0.7 damage after berserk 
               LPF ADD_SPELL_EFFECT INT_VAR opcode = 139 parameter1 = HpDmgStrRef target = 1 duration = 1 insert_point = 0 END //string about hp_damage
              
        END
        
        COPY_EXISTING ~SPCL321.SPL~ ~override/LSTBRSK.SPL~
            WRITE_ASCII 0x003a ~LSTBRSK~ #8 //spellbook icon
            LPF DELETE_EFFECT INT_VAR check_headers = 1 END
            LPF ALTER_SPELL_HEADER STR_VAR icon = ~LSTBRSK~ END
            SAY NAME1 @001
			SAY UNIDENTIFIED_DESC @002
            LPF ADD_ABILITY_DEPENDENT_EFFECTS INT_VAR n_headers = 1 stat_begin = 10 stat_step = 2 stat_end = 24 stat_ge_par = 126 STR_VAR abil_name = ~LBRSR~ END            
            FOR (con = 10;con<=24;con=con+2) BEGIN  
                SPRINT resource EVALUATE_BUFFER ~BRSR4%con%~
                LPF ADD_SPELL_EFFECT INT_VAR insert_point = 0 target = 1 opcode=321 duration=1 resist_dispel = 2 STR_VAR resource END
            END 
             
        COPY_EXISTING ~SPCL321.SPL~ ~override/SPCL321.SPL~
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
            LPF ALTER_SPELL_HEADER INT_VAR header = 2 min_level = 9 END
            
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 2 END
            LPF ALTER_SPELL_HEADER INT_VAR header = 3 min_level = 10 END
        
            LPF ADD_SPELL_HEADER INT_VAR copy_header = 3 END
            LPF ALTER_SPELL_HEADER INT_VAR header = 4 min_level = 18 END
        	     
            LPF DELETE_EFFECT INT_VAR check_headers = 1 END
            LPF ADD_ABILITY_DEPENDENT_EFFECTS INT_VAR n_headers = 4 stat_begin = 10 stat_step = 2 stat_end = 24 stat_ge_par = 126 STR_VAR abil_name = ~BRSR~ END 
            
            READ_LONG 0x0050 ~descr_strref~
            STRING_SET_EVALUATE %descr_strref% @004	
    END      

    //bonus berserker feats
    COPY ~3ed/Classes/FeatTables/BERSERKER_FEATS.2DA~  ~override~
        LAF ADD_FEATS_2DA   STR_VAR clab=~CLABFI02\.2DA~ caption=~BRSRAB~ 2DA_file = ~BERSERKER_FEATS~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~  END     
	 //---------------------------jester-------------------------------
	 //mind shield
	COPY   ~3ed/Classes/Jester/%GameId%/JSTRIMM.SPL~  ~override~ //immunities !!!!!!!!!!!!!!!!!!!!!!	  	
	 //--------------------------------------------//	 

     
    //-------------------dwarven defender defensive stance update and ac bonus   
    COPY ~3ed/Classes/FeatTables/DWDEF_FEATS.2DA~  ~override~
        LAF ADD_FEATS_2DA   STR_VAR clab=~CLABFI06\.2DA~ caption=~DDACAB~ 2DA_file = ~DWDEF_FEATS~
                                    mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~  END
                                    
    COPY ~3ed/Classes/Barbarian/Rage/BRBFTG.spl~ ~override/DWDFTG.SPL~  //after stance fatigue
        LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 15 END //remove dex penalty
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 206 STR_VAR resource = ~SPDWD02~ END
    
    WITH_TRA ~%LANGUAGE%\dwarven_defender.tra~ BEGIN
        OUTER_SET  halting_blow_strref=RESOLVE_STR_REF (@001)
        COPY ~3ed/Classes/DwarvenDefender/HLTBLW.eff~ ~override~
        COPY ~3ed/Classes/DwarvenDefender/HLTBLW.spl~ ~override~
            LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 139 parameter1 = halting_blow_strref END
            LPF ALTER_SPELL_EFFECT INT_VAR duration_high = 10 resist_dispel = 0 END //duration to 10 seconds, no resist
    END
        
    OUTER_FOR (con = 10;con<=24;con=con+2) BEGIN
        OUTER_SET stance_duration = 6*(3 + (con - 10 + 2)/2)
            //defensive stance update
            COPY_EXISTING ~SPDWD02.SPL~ ~override/DWDS1%con%.SPL~
                WRITE_LONG 0x0008 0
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 86 END 
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 87 END 
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 88 END 
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 89 END 
                
                LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 0  parameter1 = 2 duration =stance_duration END //ac
                LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 44  parameter1 = 2 duration =stance_duration END //str bonus
                LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 10  parameter1 = 2 duration =stance_duration END //con bonus
                
                //LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 272  parameter1 = 1 parameter2 = 3 duration =stance_duration 
                //                     STR_VAR resource = ~ABNSTR2~ END //str bonus
                //LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 272  parameter1 = 1 parameter2 = 3 duration =stance_duration 
                //                     STR_VAR resource = ~ABNCON2~ END //con bonus
                FOR (save_opcode = 33;save_opcode<=37;save_opcode = save_opcode+1) BEGIN
                   LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = save_opcode  parameter1 = 1 END //saves
                END  

                LPF ALTER_SPELL_EFFECT INT_VAR duration_high=stance_duration END
                PATCH_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN //forbid using blood and animal rage
                    LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=1 duration = stance_duration STR_VAR resource=~SPPR422~ END
                    LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=1 duration = stance_duration STR_VAR resource=~SPPR522~ END
                END                
                LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 206 duration = stance_duration  STR_VAR resource = ~SPDWD02~ END //protection from subsequent application
                LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 146 timing = 3 duration = stance_duration+1 parameter1 = 1 parameter2 = 1 STR_VAR resource = ~DWDFTG~ END //fatigue
                
            COPY_EXISTING ~DWDS1%con%.SPL~  ~override/DWDS2%con%.SPL~
                LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 248 duration =stance_duration STR_VAR resource = ~HLTBLW~ END
                   
            COPY_EXISTING ~DWDS2%con%.SPL~  ~override/DWDS3%con%.SPL~	
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 0  parameter1 = 4 END //ac
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 44  parameter1 = 4 END //str bonus
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 10  parameter1 = 4 END //con bonus
                //LPF ALTER_SPELL_EFFECT STR_VAR match_resource = ~ABNSTR2~  resource = ~ABNSTR4~ END //str bonus
                //LPF ALTER_SPELL_EFFECT STR_VAR match_resource = ~ABNCON2~  resource = ~ABNCON4~ END //con bonus
                FOR (save_opcode = 33;save_opcode<=37;save_opcode = save_opcode+1) BEGIN
                   LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = save_opcode  parameter1 = 2 END //saves
                END                
                
                LPF ALTER_SPELL_EFFECT_EX INT_VAR duration_high=stance_duration+6 END 
             
                LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 146 duration = stance_duration+7 END //fatigue
                       					       
            COPY_EXISTING ~DWDS3%con%.SPL~  ~override/DWDS4%con%.SPL~	
                LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 146 END //remove fatigue
                                    
        END
        

        WITH_TRA ~%LANGUAGE%\ability_changes.tra~ BEGIN      
            COPY_EXISTING ~SPDWD02.SPL~ ~override/SPDWD02.SPL~
            
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 1 END
                LPF ALTER_SPELL_HEADER INT_VAR header = 2 min_level = 5 END
                
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 2 END
                LPF ALTER_SPELL_HEADER INT_VAR header = 3 min_level = 10 END
        
                LPF ADD_SPELL_HEADER INT_VAR copy_header = 3 END
                LPF ALTER_SPELL_HEADER INT_VAR header = 4 min_level = 17 END
        
                LPF DELETE_EFFECT INT_VAR check_headers = 1 END
                LPF ADD_ABILITY_DEPENDENT_EFFECTS INT_VAR n_headers = 4 stat_begin = 10 stat_step = 2 stat_end = 24 stat_ge_par = 126 resist_dispel = 0 STR_VAR abil_name = ~DWDS~ END 
            
                READ_LONG 0x0050 ~descr_strref~
                STRING_SET_EVALUATE %descr_strref% @007	 
        END
              			  		        

 
     //------------------------------------------constant vocalize for mage-thiefs--------------------------------
     COPY_EXISTING ~SPWI219.SPL~ ~override/MT_VOC.SPL~
        LPF DELETE_EFFECT INT_VAR header =0 match_opcode = 50 END
        LPF DELETE_EFFECT INT_VAR header =0 match_opcode = 139 END
        LPF DELETE_EFFECT INT_VAR header =0 match_opcode = 174 END
        LPF DELETE_EFFECT INT_VAR header =0 match_opcode = 215 END
        LPF ALTER_SPELL_EFFECT INT_VAR timing = 1 resist_dispel = 0 duration = 1 END
     
    
    LAF ADD_FEATS_LVL INT_VAR min_level=8 max_level=8 d_level=1 add_at_level1=0 
        STR_VAR mask_file=~3ed/Feats/FeatAttribution/SFTCREMT.SPL~ clab=~CLABTH01\.2DA~ feat_name = ~MT_VOC~ caption=~MTVOCZ~ END
        
        
    //---------------------------------------blade defensive spin update to give +1 ac per 2 levels-------------
    WITH_TRA ~%LANGUAGE%\ability_changes.tra~ BEGIN 
        COPY_EXISTING ~SPCL522.SPL~ ~override~
            READ_SHORT 0x0068 Nheaders
            FOR (i=2;i<=Nheaders;i=i+1) BEGIN
                LPF ALTER_SPELL_HEADER INT_VAR header = i min_level = 2*i END         
            END
            READ_LONG 0x0050 ~descr_strref~
            STRING_SET_EVALUATE %descr_strref% @008   
    END
    
    //-----------------------------priest of tempus chaos of battle (cha dependent duration) update-----------------------------------------
   
    OUTER_SET n_spell_headers = 0
    OUTER_FOR (i=1;i<=25;i=i+6) BEGIN
        OUTER_SET n_spell_headers = n_spell_headers + 1 
        COPY_EXISTING ~ohtmps2D.SPL~ ~override/temD%n_spell_headers%.SPL~
            LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 321 END
            LPF ALTER_SPELL_HEADER INT_VAR target = 5 range = 0 END
            LPF DELETE_ALL_SPELL_HEADERS_EXCEPT_FIRST INT_VAR level_to_keep = i END 
        COPY_EXISTING ~ohtmps2E.SPL~ ~override/temE%n_spell_headers%.SPL~
            LPF DELETE_EFFECT INT_VAR check_headers = 1 match_opcode = 321 END
            LPF ALTER_SPELL_HEADER INT_VAR target = 5 range = 0 END
            LPF DELETE_ALL_SPELL_HEADERS_EXCEPT_FIRST INT_VAR level_to_keep = i END                     
    END

    OUTER_FOR (i=1;i<=n_spell_headers;i=i+1) BEGIN
        OUTER_FOR (cha = 10;cha<=24;cha=cha+2) BEGIN    
            OUTER_SET chaos_duration = 6*(3 + (cha - 10)/2)
            COPY_EXISTING ~temD%i%.SPL~ ~override/temD%i%%cha%.SPL~                 
                LPF ALTER_SPELL_EFFECT INT_VAR power = 0 duration_high=chaos_duration END
                
            COPY_EXISTING ~temE%i%.SPL~ ~override/temE%i%%cha%.SPL~
                LPF ALTER_SPELL_EFFECT INT_VAR power = 0 duration_high=chaos_duration END           
        END
    END
 
    COPY_EXISTING ~ohtmps2D.SPL~ ~override/ohtmps2D.SPL~
        LPF ALTER_SPELL_HEADER INT_VAR target = 5 range = 0 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 END
        LPF ADD_ABILITY_DEPENDENT_EFFECTS INT_VAR n_headers = n_spell_headers stat_begin = 10 stat_step = 2 stat_end = 24 
            stat_ge_par = 132 resist_dispel = 3 remove_in_effect = 1 STR_VAR abil_name = ~temD~ END 
        
    COPY_EXISTING ~ohtmps2E.SPL~ ~override/ohtmps2E.SPL~
        LPF ALTER_SPELL_HEADER INT_VAR target = 5 range = 0 END
        LPF DELETE_EFFECT INT_VAR check_headers = 1 END
        LPF ADD_ABILITY_DEPENDENT_EFFECTS INT_VAR n_headers = n_spell_headers stat_begin = 10 stat_step = 2 stat_end = 24
            stat_ge_par = 132 resist_dispel = 3 remove_in_effect = 1 STR_VAR abil_name = ~temE~ END 
        
    WITH_TRA ~%LANGUAGE%\ability_changes.tra~ BEGIN 
        COPY_EXISTING ~ohtmps2.SPL~ ~override~
            READ_LONG 0x0050 ~descr_strref~
            STRING_SET_EVALUATE %descr_strref% @009	
    END


    