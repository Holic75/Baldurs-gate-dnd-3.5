

	OUTER_SET   yes_response = RESOLVE_STR_REF (@600001)
	OUTER_SET   no_response = RESOLVE_STR_REF (@600002)
    
    ACTION_CLEAR_ARRAY SpellMinLevel
	ACTION_DEFINE_ARRAY SpellMinLevel BEGIN
	//  class_name      lvl1 lvl2 lvl3 lvl4  lvl5  lvl6  lvl7  lvl8  lvl9
        ~MAGE~          ~1~  ~3~  ~5~  ~7~   ~9~   ~11~  ~13~  ~15~  ~17~
        ~MAGE_THIEF~    ~2~  ~4~  ~6~  ~8~  ~10~  ~12~  ~14~  ~16~  ~18~
        ~CLERIC_MAGE~   ~2~  ~4~  ~6~  ~8~  ~10~  ~12~  ~14~  ~16~  ~18~
        ~BARD~          ~1~  ~4~  ~7~  ~10~  ~13~  ~16~  ~99~  ~99~  ~99~
~FIGHTER_MAGE~          ~1~  ~4~  ~7~  ~10~  ~13~  ~16~  ~19~  ~99~  ~99~
~FIGHTER_MAGE_CLERIC~   ~2~  ~5~  ~8~  ~11~  ~14~  ~17~  ~20~  ~99~  ~99~
~FIGHTER_MAGE_THIEF~    ~2~  ~5~  ~8~  ~11~  ~14~  ~17~  ~20~  ~99~  ~99~
	END
    
    //create condition strings
    OUTER_FOR (lvl=1;lvl<=9;lvl=lvl+1) BEGIN
        OUTER_SPRINT cond_str ~~
        OUTER_FOR (class_line = 0;class_line<7; class_line = class_line+1) BEGIN
           OUTER_SET class_idx = class_line*10
           OUTER_SET lvl_idx = class_idx + lvl
           OUTER_SPRINT class_name EVALUATE_BUFFER $SpellMinLevel("%class_idx%")
           OUTER_SET EVALUATE_BUFFER char_level = $SpellMinLevel("%lvl_idx%")
           OUTER_SET char_level = char_level - 1
           OUTER_SPRINT cond_str EVALUATE_BUFFER ~%cond_str%
        OR(2)
            !Class(LastSummonerOf(Myself),%class_name%)
            LevelGT(LastSummonerOf(Myself),%char_level%)~
        END                    
        OUTER_SPRINT EVALUATE_BUFFER ~level%lvl%_cond_str~ EVALUATE_BUFFER ~%cond_str%~ 
        OUTER_SPRINT EVALUATE_BUFFER ~level%lvl%_spell_list~ ~~ 
        
    END
    
    //spells to exclude
    ACTION_CLEAR_ARRAY exclude_spells
    OUTER_SET k=0
    COPY_EXISTING ~hidespl.2DA~ ~override~
        COUNT_2DA_ROWS 4 n_rows
        FOR (i=0;i<n_rows;i=i+1) BEGIN				
            READ_2DA_ENTRY %i% 0 4 spl_file //spell name without spl extension
            PATCH_IF NOT (~%spl_file%~ STRING_MATCHES_REGEXP ~SPWI[1-9].+~) BEGIN
                DEFINE_ASSOCIATIVE_ARRAY exclude_spells BEGIN  "%k%" => "%spl_file%" END
                k=k+1
            END
        END
        
        
    //create a map of spell to scroll    
    ACTION_CLEAR_ARRAY SpellScrollMap
    COPY_EXISTING_REGEXP GLOB ~SCRL.*\.ITM~ ~override~
    	READ_SHORT 0x001c "category"
		PATCH_IF (category = 11) BEGIN //scrolls
			LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 147 RET spell_name = resource found = found_match END
        END
        
        PATCH_IF (found) BEGIN	
            TO_UPPER spell_name
            SPRINT scroll_name EVALUATE_BUFFER  $SpellScrollMap("%spell_name%")	
            PATCH_IF (~%scroll_name%~ STR_EQ ~SpellScrollMap_%spell_name%~) BEGIN
                DEFINE_ASSOCIATIVE_ARRAY SpellScrollMap BEGIN  ~%spell_name%~ => ~%SOURCE_RES%~ END
                SPRINT scroll_name EVALUATE_BUFFER  $SpellScrollMap("%spell_name%")	              
            END

        END
        
        
    ACTION_CLEAR_ARRAY KitMasks
    //create spell lists
    ACTION_DEFINE_ASSOCIATIVE_ARRAY  KitMasks  BEGIN
        ~MAGESCHOOL_ABJURER~     => ~0b1000000~
        ~MAGESCHOOL_CONJURER~    => ~0b10000000~
        ~MAGESCHOOL_DIVINER~     => ~0b100000000~
        ~MAGESCHOOL_ENCHANTER~   => ~0b1000000000~
        ~MAGESCHOOL_ILLUSIONIST~ => ~0b10000000000~
        ~MAGESCHOOL_INVOKER~     => ~0b100000000000~
        ~MAGESCHOOL_NECROMANCER~ => ~0b1000000000000~
        ~MAGESCHOOL_TRANSMUTER~  => ~0b10000000000000~
    END
    
    OUTER_SPRINT spell_entries ~~
    OUTER_SET entry_id = 100
    COPY_EXISTING_REGEXP GLOB ~SPWI[1-9][0-9]+\.spl~ ~override~
        READ_SHORT 0x1c "spell_type"
        READ_SHORT 0x34 "spell_level"
        READ_SHORT 0x001e "flags" 
        READ_BYTE  0x0025 "school" 
        READ_LONG  0x0008 "spell_name_ref"
        READ_LONG  0x0050 "spell_descr_ref"
        SET castable = NOT (flags BAND 0b0100000000000000)
        SPRINT spell_name EVALUATE_BUFFER ~%SOURCE_RES%~
        TO_UPPER spell_name
        PATCH_IF (castable AND spell_level<10 AND spell_level>0 AND spell_type == 1) BEGIN
            SET exclude=0
            PHP_EACH exclude_spells AS spell_id=>spell_file_name BEGIN
                PATCH_IF (NOT exclude) AND (~%spell_name%~ STR_EQ ~%spell_file_name%~) BEGIN               
                    SET exclude=1
                END
            END
            //try to extract the correspondng scroll
            PATCH_IF (NOT exclude) BEGIN	
                SPRINT scroll_name EVALUATE_BUFFER  $SpellScrollMap("%spell_name%")	
                PATCH_IF (~%scroll_name%~ STR_EQ ~SpellScrollMap_%spell_name%~) BEGIN
                    SET exclude = 1
                END
                ELSE BEGIN	
                    SET exclude = 0
                END                     
                         
            END
            
            
            PATCH_IF (NOT exclude) BEGIN   
                SET entry_id = entry_id + 1
                SPRINT kit_exclusion ~True()~
                PHP_EACH KitMasks AS kit_name => mask BEGIN
                    PATCH_IF (mask BAND flags) BEGIN
                        SPRINT kit_exclusion EVALUATE_BUFFER ~%kit_exclusion%
        !Kit(LastSummonerOf(Myself),%kit_name%)~ 
                    END
                END                
                SPRINT spell_list_entry EVALUATE_BUFFER "IF ~%kit_exclusion%~ REPLY #%spell_name_ref% GOTO %entry_id% " 
                SPRINT EVALUATE_BUFFER ~string_ref~ EVALUATE_BUFFER ~level%spell_level%_spell_list~ 
                SPRINT string_ref EVALUATE_BUFFER ~%%string_ref%%
    %spell_list_entry%~ 
                SPRINT EVALUATE_BUFFER ~level%spell_level%_spell_list~ EVALUATE_BUFFER ~%string_ref%~
                //create spell entries
                SET level_id = 10 + spell_level
                SPRINT spell_entries EVALUATE_BUFFER ~~~~~%spell_entries%

                
IF ~~ THEN BEGIN %entry_id% 
    SAY #%spell_descr_ref%
    IF ~True()~ THEN REPLY #%yes_response% DO ~GiveItemCreate("%scroll_name%",LastSummonerOf(Myself),1,1,0)~ EXIT
    IF ~True()~ THEN REPLY #%no_response% GOTO %level_id%
END~~~~~
            END			
        END
    
    
    COPY_EXISTING ~3ed/Feats/MageNewSpells/mage_sl.d~ ~override~									
        EVALUATE_BUFFER	
        COMPILE ~override/mage_sl.d~ 
		
		
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.CRE~ ~override/MSFTCRE.CRE~
		WRITE_ASCII 0x248 ~SFTCRE~ #8//override script
		WRITE_ASCII 0x02cc ~mage_sl~ #8//dialog
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.EFF~ ~override/MSFTCRE.EFF~
		WRITE_ASCII 0x0030 ~MSFTCRE~ #8//creature name
	COPY ~3ed/Feats/FeatAttribution/FEATCRE.SPL~ ~override/MSFTCRE.SPL~	
		LPF  ALTER_SPELL_EFFECT INT_VAR match_opcode=177 STR_VAR resource=~MSFTCRE~ END
		
	//apply to all arcane casters who learn spells
	LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=0 delay = 5
		STR_VAR clab=~\(\(CLABMA.*\)\|\(CLABBA.*\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRENS.SPL~
		feat_type_file=~MSFTCRE~ caption=~MSSL_FT~ END
    //one more time for pure mages and cleric mages   
    LAF ADD_BONUS_FEATS INT_VAR min_level=2 max_level=30 d_level=1 add_at_level1=0 delay = 6
		STR_VAR clab=~CLABMA.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRCMM.SPL~
		feat_type_file=~MSFTCRE~ caption=~MSSL2FT~ END
			
			
       