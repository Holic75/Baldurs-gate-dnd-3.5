	OUTER_SET min_val=10
	OUTER_SET max_val=25
	OUTER_SET step=2
	OUTER_SET par1=128 //intelligence >=
	
	COPY ~3ed/Classes/Assassin/Spells/SPELLMAP.2DA~ ~override~
		COUNT_2DA_ROWS 3 n_rows
		FOR (i=0;i<n_rows;i=i+1) BEGIN
			READ_2DA_ENTRY i 1 3 new_spell_name 
			READ_2DA_ENTRY i 2 3 spell_name 
			INNER_ACTION BEGIN //create innate copies of spells
				COPY_EXISTING ~%spell_name%.SPL~ ~override/%new_spell_name%.SPL~
					LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_type=4 END			
			END
		END
		
	COPY ~3ed/Classes/Assassin/Spells/Bam~ ~override~
	COPY ~3ed/Classes/Assassin/Spells/SpellList~ ~override~
	OUTER_FOR (i=1;i<=4;i=i+1) BEGIN
		COPY ~3ed/Classes/Assassin/Spells/ASN.SPL~ ~override/ASNL%i%.SPL~
			SPRINT spell_list_2DA EVALUATE_BUFFER ~ASN0%i%~
			SPRINT icon EVALUATE_BUFFER ~ASN%i%~
			LPF CREATE_PSEUDO_SPELL_SELECTION INT_VAR min_val max_val step par1 header_lvl=i STR_VAR spell_list_2DA icon END	
			
			SET SpellName=1200+2*(i - 1)+1
			SET SpellDescription=1200+2*i
			SAY NAME1 (AT "SpellName")
			SAY UNIDENTIFIED_DESC (AT "SpellDescription")	
	END
	
	
	COPY ~3ed/Classes/Assassin/Spells/GVASN.SPL~ ~override/GVASN.SPL~
		FOR (i=1;i<=20;i=i+1) BEGIN
			LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=4 target=5 target_count=0 range=1 required_level=i speed=1 projectile=1 END
			READ_SHORT 0x68 n_headers //number of extended_headers
			
			FOR (j=4;j<=i;j=j+4) BEGIN //1st lvl
				LPF ADD_SPELL_EFFECT INT_VAR header=n_headers opcode=171 power=10 target=2 timing=0 duration=1 STR_VAR resource=~ASNL1~ END 				
			END	
			
			FOR (j=7;j<=i;j=j+4) BEGIN //2nd lvl
				LPF ADD_SPELL_EFFECT INT_VAR header=n_headers opcode=171 power=10 target=2 timing=0 duration=1 STR_VAR resource=~ASNL2~ END 				
			END	
			
			FOR (j=10;j<=i;j=j+4) BEGIN //3rd lvl
				LPF ADD_SPELL_EFFECT INT_VAR header=n_headers opcode=171 power=10 target=2 timing=0 duration=1 STR_VAR resource=~ASNL3~ END 				
			END	
			
			FOR (j=13;j<=i;j=j+4) BEGIN //4th lvl
				LPF ADD_SPELL_EFFECT INT_VAR header=n_headers opcode=171 power=10 target=2 timing=0 duration=1 STR_VAR resource=~ASNL4~ END 				
			END	
			
			PATCH_IF (i=20) BEGIN
				LPF ADD_SPELL_EFFECT INT_VAR header=n_headers opcode=171 power=10 target=2 timing=0 duration=1 STR_VAR resource=~ASNL4~ END
			END
			

		END
	
		OUTER_FOR (i=1;i<=4;i=i+1) BEGIN
			COPY ~3ed/Classes/Assassin/Spells/GVASN.SPL~ ~override/GVASN%i%.SPL~
				LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=4 target=5 target_count=0 range=1 speed=1 projectile=1 END
				SPRINT resource EVALUATE_BUFFER ~ASNL%i%~
			    LPF ADD_SPELL_EFFECT INT_VAR opcode=171 power=10 target=2 timing=0 duration=1  STR_VAR resource END 				
		END		
		
		OUTER_SET id=1
	OUTER_FOR (k=12;k<=18;k=k+2) BEGIN	
		COPY ~3ed/Classes/Assassin/Spells/GVASN.SPL~ ~override/BNASN%id%.SPL~
			SPRINT resource EVALUATE_BUFFER ~GVASN%id%~
			LPF ADD_SPELL_HEADER  INT_VAR  required_level=1 type=1 location=4 target=5 target_count=0 range=1 speed=1 projectile=1 END
			FOR (i=k;i<=max_val;i=i+8) BEGIN			
				LPF ADD_SPELL_EFFECT INT_VAR opcode=326 power=10 target=2 timing=0 duration=1 parameter2=par1 parameter1=i STR_VAR resource END 
			END
		SET id=id+1
	END
		
								
	COPY ~3ed/Classes/Assassin/Spells/GVASN.SPL~ ~override/BNASN.SPL~
		//1st lvl
		LPF ADD_SPELL_HEADER  INT_VAR  required_level=1 type=1 location=4 target=5 target_count=0 range=1 speed=1 projectile=1 END
		LPF ADD_SPELL_EFFECT INT_VAR opcode=326 power=10 target=2 timing=0 duration=1 STR_VAR resource=~BNASN1~ END
		//2nd lvl
		LPF ADD_SPELL_HEADER  INT_VAR  copy_header=1 END
		LPF ALTER_SPELL_HEADER INT_VAR  header=2 min_level=7 END
		LPF ADD_SPELL_EFFECT INT_VAR header=2 opcode=326 power=10 target=2 timing=0 duration=1 STR_VAR resource=~BNASN2~ END		
		//3rd lvl
		LPF ADD_SPELL_HEADER  INT_VAR  copy_header=2 END
		LPF ALTER_SPELL_HEADER INT_VAR  header=3 min_level=10 END
		LPF ADD_SPELL_EFFECT INT_VAR header=3 opcode=326 power=10 target=2 timing=0 duration=1 STR_VAR resource=~BNASN3~ END	
		//4th lvl
		LPF ADD_SPELL_HEADER  INT_VAR  copy_header=3 END
		LPF ALTER_SPELL_HEADER INT_VAR  header=4 min_level=13 END
		LPF ADD_SPELL_EFFECT INT_VAR header=4 opcode=326 power=10 target=2 timing=0 duration=1 STR_VAR resource=~BNASN4~ END	
			
		
	COPY ~3ed/Classes/Assassin/Spells/ASN.SPL~ ~override/RMASN.SPL~
		LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=4 target=5 target_count=0 range=1 speed=1 projectile=1 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode=172 power=10 target=2 timing=0 duration=1 STR_VAR resource=~ASNL1~ END 
			LPF ADD_SPELL_EFFECT INT_VAR opcode=172 power=10 target=2 timing=0 duration=1 STR_VAR resource=~ASNL2~ END 
			LPF ADD_SPELL_EFFECT INT_VAR opcode=172 power=10 target=2 timing=0 duration=1 STR_VAR resource=~ASNL3~ END
			LPF ADD_SPELL_EFFECT INT_VAR opcode=172 power=10 target=2 timing=0 duration=1 STR_VAR resource=~ASNL4~ END 			



	//script for giving assasin spells
	OUTER_FOR (player_id=1;player_id<=6;player_id=player_id + 1) BEGIN
		EXTEND_TOP_REGEXP ~\(BD\)*BALDUR.+\.BCS~ ~3ed/Classes/Assassin/Spells/ASN.baf~
			EVALUATE_BUFFER			
	END

	//give spells at lvl ups
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=16 d_level=4 add_at_level1=0 
						STR_VAR clab=~CLABTH02\.2DA~ mask_file=~~ caption=~GVASN1~ END	
	LAF ADD_BONUS_FEATS INT_VAR min_level=4 max_level=4 d_level=4 add_at_level1=0 
						STR_VAR clab=~CLABTH02\.2DA~ mask_file=~~ caption=~BNASN1~ END
						
	LAF ADD_BONUS_FEATS INT_VAR min_level=7 max_level=19 d_level=4 add_at_level1=0 
						STR_VAR clab=~CLABTH02\.2DA~ mask_file=~~ caption=~GVASN2~ END	
	LAF ADD_BONUS_FEATS INT_VAR min_level=7 max_level=7 d_level=4 add_at_level1=0 
						STR_VAR clab=~CLABTH02\.2DA~ mask_file=~~ caption=~BNASN2~ END
						
	LAF ADD_BONUS_FEATS INT_VAR min_level=10 max_level=18 d_level=4 add_at_level1=0 
						STR_VAR clab=~CLABTH02\.2DA~ mask_file=~~ caption=~GVASN3~ END	
	LAF ADD_BONUS_FEATS INT_VAR min_level=10 max_level=10 d_level=4 add_at_level1=0 
						STR_VAR clab=~CLABTH02\.2DA~ mask_file=~~ caption=~BNASN3~ END
						
	LAF ADD_BONUS_FEATS INT_VAR mask=0b10010001000000000000 
						STR_VAR clab=~CLABTH02\.2DA~ mask_file=~~ caption=~GVASN4~ END
	LAF ADD_BONUS_FEATS INT_VAR min_level=13 max_level=13 d_level=4 add_at_level1=0 
						STR_VAR clab=~CLABTH02\.2DA~ mask_file=~~ caption=~BNASN4~ END	