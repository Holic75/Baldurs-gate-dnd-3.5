	
	ACTION_CLEAR_ARRAY NinjaSpells
	COPY_EXISTING ~NinjaAbilitiesMap.2DA~ ~override~
		COUNT_2DA_ROWS 3 n_rows
		FOR (i=0;i<n_rows;i=i+1) BEGIN
			READ_2DA_ENTRY %i% 1 3 ninja_spell_name //school name 
			READ_2DA_ENTRY %i% 2 3 original_spell_name //school description 				
			DEFINE_ASSOCIATIVE_ARRAY NinjaSpells BEGIN "%ninja_spell_name%" => "%original_spell_name%" END
		END
	
	
	PRINT "Processing ninja spells..."
	ACTION_PHP_EACH NinjaSpells AS new_spell =>original_spell BEGIN
		LAF ADD_PROTECTION_REMOVALS STR_VAR original_spell new_spell END	
	END
	
	PRINT "Processing assasin spells..."	
	LAF ADD_PROTECTION_REMOVALS_ASSASIN_SPELLS END
	
	PRINT "Processing new spells..."
	ACTION_PHP_EACH extended_spell_list AS new_spell=>original_spell BEGIN
		LAF ADD_PROTECTION_REMOVALS STR_VAR original_spell new_spell END	
	END
	
	PRINT "Processing domain spells..."
	ACTION_PHP_EACH domain_list AS domain_i =>domain_file_name BEGIN
		OUTER_SET domain_id=domain_i
		OUTER_SPRINT domain_file_2DA EVALUATE_BUFFER ~%domain_file_name%~
		LAF ADD_PROTECTION_REMOVALS_PRIEST_DOMAIN STR_VAR domain_file_2DA END	
	END
	

	
	ACTION_PHP_EACH school_list AS school_i =>school_file_name BEGIN
		OUTER_SET school_id=school_i
		OUTER_SPRINT school_file_2DA EVALUATE_BUFFER ~%school_file_name%~
		PRINT "Processing spellfused warden spells... %school_id% / 8"
		LAF ADD_PROTECTION_REMOVALS_SPELLFUSED_WARDEN_SCHOOLS STR_VAR school_file_2DA END	
	END	
    
    PRINT "Processing bard songs..."
    ACTION_PHP_EACH bard_songs_to_check_for_prot_removals AS new_base_spell =>original_spell BEGIN
        OUTER_SET max_val=25
        OUTER_SET min_val=10
        OUTER_SET step=2
        OUTER_FOR (i=min_val;i<=max_val;i=i+step) BEGIN
            OUTER_SPRINT new_spell EVALUATE_BUFFER ~%new_base_spell%%i%~
            LAF ADD_PROTECTION_REMOVALS STR_VAR original_spell new_spell END	
        END
	END	
    