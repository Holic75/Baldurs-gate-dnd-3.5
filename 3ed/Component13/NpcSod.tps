
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 14 Con = 16 Int = 8 Wis = 8 Cha = 8 InitialXp = 64000 
                          STR_VAR NpcName = ~MINSC7~ ScriptName = ~BDMINSC~ ClassName = ~FIGHTER~ KitName =~BARBARIAN~ END
COPY_EXISTING ~MINSC7.CRE~ ~override~
REPLACE_CRE_ITEM ~CHAN05~ #0 #0 #0 ~IDENTIFIED~ ~ARMOR~ 

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 14 Con = 14 Int = 10 Wis = 9 Cha = 17 InitialXp = 130000  
                          STR_VAR NpcName = ~DYNAHE7~ ScriptName = ~BDDYNAHE~ ClassName = ~SORCERER~  END     
                         

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 16 Con = 14 Int = 10 Wis = 10 Cha = 10 InitialXp = 130000
                          STR_VAR NpcName = ~KHALID7~ ScriptName = ~BDKHALID~ ClassName = ~FIGHTER~ END                

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 10 Wis = 16 Cha = 10 InitialXp = 130000 
                          STR_VAR NpcName = ~JAHEIR7~ ScriptName = ~BDJAHEIR~ ClassName = ~FIGHTER_DRUID~ END    

                                                    
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 11 Dex = 16 Con = 14 Int = 16 Wis = 9 Cha = 10  Lockpick = 5 FindTraps = 5 RemoveKnownSpells = 0 RemoveMemorizedSpells = 0 InitialXp = 130000
                          STR_VAR NpcName = ~SAFANA7~ ScriptName = ~BDSAFANA~ ClassName = ~THIEF~ KitName = ~SWASHBUCKLER~  END   
                                 
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 12 Con = 14 Int = 18 Wis = 9 Cha = 10 RemoveKnownSpells = 0 InitialXp = 130000
                          STR_VAR NpcName = ~EDWIN7~ ScriptName = ~BDEDWIN~ ClassName = ~MAGE~ KitName = ~MAGESCHOOL_CONJURER~ END

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 10 Int = 16 Wis = 14 Cha = 14 MoveSilently = 5 HideInShadows = 5 InitialXp = 130000
                          STR_VAR NpcName = ~VICONI7~ ScriptName = ~BDVICONI~ ClassName = ~CLERIC_THIEF~ END   
EXTEND_BOTTOM ~bdviconc.bcs~ ~3ed/Npc/Common/ViconiaThief.baf~ //make viconia react on find traps and hide ai settings                        
COPY_EXISTING ~VICONI7.CRE~ ~override~
    //replace items with those of glint
    REPLACE_CRE_ITEM ~LEAT11~ #0 #0 #0 ~IDENTIFIED~ ~ARMOR~
    REPLACE_CRE_ITEM ~SHLD17~ #0 #0 #0 ~IDENTIFIED~ ~SHIELD~
    REPLACE_CRE_ITEM ~BDBELT03~ #0 #0 #0 ~IDENTIFIED~ ~BELT~
    REPLACE_CRE_ITEM ~SW1H05~ #0 #0 #0 ~IDENTIFIED~ ~weapon1~ //also replace mace with longsword

                              
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 12 Int = 10 Wis = 15 Cha = 10 InitialXp = 130000  
                          STR_VAR NpcName = ~RASAAD7~ ScriptName = ~BDRASAAD~ ClassName = ~MONK~ KitName = ~SUN_SOUL~ END       

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 10 Con = 13 Int = 8 Wis = 13 Cha = 15 InitialXp = 130000  
                          STR_VAR NpcName = ~DORN7~ ScriptName = ~BDDORN~ ClassName = ~PALADIN~ KitName = ~BLACKGUARD~ END      

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 9 Dex = 16 Con = 12 Int = 17 Wis = 9 Cha = 11  RemoveKnownSpells = 0 InitialXp = 130000
                          STR_VAR NpcName = ~NEERA7~ ScriptName = ~BDNEERA~ ClassName = ~MAGE~ KitName = ~WILDMAGE~  END

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 18 Con = 12 Int = 10 Wis = 10 Cha = 18 InitialXp = 130000  HpTotal = 10
                          STR_VAR NpcName = ~BAELOT7~ ScriptName = ~BDBAELOT~ ClassName = ~SORCERER~ KitName = ~DRAGON_DISCIPLE~  END
                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 14 Int = 10 Wis = 10 Cha = 16 InitialXp = 130000
                          STR_VAR NpcName = ~BDMKHI7~ ScriptName = ~BDMKHIN~ ClassName = ~SHAMAN~  END             
COPY_EXISTING ~BDMKHI7.CRE~ ~override~ //put innate  and infravision back
    
    LPF ADD_CRE_EFFECT INT_VAR opcode = 63 target = 1 timing = 9 END //infravison

    ADD_KNOWN_SPELL ~SPIN205~ #0 ~innate~
    ADD_MEMORIZED_SPELL ~SPIN205~ #0 ~innate~     


LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 15 Dex = 16 Con = 14 Int = 10 Wis = 13 Cha = 9 InitialXp = 130000 
    STR_VAR NpcName = ~CORWIN7~ ScriptName = ~BDCORWIN~ ClassName = ~RANGER~ KitName=~FERALAN~  END 

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 13 Wis = 9 Cha = 15  RemoveKnownSpells = 0 InitialXp = 130000 
    STR_VAR NpcName = ~VOGHIL7~ ScriptName = ~BDVOGHIL~ ClassName = ~BARD~ KitName=~SKALD~  END      
    
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 10 Con = 16 Int = 10 Wis = 16 Cha = 14 InitialXp = 130000
    STR_VAR NpcName = ~GLINT7~ ScriptName = ~BDGLINT~ ClassName = ~CLERIC~  END    
    
COPY_EXISTING ~GLINT7.CRE~ ~override~
    //give invisibility
    ADD_KNOWN_SPELL ~SPIN118~ #0 ~innate~
    ADD_MEMORIZED_SPELL ~SPIN118~ #0 ~innate~   
    //replace items with those of viconia
    REPLACE_CRE_ITEM ~CHAN05~ #0 #0 #0 ~IDENTIFIED~ ~ARMOR~
    REPLACE_CRE_ITEM ~SHLD02~ #0 #0 #0 ~IDENTIFIED~ ~SHIELD~
    REMOVE_CRE_ITEM ~BDBELT03~     
    WRITE_LONG 0x0028 24580 // change animation to cleric
                          
                          
                          