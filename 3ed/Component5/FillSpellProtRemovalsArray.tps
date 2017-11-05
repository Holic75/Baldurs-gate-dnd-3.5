
	COPY_EXISTING_REGEXP GLOB ~.*\.SPL~ ~override~
	
		SET LastCurrentResourceId = CurrentResourceId
		SET Found = 0
		READ_LONG 0x64 header_block_offset //beginning of extended_headers table
		READ_LONG 0x6a effects_block_offset //beginning of effects table
		READ_SHORT 0x68 n_headers //number of extended_headers
		
		READ_SHORT 0x6e global_effects_block_offset //beginning of global_effects table
		READ_SHORT 0x70 n_global_effect //number of global_effects

		
		SET effect_size=0x30 //size of effect block
		SET header_size=0x28 //size of header block
		
		SET relative_effects_offset=0x0020
		SET relative_n_effects_offset=0x001e

		FOR (i=0;i<=n_headers;i=i+1) BEGIN
		
			PATCH_IF (i == n_headers) BEGIN
				SET n_effects = n_global_effect
				SET current_effect_offset =  global_effects_block_offset
			END ELSE BEGIN		
				SET current_header_offset = header_block_offset+i*header_size
				READ_SHORT current_header_offset+relative_n_effects_offset   n_effects //number of effects in the header
				READ_SHORT current_header_offset+relative_effects_offset     current_effect_offset //offset to effects of the header
			END
			
			SET current_effect_offset=effects_block_offset + current_effect_offset*effect_size
			
		
			FOR (j=0;j<n_effects;j=j+1) BEGIN
								
				READ_SHORT current_effect_offset opcode										
				PATCH_IF (opcode == 321 OR opcode == 206 OR opcode == 318 OR opcode == 207) BEGIN		
					READ_ASCII current_effect_offset + 0x0014  current_resource
					
					//look if it is already in the array segment for this spell
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
				SET current_effect_offset = current_effect_offset +effect_size						
			END		
		END
		
		PATCH_IF (CurrentResourceId != LastCurrentResourceId) BEGIN
			DEFINE_ASSOCIATIVE_ARRAY SpellsProtRemovals BEGIN
				~%LastCurrentResourceId%~, ~%CurrentResourceId%~ => ~%SOURCE_FILE%~				
			END
		END
		
		
