LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 14 Con = 16 Int = 8 Wis = 8 Cha = 8 InitialXp = 89000
                          STR_VAR NpcName = ~MINSC.*~ ScriptName = ~MINSC~ ClassName = ~FIGHTER~ KitName =~BARBARIAN~ END
                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 10 Wis = 16 Cha = 10 InitialXp = 89000
                          STR_VAR NpcName = ~JAHEIR.*~ ScriptName = ~JAHEIRA~ ClassName = ~FIGHTER_DRUID~ END
COPY_EXISTING_REGEXP ~JAHEIR+.*\.CRE~ ~override~ //put back harpers call
    ADD_MEMORIZED_SPELL ~SPJA01~ #4 ~priest~                                  
                          
                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 12 Con = 14 Int = 18 Wis = 9 Cha = 10 RemoveKnownSpells = 0
                          STR_VAR NpcName = ~EDWIN.*~ ScriptName = ~EDWIN~ ClassName = ~MAGE~ KitName = ~MAGESCHOOL_CONJURER~ END
                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 10 Int = 16 Wis = 14 Cha = 14 MoveSilently = 5 HideInShadows = 5
                          STR_VAR NpcName = ~VICONI.*~ ScriptName = ~VICONIA~ ClassName = ~CLERIC_THIEF~ END                                 
EXTEND_BOTTOM ~bdviconc.bcs~ ~3ed/Npc/Common/ViconiaThief.baf~ //make viconia react on find traps and hide ai settings

                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 9 Dex = 16 Con = 12 Int = 16 Wis = 11 Cha = 10 Lockpick = 5 FindTraps = 5 RemoveKnownSpells = 0 InitialXp = 89000
                          STR_VAR NpcName = ~IMOEN1.*~ ScriptName = ~IMOEN~ ClassName = ~FIGHTER_MAGE_THIEF~ END  
                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 9 Dex = 16 Con = 12 Int = 16 Wis = 11 Cha = 10  Lockpick = 5 FindTraps = 5 RemoveKnownSpells = 0 InitialXp = 89000
                          STR_VAR NpcName = ~IMOEN2.*~ ScriptName = ~IMOEN2~ ClassName = ~FIGHTER_MAGE_THIEF~  END   
                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 12 Int = 14 Wis = 10 Cha = 10  Lockpick = 5 FindTraps = 5
                          STR_VAR NpcName = ~YOSHI.*~ ScriptName = ~YOSHIMO~ ClassName = ~THIEF~ KitName = ~THIEF_BASE~ END    

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 16 Con = 12 Int = 10 Wis = 13 Cha = 9  
                          STR_VAR NpcName = ~VALYG.*~ ScriptName = ~VALYGAR~ ClassName = ~RANGER~  KitName = ~STALKER~ END     


LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 15 Con = 12 Int = 13 Wis = 9 Cha = 16  RemoveKnownSpells = 0
                          STR_VAR NpcName = ~Nalia[0-9]+.*~ ScriptName = ~NALIA~ ClassName = ~BARD~   END                                    
                          
COPY_EXISTING_REGEXP ~Nalia[0-9]+.*\.CRE~ ~override~
     WRITE_LONG 0x0028 25360 // change animation to bard
     REMOVE_KNOWN_SPELL ~SPWI703~ //remove project image
                          
                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 18 Con = 14 Int = 10 Wis = 14 Cha = 10  RemoveKnownSpells = 0 RemoveMemorizedSpells = 0
                          STR_VAR NpcName = ~MAZZY.*~ ScriptName = ~MAZZY~ ClassName = ~FIGHTER~ KitName= ~KENSAI~   END                                         
 //STRING_SET 11569  @002 //change biography (remove line about not being paladin)
COPY_EXISTING_REGEXP ~MAZZY+.*\.CRE~ ~override~ //replace chainmail with studded leather + 2
        REPLACE_CRE_ITEM ~LEAT05~ #0 #0 #0 ~IDENTIFIED~ ~ARMOR~
 
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 12 Con = 18 Int = 8 Wis = 8 Cha = 8  
                          STR_VAR NpcName = ~KORGAN.*~ ScriptName = ~KORGAN~ ClassName = ~FIGHTER~ KitName = ~BERSERKER~ END      
 
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 10 Con = 14 Int = 10 Wis = 10 Cha = 16  
                          STR_VAR NpcName = ~KELDOR.*~ ScriptName = ~KELDORN~ ClassName = ~PALADIN~ KitName = ~INQUISITOR~ END       

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 16 Con = 16 Int = 16 Wis = 9 Cha = 9  Lockpick = 5 FindTraps = 5 RemoveKnownSpells = 0 
                          STR_VAR NpcName = ~JAN[0-9]+.*~ ScriptName = ~JAN~ ClassName = ~MAGE_THIEF~ KitName = ~MAGESCHOOL_ILLUSIONIST~ END                 
COPY_EXISTING_REGEXP ~JAN[0-9]+.*\.CRE~ ~override~ //put innate for creating ammo back
    ADD_MEMORIZED_SPELL ~SPIN829~ #0 ~innate~
    
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 12 Int = 14 Wis = 10 Cha = 14  RemoveKnownSpells = 0 HpTotal = 50 //set initial hp to 50 in order to avoid killing himself during planar attack
                          STR_VAR NpcName = ~HAER.*~ ScriptName = ~HAERDALI~ ClassName = ~BARD~ KitName = ~BLADE~ END  

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 14 Con = 12 Int = 10 Wis = 18 Cha = 10  
                          STR_VAR NpcName = ~CERND.*~ ScriptName = ~CERND~ ClassName = ~DRUID~ KitName = ~SHAPESHIFTER~ END    

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 15 Dex = 14 Con = 14 Int = 10 Wis = 15 Cha = 10  
                          STR_VAR NpcName = ~ANOMEN.*~ ScriptName = ~ANOMEN~ ClassName = ~FIGHTER_CLERIC~ END    
        
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 10 Int = 16 Wis = 16 Cha = 12  RemoveKnownSpells = 0  HpTotal = 5
                          STR_VAR NpcName = ~AERIE[0-9]+.*~ ScriptName = ~AERIE~ ClassName = ~CLERIC_MAGE~  END  
COPY_EXISTING_REGEXP ~AERIE[0-9]+.*\.CRE~ ~override~       
        REMOVE_KNOWN_SPELL ~SPPR110~ ~sppr202~ ~sppr206~ //remove druid spells

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 16 Con = 16 Int = 16 Wis = 10 Cha = 10
                          STR_VAR NpcName = ~SAREVOK~ ScriptName = ~SAREV25~ ClassName = ~FIGHTER~ END    
//give back on hit effect
COPY_EXISTING ~SAREVOK.CRE~ ~override~
    LPF ADD_CRE_EFFECT INT_VAR opcode = 248 timing = 9 STR_VAR resource = ~SAREVEFF~ END 

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 12 Int = 10 Wis = 15 Cha = 10  
                          STR_VAR NpcName = ~RASAAD.*~ ScriptName = ~RASAAD~ ClassName = ~MONK~ KitName = ~SUN_SOUL~ END       

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 10 Con = 13 Int = 8 Wis = 13 Cha = 15  
                          STR_VAR NpcName = ~DORN.*~ ScriptName = ~DORN~ ClassName = ~PALADIN~ KitName = ~BLACKGUARD~ END      

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 9 Dex = 16 Con = 12 Int = 17 Wis = 9 Cha = 11  RemoveKnownSpells = 0
                          STR_VAR NpcName = ~NEERA.*~ ScriptName = ~NEERA~ ClassName = ~MAGE~ KitName = ~WILDMAGE~  END   

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 10 Con = 18 Int = 8 Wis = 8 Cha = 8  
                          STR_VAR NpcName = ~WILSON.*~ ScriptName = ~WILSON~ ClassName = ~FIGHTER~ KitName = ~GRIZZLY_BEAR~ END   


LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 16 Con = 12 Int = 16 Wis = 10 Cha = 10  Lockpick = 5 FindTraps = 5
                          STR_VAR NpcName = ~ohhfak.*~ ScriptName = ~OHHFAK~ ClassName = ~THIEF~  KitName = ~THIEF_BASE~  END          

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 20 Con = 12 Int = 18 Wis = 12 Cha = 14  HideInShadows = 5 FindTraps = 5 RemoveKnownSpells = 0 RemoveMemorizedSpells = 0
                          STR_VAR NpcName = ~ohhex.*~ ScriptName = ~HEXXAT~ ClassName = ~THIEF~ KitName = ~SHADOWDANCER~   END 