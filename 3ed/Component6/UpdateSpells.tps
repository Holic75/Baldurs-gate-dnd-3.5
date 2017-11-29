	//fill arrays for spells and icons using ids_strings
    
    
	//////////////////////////////array in spell icon format
	ACTION_DEFINE_ARRAY spheal_ids BEGIN 
		~CLERIC_CURE_LIGHT_WOUNDS~ //cure light wounds 
		~CLERIC_CURE_MODERATE_WOUNDS~//cure moderate wounds
		~CLERIC_CURE_MEDIUM_WOUNDS~//cure medium wounds
		~CLERIC_CURE_SERIOUS_WOUNDS~//cure serious wounds
		~CLERIC_CURE_CRITICAL_WOUNDS~//cure critical wounds
		~CLERIC_HEAL~//heal
		~CLERIC_RESURRECTION~//ressurection		
	END
	ACTION_DEFINE_ARRAY spharm_ids BEGIN 
		~CLERIC_CAUSE_LIGHT_WOUNDS~ //CAUSE light wounds 
		~CLERIC_CAUSE_MODERATE_WOUNDS~//CAUSE moderate wounds
		~CLERIC_CAUSE_MEDIUM_WOUNDS~//CAUSE medium wounds
		~CLERIC_CAUSE_SERIOUS_WOUNDS~//CAUSE serious wounds
		~CLERIC_CAUSE_CRITICAL_WOUNDS~//CAUSE critical wounds
		~CLERIC_HARM~//harm
		~CLERIC_FINGER_OF_DEATH~//finger		
	END
	ACTION_DEFINE_ARRAY spsumm_ids BEGIN 
		~DRUID_LESSER_SUMMONING_1~//lesser animal summomning 1
		~DRUID_LESSER_SUMMONING_2~//lesser animal summomning 2
		~DRUID_LESSER_SUMMONING_3~//lesser animal summomning 3
		~CLERIC_ANIMAL_SUMMONING_1~//animal summomning 1
		~CLERIC_ANIMAL_SUMMONING_2~//animal summomning 2
		~CLERIC_ANIMAL_SUMMONING_3~//animal summomning 3
		~CLERIC_CONJURE_EARTH_ELEMENTAL~ //summon earth elemental
	END
    
    OUTER_FOR (i=0;i<7;i=i+1) BEGIN
        
        OUTER_SET lvl = i+1
        
        OUTER_SPRINT spell_name EVALUATE_BUFFER $spheal_ids("%i%")        
            LAF RES_NUM_OF_SPELL_NAME STR_VAR spell_name RET ResourceName = spell_res END
            ACTION_DEFINE_ASSOCIATIVE_ARRAY spheal_spl BEGIN              
                ~%lvl%~ => ~%ResourceName%~
            END          
            COPY_EXISTING ~%ResourceName%.SPL~ ~override~
                READ_LONG 0x0064 HeaderOffset
                READ_ASCII HeaderOffset + 0x0004  ResourceIcon 
            ACTION_DEFINE_ASSOCIATIVE_ARRAY spheal_icon BEGIN              
                ~%lvl%~ => ~%ResourceIcon%~
            END

        OUTER_SPRINT spell_name EVALUATE_BUFFER $spharm_ids("%i%")            
            LAF RES_NUM_OF_SPELL_NAME STR_VAR spell_name RET ResourceName = spell_res END
            ACTION_DEFINE_ASSOCIATIVE_ARRAY spharm_spl BEGIN              
                ~%lvl%~ => ~%ResourceName%~
            END          
            COPY_EXISTING ~%ResourceName%.SPL~ ~override~
                READ_LONG 0x0064 HeaderOffset
                READ_ASCII HeaderOffset + 0x0004  ResourceIcon 
            ACTION_DEFINE_ASSOCIATIVE_ARRAY spharm_icon BEGIN              
                ~%lvl%~ => ~%ResourceIcon%~
            END            
   
        OUTER_SPRINT spell_name EVALUATE_BUFFER $spsumm_ids("%i%")            
            LAF RES_NUM_OF_SPELL_NAME STR_VAR spell_name RET ResourceName = spell_res END
            ACTION_DEFINE_ASSOCIATIVE_ARRAY spsumm_spl BEGIN              
                ~%lvl%~ => ~%ResourceName%~
            END          
            COPY_EXISTING ~%ResourceName%.SPL~ ~override~
                READ_LONG 0x0064 HeaderOffset
                READ_ASCII HeaderOffset + 0x0004  ResourceIcon 
            ACTION_DEFINE_ASSOCIATIVE_ARRAY spsumm_icon BEGIN              
                ~%lvl%~ => ~%ResourceIcon%~
            END     
    END
	

	//Now we will loop over all spells and add spontaneous effects
	COPY_EXISTING_REGEXP GLOB ~.+\.spl~ ~override~
		READ_SHORT 0x1c "spell_type"
		READ_SHORT 0x34 "spell_level"
		READ_SHORT 0x0068 "Nheaders" //number of headers
		PATCH_IF spell_type = 2 AND spell_level <= 7 BEGIN
			
			//healing
			SPRINT resource EVALUATE_BUFFER $spheal_spl("%spell_level%")
			SPRINT icon EVALUATE_BUFFER $spheal_icon("%spell_level%")
			LPF ADD_SPELL_HEADER  INT_VAR  type=1  location=2  target=1+2*(spell_level = 7)  target_count=0  range=1+29*(spell_level = 7)  required_level=cure_level  STR_VAR  icon   END
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+1  opcode = 146  target = 2  parameter1 = 1  timing = 1  resist_dispel = 2  STR_VAR  resource   END //cast spell
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+1  opcode = 321  target = 1  timing = 0 duration=1  resist_dispel = 2  STR_VAR resource=~RGSPHEAL~ END	 //remove effects	
			
			//summoning
			SPRINT resource EVALUATE_BUFFER $spsumm_spl("%spell_level%")
			SPRINT icon EVALUATE_BUFFER $spsumm_icon("%spell_level%")
			LPF ADD_SPELL_HEADER  INT_VAR  type=1  location=2  target=4  target_count=0  range=30  required_level=summ_level  STR_VAR  icon   END
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+2  opcode = 148  target = 1  parameter1 = 1  timing = 1  resist_dispel = 2  STR_VAR  resource   END //cast spell at point
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+2  opcode = 321  target = 1  timing = 0 duration=1  resist_dispel = 2  STR_VAR resource=~RGSPSUMM~ END	 //remove effects	
			
			//battlecasting
			SPRINT icon EVALUATE_BUFFER ~BTLCTN%spell_level%B~
			SPRINT resource EVALUATE_BUFFER ~BCST%spell_level%~
			LPF ADD_SPELL_HEADER  INT_VAR  type=1  location=2  target=5  target_count=0  range=0  required_level=bcst_level  STR_VAR  icon   END
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+3  opcode = 146  target = 2  parameter1 = 1  timing = 1  resist_dispel = 2  STR_VAR  resource   END //cast spell on caster
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+3  opcode = 321  target = 1  timing = 0 duration=1  resist_dispel = 2  STR_VAR resource=~RGSPBCST~ END	 //remove effects	
			
			//channeling
			SPRINT icon EVALUATE_BUFFER ~CSTRK%spell_level%B~
			SPRINT resource EVALUATE_BUFFER ~CHSTK%spell_level%~
			LPF ADD_SPELL_HEADER  INT_VAR  type=1  location=2  target=5  target_count=0  range=0  required_level=cstk_level  STR_VAR  icon   END
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+4  opcode = 146  target = 2  parameter1 = 1  timing = 1  resist_dispel = 2  STR_VAR  resource   END //cast spell on caster
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+4  opcode = 321  target = 1  timing = 0 duration=1  resist_dispel = 2  STR_VAR resource=~RGSPCSTK~ END	 //remove effects	
			
			//harming

            
            FOR (i=0;i<8;i=i+1) BEGIN //for harm we change level differently depending on targets's wisdom (to account for saving throw dc)
               	SPRINT resource EVALUATE_BUFFER $spharm_spl("%spell_level%")
                SPRINT icon EVALUATE_BUFFER $spharm_icon("%spell_level%")
                LPF ADD_SPELL_HEADER  INT_VAR  type=1  location=2  target=1  target_count=0  range=1+39*(spell_level = 7)  required_level=harm_level+i  STR_VAR  icon   END
                LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+5+i  opcode = 146  target = 2  parameter1 = 1+30*i  timing = 1  resist_dispel = 2  STR_VAR  resource   END //cast spell
                SPRINT resource EVALUATE_BUFFER ~SPHARM%i%~
                LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+5+i  opcode = 321  target = 1  timing = 0 duration=1  resist_dispel = 2  STR_VAR resource END	 //remove effects
            END
			
		END  
		ELSE PATCH_IF (spell_type = 1 AND spell_level <= 7) BEGIN
			//battlecasting for wizards
			SPRINT icon EVALUATE_BUFFER ~BTLCTN%spell_level%B~
			SPRINT resource EVALUATE_BUFFER ~BCST%spell_level%~
			LPF ADD_SPELL_HEADER  INT_VAR  type=1  location=2  target=5  target_count=0  range=0  required_level=bcst_level  STR_VAR  icon   END
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+1  opcode = 146  target = 2  parameter1 = 1  timing = 1  resist_dispel = 2  STR_VAR  resource   END //cast spell on caster
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+1  opcode = 321  target = 1  timing = 0 duration=1  resist_dispel = 2  STR_VAR resource=~RGSPBCST~ END	 //remove effects
            
            //channeling for wizards
			//channeling
			SPRINT icon EVALUATE_BUFFER ~CSTRK%spell_level%B~
			SPRINT resource EVALUATE_BUFFER ~CHSTK%spell_level%~
			LPF ADD_SPELL_HEADER  INT_VAR  type=1  location=2  target=5  target_count=0  range=0  required_level=cstk_level  STR_VAR  icon   END
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+4  opcode = 146  target = 2  parameter1 = 1  timing = 1  resist_dispel = 2  STR_VAR  resource   END //cast spell on caster
			LPF ADD_SPELL_EFFECT  INT_VAR  header = Nheaders+4  opcode = 321  target = 1  timing = 0 duration=1  resist_dispel = 2  STR_VAR resource=~RGSPCSTK~ END	 //remove effects	
			
		END BUT_ONLY	