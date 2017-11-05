


	COPY_EXISTING_REGEXP GLOB ~.*\.CRE~ ~override~
	

		SET LastCurrentResourceId = CurrentResourceId
		READ_LONG 0x02c4 effects_block_offset //beginning of global_effects table
		READ_LONG 0x02c8 n_effect //number of global_effects

		READ_BYTE 0x0033 EffVersion
		
		PATCH_IF (EffVersion)  BEGIN
			SET effect_size=0xd4 + 0x3c - 8//size of effect block
		END ELSE BEGIN
			SET effect_size=0x30 //size of effect block
		END
		
		
		SET FOUND = 0
		FOR (i=0;i<n_effect;i=i+1) BEGIN
			SET current_effect_offset = effects_block_offset + i*effect_size
			
			PATCH_IF (EffVersion) BEGIN
				READ_LONG (current_effect_offset+0x10 - 8) opcode
				READ_ASCII (current_effect_offset + 0x0030 - 8)  current_resource
			END ELSE BEGIN
				READ_SHORT current_effect_offset opcode
				READ_ASCII current_effect_offset + 0x0014  current_resource
			END
			
			PATCH_IF (opcode == 321 OR opcode == 206 OR opcode == 318 OR opcode == 207) BEGIN										
				//look if it is already in the array segment for this Spell
				SET found = 0
					
					FOR (i=LastCurrentResourceId; i< CurrentResourceId*(1 - found);i=i+1) BEGIN					
						SPRINT Resource_i  EVALUATE_BUFFER  $SpellProtRemovalsResource("%i%")
						SET EVALUATE_BUFFER Opcode_i  = $SpellProtRemovalsOpcode("%i%")
						PATCH_IF (~%Resource_i%~ STR_EQ ~%current_resource%~) AND (Opcode_i == opcode) BEGIN
							SET found = 1
						END						
					END
					// if not add it to the array
					PATCH_IF (NOT found) BEGIN		
                       
						DEFINE_ASSOCIATIVE_ARRAY SpellProtRemovalsResource BEGIN ~%CurrentResourceId%~ => ~%current_resource%~ END 
						DEFINE_ASSOCIATIVE_ARRAY SpellProtRemovalsOpcode BEGIN ~%CurrentResourceId%~ => ~%opcode%~ END 
						
						SET CurrentResourceId = CurrentResourceId + 1
					END							
			END	
			
		END


		
	PATCH_IF (CurrentResourceId != LastCurrentResourceId) BEGIN
		DEFINE_ASSOCIATIVE_ARRAY SpellsProtRemovals BEGIN
			~%LastCurrentResourceId%~, ~%CurrentResourceId%~ => ~%SOURCE_FILE%~				
		END
	END
		
		
