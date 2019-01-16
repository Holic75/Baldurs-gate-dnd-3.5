	COPY ~3ed/BardSongs/Bam~ ~override~
    
    COPY_EXISTING ~SPWI205.SPL~ ~override~ //get "panic" strref
        LPF GET_SPELL_EFFECT_VALUES INT_VAR header =  1 match_opcode = 139 RET panic_strref = parameter1 END
	COPY ~3ed/BardSongs/Songs/BARD1.SPL~ ~override~ //inspire courage
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 267  parameter1 = panic_strref END
		SAY NAME1 @001
		SAY UNIDENTIFIED_DESC @002
	COPY ~3ed/BardSongs/Songs/BARD2.SPL~ ~override~ //countersong
		SAY NAME1 @003
		SAY UNIDENTIFIED_DESC @004	
		
	COPY ~3ed/BardSongs/Songs/BARD3.SPL~ ~override~ //inspire competence
		SAY NAME1 @005
		SAY UNIDENTIFIED_DESC @006
		
	COPY ~3ed/BardSongs/Songs/BARD4.SPL~ ~override~ //fascinate
		SAY NAME1 @007
		SAY UNIDENTIFIED_DESC @008
		DEFINE_ASSOCIATIVE_ARRAY bard_songs_to_check_for_prot_removals BEGIN  "BARD4" => "SPWI220" END //power word sleep
        
    COPY_EXISTING ~SPPR113.SPL~ ~override~ //get "doomed" strref
        LPF GET_SPELL_EFFECT_VALUES INT_VAR header =  1 match_opcode = 139 RET doomed_strref = parameter1 END
    
	COPY ~3ed/BardSongs/Songs/BARD5.SPL~ ~override~ //dirge of doom
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 139 parameter1 = doomed_strref END
		SAY NAME1 @009
		SAY UNIDENTIFIED_DESC @010       
        DEFINE_ASSOCIATIVE_ARRAY bard_songs_to_check_for_prot_removals BEGIN  "BARD5" => "SPPR113" END //doom
		
	COPY ~3ed/BardSongs/Songs/BARD6.SPL~ ~override~ //inspire competence
		SAY NAME1 @011
		SAY UNIDENTIFIED_DESC @012
        
        
	COPY ~3ed/BardSongs/Songs/BARD7.SPL~ ~override~ //soothing performance
        LPF DELETE_SPELL_EFFECT INT_VAR opcode_to_delete = 139 END
    COPY_EXISTING ~BARD7.SPL~ ~override~
		FOR (i=0;i<=20;i=i+1) BEGIN         
			LPF ADD_SPELL_HEADER  INT_VAR insert_point=i+2 copy_header=1 END
			LPF ALTER_SPELL_HEADER  INT_VAR header=i+2 min_level = i+10 END
			LPF ALTER_SPELL_EFFECT INT_VAR header=i+2 match_opcode = 17 parameter1 = i+10 END
		END	
		SAY NAME1 @013
		SAY UNIDENTIFIED_DESC @014
	
    COPY_EXISTING ~SPWI205.SPL~ ~override~ //get "panic" strref
        LPF GET_SPELL_EFFECT_VALUES INT_VAR header =  1 match_opcode = 139 RET panic_strref = parameter1 END
	COPY ~3ed/BardSongs/Songs/BARD8.SPL~ ~override~ //firghtening tune
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 139 parameter1 = panic_strref END
		SAY NAME1 @015
		SAY UNIDENTIFIED_DESC @016
        DEFINE_ASSOCIATIVE_ARRAY bard_songs_to_check_for_prot_removals BEGIN  "BARD8" => "SPWI205" END //horror
		
	COPY ~3ed/BardSongs/Songs/BARD9.SPL~ ~override~ //inspire heroics
		SAY NAME1 @017
		SAY UNIDENTIFIED_DESC @018
		
	COPY ~3ed/BardSongs/Songs/BARDA.SPL~ ~override~ //deadly performance
		SAY NAME1 @019
		SAY UNIDENTIFIED_DESC @020
        DEFINE_ASSOCIATIVE_ARRAY bard_songs_to_check_for_prot_removals BEGIN  "BARDA" => "SPWI913" END //wail of banshee
		
    COPY_EXISTING ~SPWI401.SPL~ ~override~ //get "confused" strref
        LPF GET_SPELL_EFFECT_VALUES INT_VAR header =  1 match_opcode = 139 RET confused_strref = parameter1 END    
	COPY ~3ed/BardSongs/Songs/BARDB.SPL~ ~override~ //jester's song
        LPF ALTER_SPELL_EFFECT INT_VAR match_opcode = 139 parameter1 = confused_strref END
		SAY NAME1 @021
		SAY UNIDENTIFIED_DESC @022
        DEFINE_ASSOCIATIVE_ARRAY bard_songs_to_check_for_prot_removals BEGIN  "BARDB" => "SPWI401" END //confusion
		
	COPY ~3ed/BardSongs/Songs/BARDC.SPL~ ~override~ //song of requiem
		FOR (i=1;i<=3;i=i+1) BEGIN
			LPF ADD_SPELL_HEADER  INT_VAR insert_point=i+1 copy_header=1 END
			LPF ALTER_SPELL_HEADER  INT_VAR header=i+1 min_level = i*2+24 END
			LPF ALTER_SPELL_EFFECT INT_VAR header=i+1 match_opcode = 12 parameter1 = i+12 END
		END
		SAY NAME1 @023
		SAY UNIDENTIFIED_DESC @024
		
	
	OUTER_SET max_val=25
	OUTER_SET min_val=10
	OUTER_SET step=2
	
	

	//bard
	COPY ~3ed/BardSongs/Bard~ ~override~
		SPRINT string EVALUATE_BUFFER ~%SOURCE_RES%~
		LPF SUBSTRING INT_VAR start=4 length=2 STR_VAR string RET k=substring END
		DEFINE_ASSOCIATIVE_ARRAY bard_song_list BEGIN "%k%" => "%SOURCE_RES%" END
		
	COPY ~3ed/BardSongs/BSNG.SPL~ ~override/BSNG.SPL~
		PHP_EACH bard_song_list AS header_lvl =>spell_list_2DA BEGIN			
			LPF CREATE_PSEUDO_SPELL_SELECTION INT_VAR min_val max_val step par1=132 header_lvl STR_VAR spell_list_2DA icon=~BARD0~ END
		END
		SAY NAME1 @031
		SAY UNIDENTIFIED_DESC @032	
	//jester	
	COPY ~3ed/BardSongs/Jester~ ~override~
		SPRINT string EVALUATE_BUFFER ~%SOURCE_RES%~
		LPF SUBSTRING INT_VAR start=4 length=2 STR_VAR string RET k=substring END
		DEFINE_ASSOCIATIVE_ARRAY jester_song_list BEGIN "%k%" => "%SOURCE_RES%" END
		
	COPY ~3ed/BardSongs/BSNG.SPL~ ~override/JSNG.SPL~
		PHP_EACH jester_song_list AS header_lvl =>spell_list_2DA BEGIN			
			LPF CREATE_PSEUDO_SPELL_SELECTION INT_VAR min_val max_val step par1=132 header_lvl STR_VAR spell_list_2DA icon=~BARD0~ END
		END
		SAY NAME1 @031
		SAY UNIDENTIFIED_DESC @034
		
	//blade and skald	
	COPY ~3ed/BardSongs/SkaldBlade~ ~override~
		SPRINT string EVALUATE_BUFFER ~%SOURCE_RES%~
		LPF SUBSTRING INT_VAR start=4 length=2 STR_VAR string RET k=substring END
		DEFINE_ASSOCIATIVE_ARRAY skald_song_list BEGIN "%k%" => "%SOURCE_RES%" END
		
	COPY ~3ed/BardSongs/BSNG.SPL~ ~override/SSNG.SPL~
		PHP_EACH skald_song_list AS header_lvl =>spell_list_2DA BEGIN			
			LPF CREATE_PSEUDO_SPELL_SELECTION INT_VAR min_val max_val step par1=132 header_lvl STR_VAR spell_list_2DA icon=~BARD0~ END
		END		
		SAY NAME1 @031
		SAY UNIDENTIFIED_DESC @033
		
		
		
	//eff files for kit masks 
	
	COPY ~3ed/BardSongs/GVSONG.EFF~ ~override/GVBSNG.EFF~
		WRITE_ASCII 0x0030 ~BSNG~ #8
	COPY ~3ed/BardSongs/GVSONG.EFF~ ~override/GVSSNG.EFF~
		WRITE_ASCII 0x0030 ~SSNG~ #8
	COPY ~3ed/BardSongs/GVSONG.EFF~ ~override/GVJSNG.EFF~
		WRITE_ASCII 0x0030 ~JSNG~ #8
		
	COPY ~3ed/BardSongs/BSNG.SPL~ ~override/GVSNG.SPL~
        LPF MAKE_ALWAYS_CASTABLE END
		FOR (i=1;i<=30;i=i+1) BEGIN
			PATCH_IF (i==1 OR ((i/2) * 2 = i)) BEGIN
				LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=4 target=5 target_count=0 range=1 required_level=i speed=1 projectile=1 END
				READ_SHORT 0x68 n_headers //number of extended_headers
				FOR (j=1;j<=i;j=j+1) BEGIN
					PATCH_IF (j==1 OR ((j/2) * 2 = j)) BEGIN
						LPF ADD_SPELL_EFFECT INT_VAR header=n_headers opcode=177 power=10 target=2 timing=0 duration=1 parameter2=9 parameter1=16384 STR_VAR resource=~GVBSNG~ END //bard				
					END	
					PATCH_IF (j==1 OR ((j/4) * 4 = j)) BEGIN				
						LPF ADD_SPELL_EFFECT INT_VAR header=n_headers opcode=177 power=10 target=2 timing=0 duration=1 parameter2=9 parameter1=16398 STR_VAR resource=~GVJSNG~ END //jester
						LPF ADD_SPELL_EFFECT INT_VAR header=n_headers opcode=177 power=10 target=2 timing=0 duration=1 parameter2=9 parameter1=16397 STR_VAR resource=~GVSSNG~ END //blade	
						LPF ADD_SPELL_EFFECT INT_VAR header=n_headers opcode=177 power=10 target=2 timing=0 duration=1 parameter2=9 parameter1=16399 STR_VAR resource=~GVSSNG~ END //skald				
					END	
				END
			END	
		END
		
	//bonus songs
	COPY ~3ed/BardSongs/BSNG.SPL~ ~override/GVSNGA.SPL~
		LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=4 target=5 target_count=0 range=1 speed=1 projectile=1 END
			    LPF ADD_SPELL_EFFECT INT_VAR opcode=177 power=10 target=2 timing=0 duration=1 parameter2=9 parameter1=16384 STR_VAR resource=~GVBSNG~ END //bard
				LPF ADD_SPELL_EFFECT INT_VAR opcode=177 power=10 target=2 timing=0 duration=1 parameter2=9 parameter1=16398 STR_VAR resource=~GVJSNG~ END //jester
                LPF ADD_SPELL_EFFECT INT_VAR opcode=177 power=10 target=2 timing=0 duration=1 parameter2=9 parameter1=16397 STR_VAR resource=~GVSSNG~ END //blade	
                LPF ADD_SPELL_EFFECT INT_VAR opcode=177 power=10 target=2 timing=0 duration=1 parameter2=9 parameter1=16399 STR_VAR resource=~GVSSNG~ END //skald
				
	COPY ~3ed/BardSongs/BSNG.SPL~ ~override/BNSNG.SPL~
        LPF MAKE_ALWAYS_CASTABLE END
		LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=4 target=5 target_count=0 range=1 speed=1 projectile=1 END
		FOR (i=min_val+step;i<=max_val;i=i+step) BEGIN
			LPF ADD_SPELL_EFFECT INT_VAR opcode=326 power=10 target=2 timing=0 duration=1 parameter2=132 parameter1=i STR_VAR resource=~GVSNGA~ END //apply effect
		END
	//remove song	
	COPY ~3ed/BardSongs/BSNG.SPL~ ~override/RMSNG.SPL~
        LPF MAKE_ALWAYS_CASTABLE END
		LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=4 target=5 target_count=0 range=1 speed=1 projectile=1 END
			LPF ADD_SPELL_EFFECT INT_VAR opcode=172 power=10 target=2 timing=0 duration=1 STR_VAR resource=~BSNG~ END 
			LPF ADD_SPELL_EFFECT INT_VAR opcode=172 power=10 target=2 timing=0 duration=1 STR_VAR resource=~SSNG~ END
			LPF ADD_SPELL_EFFECT INT_VAR opcode=172 power=10 target=2 timing=0 duration=1 STR_VAR resource=~JSNG~ END

	
	//script for giving bardic songs
	OUTER_FOR (player_id=1;player_id<=6;player_id=player_id + 1) BEGIN
		EXTEND_TOP_REGEXP ~\(BD\)*BALDUR.*\.BCS~ ~3ed/BardSongs/BSNG.baf~
			EVALUATE_BUFFER			
	END
    
    
	//bonus songs at level 1 
	LAF ADD_FEATS_LVL INT_VAR min_level=1 max_level=1 d_level=4 add_at_level1=1 
						STR_VAR clab=~CLABBA.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name=~BNSNG~ caption = ~BBNSNG~ END		
	//bards
	LAF ADD_FEATS_LVL INT_VAR min_level=2 max_level=30 d_level=2 add_at_level1=1 indexed = 1
						STR_VAR clab=~CLABBA01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name=~GVSNGA~ caption = ~BGVSNG~ END	
						
	//bard kits
	LAF ADD_FEATS_LVL INT_VAR min_level=4 max_level=30 d_level=4 add_at_level1=1 indexed = 1
						STR_VAR clab=~\(\(CLABBA02\)\|\(\CLABBA03\)\|\(CLABBA04\)\)\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREAL.SPL~ feat_name=~GVSNGA~ caption = ~KGVSNG~ END	
						
	COPY ~3ed/BardSongs/BSNG.SPL~ ~override/DSBLSNG.SPL~					
		LPF ADD_SPELL_HEADER INT_VAR  type=1 location=4 target=5 target_count=0 range=1 speed=1 projectile=1 END
		LPF ADD_SPELL_EFFECT INT_VAR header=1 opcode=144 target=2 parameter1=0 parameter2=10 timing=1 duration=1 END //disable bardic music button
		
	LAF ADD_FEATS_LVL INT_VAR min_level=1 max_level=1 d_level=4 add_at_level1=1 
						STR_VAR clab=~CLABBA.*\.2DA~ mask_file=~~ feat_name=~DSBLSNG~ caption = ~DSBLSNG~ END

    COPY ~3ed/BardSongs/BattleDance~ ~override~
    COPY_EXISTING ~BLADDNC.SPL~ ~override~
		SAY NAME1 @035
		SAY UNIDENTIFIED_DESC @036        