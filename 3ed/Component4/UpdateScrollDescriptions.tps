
	//map scroll descriptions to their respective spells
	COPY_EXISTING_REGEXP GLOB ~.+\.ITM~ ~override~
		 READ_SHORT 0x001c "category"
		 PATCH_IF (category = 11) BEGIN //scrolls
			LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 147 RET spell_name = resource found = found_match END
		
			PATCH_IF NOT found BEGIN
				LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 146 RET spell_name = resource found = found_match END
			END
			
			PATCH_IF NOT found BEGIN
				LPF GET_SPELL_EFFECT_VALUES INT_VAR match_opcode = 148 RET spell_name = resource found = found_match END
			END
			
			SET descr_strref = 0
			PATCH_IF (found) BEGIN
		
				INNER_ACTION BEGIN
					COPY_EXISTING ~%spell_name%.SPL~ ~override~
						READ_LONG 0x0050 descr_strref
				END
			
				WRITE_LONG 0x0054 descr_strref
		
			END
		END
		