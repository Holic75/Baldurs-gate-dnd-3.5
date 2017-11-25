
		OUTER_SET start_chance=30
		OUTER_SET per_level_chance=1
		OUTER_SET start_inquisitor_chance=60
		OUTER_SET per_lvl_inquisitor_chance=2
		
		OUTER_SET dispel_mage_ref = 008 
		OUTER_SET dispel_priest_ref = 007 
		OUTER_SET remove_ref = 009
			
		
		
		//dispels
		
		ACTION_DEFINE_ASSOCIATIVE_ARRAY DispelList BEGIN
		
			SPPR303 =>~%dispel_priest_ref%~
			SPWI326 =>~%dispel_mage_ref%~
			SPWI302 =>~%remove_ref%~
			
		END
		
		ACTION_IF (~%GameId%~ STR_EQ ~Bg1~) BEGIN
			ACTION_DEFINE_ASSOCIATIVE_ARRAY DispelList BEGIN
				SPIN112 =>~%dispel_priest_ref%~
			END
		END
		
		
		//get dispel str_ref		
		COPY_EXISTING ~SPCL231.SPL~ ~override~
			LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 139 RET DispelStrRef = parameter1 END
			
			
		OUTER_FOR (i=1;i<=30;i=i+1) BEGIN
			OUTER_SET ch=start_chance+i*per_level_chance
			
			ACTION_IF (ch>100) BEGIN
				OUTER_SET ch = 100
			END
			
			OUTER_SET inquisitor_ch=start_inquisitor_chance+i*per_lvl_inquisitor_chance
			ACTION_IF (inquisitor_ch>100) BEGIN
				OUTER_SET inquisitor_ch = 100
			END
			
			COPY ~3ed/Spells/DispelMagic/DSP_E.SPL~ ~override/DSP_E%i%.SPL~
				LPF ALTER_SPELL_EFFECT INT_VAR  probability1 = ch END
				LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 139 parameter1 = DispelStrRef  END
				
			COPY ~3ed/Spells/DispelMagic/DSP_E.SPL~ ~override/DSP_I%i%.SPL~
				LPF ALTER_SPELL_EFFECT INT_VAR probability1 = inquisitor_ch END
				LPF ALTER_SPELL_EFFECT INT_VAR  match_opcode = 139 parameter1 = DispelStrRef  END
				
		END
		
		ACTION_PHP_EACH DispelList AS SpellName =>StrRef BEGIN
			COPY_EXISTING ~%SpellName%.SPL~ ~override~		
			//creating spell headers for levels 2-30
				FOR (k=2;k<=30;k=k+1) BEGIN
					LPF ADD_SPELL_HEADER  INT_VAR  copy_header=1 END	
					LPF ALTER_SPELL_HEADER INT_VAR  header=k min_level=k END
				END
				//adding dispel effects
				FOR (k=1;k<=30;k=k+1) BEGIN
					SPRINT resource EVALUATE_BUFFER ~DSP_E%k%~
					LPF ADD_SPELL_EFFECT INT_VAR header=k opcode=326 power=10 target=2 timing=0 duration=1 STR_VAR resource END	
				END
				LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=58 END	
				LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=139 END	
				READ_LONG 0x0050 ~descr_strref~	
				STRING_SET_EVALUATE %descr_strref% (AT "StrRef")
				
		END
		
		//inquisitor dispels
		COPY_EXISTING ~SPCL231.SPL~ ~override~ 
			//spell headers are already created for inquisitor
			//adding dispel effects
			READ_SHORT 0x0068 NumHeaders
			FOR (k=1;k<=NumHeaders;k=k+1) BEGIN
				SPRINT resource EVALUATE_BUFFER ~DSP_I%k%~
				LPF ADD_SPELL_EFFECT INT_VAR header=k opcode=326 power=10 target=2 timing=0 duration=1 STR_VAR resource END	
			END
				LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=58 END	
				LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete=139 END	

				READ_LONG 0x0050 ~descr_strref~
				STRING_SET_EVALUATE %descr_strref% (AT "dispel_priest_ref")

	
	
		
	
	

