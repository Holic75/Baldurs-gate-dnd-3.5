
ACTION_DEFINE_ASSOCIATIVE_ARRAY ClassOnlyDescriptions BEGIN

	FIGHTER => 001
	FIGHTER_THIEF =>002
	FIGHTER_CLERIC =>003
	FIGHTER_MAGE =>004
    FIGHTER_MAGE_THIEF =>005
	FIGHTER_DRUID =>006
    FIGHTER_MAGE_CLERIC =>007
	PALADIN => 013
	RANGER => 018
	CLERIC_RANGER => 019
	CLERIC => 023
	CLERIC_MAGE => 024
	CLERIC_THIEF => 025
	DRUID => 030
	MAGE => 034
	MAGE_THIEF => 036
	THIEF => 037
	BARD => 043
	SORCERER=>047
	MONK => 049
	SHAMAN => 052
END

ACTION_DEFINE_ASSOCIATIVE_ARRAY ClassKitDescriptions BEGIN

	FIGHTER => 001
	FIGHTER_THIEF =>002
	FIGHTER_CLERIC =>003
	FIGHTER_MAGE =>004
    FIGHTER_MAGE_THIEF =>005
	FIGHTER_DRUID =>006
    FIGHTER_MAGE_CLERIC =>007
	PALADIN => 013
	RANGER => 018
	CLERIC_RANGER => 019
	CLERIC => 023
	CLERIC_MAGE => 024
	CLERIC_THIEF => 025
    
    LATHANDER => 026
    HELM => 027
    TALOS => 028
    OHTYR => 029
    
    GODLATHANDER => 026
    GODHELM => 027
    GODTALOS => 028
    
	DRUID => 030
	MAGE => 034
	MAGE_THIEF => 036
	THIEF => 037
	BARD => 043
	SORCERER=>047
	MONK => 049
	SHAMAN => 052
	
	BERSERKER => 008
	WIZARD_SLAYER => 009
	KENSAI => 010
	BARBARIAN => 011
	DWARVEN_DEFENDER => 012
	CAVALIER => 014
	INQUISITOR => 015
	UNDEAD_HUNTER => 016
	BLACKGUARD => 017   Blackguard => 017
	ARCHER => 020  FERALAN => 020
	BEAST_MASTER => 021 BEASTMASTER => 021
	STALKER => 022
	AVENGER => 031    BEAST_FRIEND => 031
	SHAPESHIFTER => 032
	TOTEMIC_DRUID => 033
	ASSASSIN => 39 ASSASIN => 39
	SWASHBUCKLER => 40
	BOUNTY_HUNTER => 41
	SHADOWDANCER => 42
	BLADE => 044
	SKALD => 045
	JESTER => 046
	DRAGON_DISCIPLE =>048
	DARK_MOON => 050
	SUN_SOUL =>051
	ABJURER =>053
	CONJURER =>054
	DIVINER =>055
	ENCHANTER => 056
	ILLUSIONIST =>057
	INVOKER => 058
	NECROMANCER =>059
	TRANSMUTER =>060
    WILDMAGE => 061
    WILD_MAGE => 061
    OHTEMPUS => 062
END


ACTION_DEFINE_ASSOCIATIVE_ARRAY ClassStrings BEGIN

	TOTEMIC_DRUID => 0330001
	BOUNTY_HUNTER => 0410001
	DRAGON_DISCIPLE => 0480001
    WIZARD_SLAYER => 00090001
	
END

COPY_EXISTING ~CLASTEXT.2DA~ ~Override~

	COUNT_2DA_ROWS 9 n_rows
	COUNT_2DA_COLS n_cols 
	
	FOR (i=0;i<n_rows;i=i+1) BEGIN
	
		READ_2DA_ENTRY i 0 9 class_string
		
		READ_2DA_ENTRY i 3 9 lower_string
		READ_2DA_ENTRY i 4 9 descr_string
		READ_2DA_ENTRY i 5 9 mixed_string
		READ_2DA_ENTRY i 8 9 brief_string
		
		PATCH_SILENT
		PATCH_TRY		//try to set kit description
			SET StrRef =  $ClassKitDescriptions(~%class_string%~)	
				
			INNER_ACTION BEGIN
				STRING_SET_EVALUATE %descr_string% (AT "StrRef")			
			END			
		WITH		
			DEFAULT
				PATCH_PRINT ~Description for %class_string% not found~
		END
		
		PATCH_SILENT
		PATCH_TRY		//try to set brief description
			SET StrRef =  $ClassOnlyDescriptions(~%class_string%~)			
			INNER_ACTION BEGIN
				STRING_SET_EVALUATE %brief_string% (AT "StrRef")			
			END			
		WITH		
			DEFAULT
					
		END

		PATCH_SILENT
		PATCH_TRY		//try to set string  names
			SET StrRefLower =  $ClassStrings(~%class_string%~)	
			SET StrRefMixed =  StrRefLower + 1				
			INNER_ACTION BEGIN
				STRING_SET_EVALUATE %lower_string% (AT "StrRefLower")
				STRING_SET_EVALUATE %mixed_string% (AT "StrRefMixed")					
			END			
		WITH		
			DEFAULT
					
		END		
		
		
	END
	
	// do the same for kitlist 2DA~
	COPY_EXISTING ~KITLIST.2DA~ ~Override~

	COUNT_2DA_ROWS 9 n_rows
	COUNT_2DA_COLS n_cols 
	
	FOR (i=0;i<n_rows;i=i+1) BEGIN
	
		READ_2DA_ENTRY i 1 9 class_string
		
		READ_2DA_ENTRY i 2 9 lower_string
		READ_2DA_ENTRY i 4 9 descr_string
		READ_2DA_ENTRY i 3 9 mixed_string
        READ_2DA_ENTRY i 8 9 class_ids

		
		PATCH_SILENT
		PATCH_TRY		//try to set kit description
			SET StrRef =  $ClassKitDescriptions(~%class_string%~)	
            LOOKUP_IDS_SYMBOL_OF_INT base_class_string ~class~ ~%class_ids%~
			INNER_ACTION BEGIN             
                OUTER_SPRINT kit_descr (AT "StrRef")
                OUTER_SET StrRefClass =  $ClassOnlyDescriptions(~%base_class_string%~)	
                OUTER_SPRINT class_descr (AT "StrRefClass")
                //add description of base class to the bottom of kit description
                OUTER_SPRINT kit_descr EVALUATE_BUFFER ~%kit_descr%


Base Class Description

                
%class_descr%~                
				STRING_SET_EVALUATE %descr_string% ~%kit_descr%~			
			END			
		WITH		
			DEFAULT
				PATCH_PRINT ~Description for %class_string% not found~
		END
		
		PATCH_SILENT
		PATCH_TRY		//try to set string  names
			SET StrRefLower =  $ClassStrings(~%class_string%~)	
			SET StrRefMixed =  StrRefLower + 1				
			INNER_ACTION BEGIN
				STRING_SET_EVALUATE %lower_string% (AT "StrRefLower")
				STRING_SET_EVALUATE %mixed_string% (AT "StrRefMixed")					
			END			
		WITH		
			DEFAULT
					
		END		
		
		
	END
	
	VERBOSE
	
	
	
	
