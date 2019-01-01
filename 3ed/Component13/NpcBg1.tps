LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 15 Dex = 18 Con = 12 Int = 10 Wis = 13 Cha = 9 
    STR_VAR NpcName = ~KIVAN~ ScriptName = ~KIVAN~ ClassName = ~RANGER~ KitName=~FERALAN~  END        
           
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 20 Con = 10 Int = 14 Wis = 9 Cha = 9  PickPockets = 5 HideInShadows = 5
    STR_VAR NpcName = ~ALORA~ ScriptName = ~ALORA~ ClassName = ~THIEF~  KitName = ~THIEF_BASE~ END
    
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 14 Con = 16 Int = 8 Wis = 8 Cha = 8 
                          STR_VAR NpcName = ~MINSC~ ScriptName = ~MINSC~ ClassName = ~FIGHTER~ KitName =~BARBARIAN~ END
   

COPY  ~3ed/Npc/Bg1/DYNAHEIR.BCS~ ~override~//remove wizard spells given via script
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 14 Con = 14 Int = 10 Wis = 9 Cha = 17  
                          STR_VAR NpcName = ~DYNAHE~ ScriptName = ~DYNAHEIR~ ClassName = ~SORCERER~  END     

                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 12 Con = 16 Int = 10 Wis = 14 Cha = 10  
                          STR_VAR NpcName = ~YESLIC~ ScriptName = ~YESLICK~ ClassName = ~FIGHTER_CLERIC~  END 
                         
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 18 Con = 12 Int = 14 Wis = 10 Cha = 10  Lockpick = 4 FindTraps = 4
                          STR_VAR NpcName = ~CORAN~ ScriptName = ~CORAN~ ClassName = ~FIGHTER_THIEF~ END     

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 15 Dex = 10 Con = 14 Int = 9 Wis = 13 Cha = 16 
                          STR_VAR NpcName = ~AJANTI~ ScriptName = ~AJANTIS~ ClassName = ~PALADIN~  END   

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 16 Con = 14 Int = 10 Wis = 10 Cha = 10
                          STR_VAR NpcName = ~KHALID~ ScriptName = ~KHALID~ ClassName = ~FIGHTER~ END                

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 10 Wis = 16 Cha = 10 
                          STR_VAR NpcName = ~JAHEIR~ ScriptName = ~JAHEIRA~ ClassName = ~FIGHTER_DRUID~ END    

                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 16 Con = 12 Int = 13 Wis = 9 Cha = 15 RemoveKnownSpells = 0
                          STR_VAR NpcName = ~GARRIC~ ScriptName = ~GARRICK~ ClassName = ~BARD~  END  
                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 11 Dex = 16 Con = 14 Int = 16 Wis = 9 Cha = 10  Lockpick = 5 FindTraps = 5 RemoveKnownSpells = 0 RemoveMemorizedSpells = 0
                          STR_VAR NpcName = ~SAFANA~ ScriptName = ~SAFANA~ ClassName = ~THIEF~ KitName = ~SWASHBUCKLER~  END   

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 10 Wis = 16 Cha = 10
                          STR_VAR NpcName = ~FALDOR~ ScriptName = ~FALDORN~ ClassName = ~DRUID~ KitName = ~BEASTFRIEND~ END 
        
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 15 Dex = 10 Con = 14 Int = 10 Wis = 16 Cha = 12  
                          STR_VAR NpcName = ~BRANWE~ ScriptName = ~BRANWEN~ ClassName = ~CLERIC~ KitName = ~OHTEMPUS~ END    


LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 8 Dex = 10 Con = 16 Int = 16 Wis = 16 Cha = 10
                          STR_VAR NpcName = ~QUAYLE~ ScriptName = ~QUAYLE~ ClassName = ~CLERIC_MAGE~ KitName = ~MAGESCHOOL_ILLUSIONIST~ END    
COPY_EXISTING ~QUAYLE.CRE~ ~override~        
    //return invisibility and 1st lvl spells
    ADD_KNOWN_SPELL ~SPIN118~ #0 ~innate~
    ADD_MEMORIZED_SPELL ~SPIN118~ #0 ~innate~                             
    ADD_KNOWN_SPELL ~SPWI112~ #0 ~wizard~
    ADD_KNOWN_SPELL ~SPWI125~ #0 ~wizard~
    
    //WRITE_LONG 0x0028 25348 // change animation to thief
    //quayle dialog change reference from cleric mage to mage thief
    //STRING_SET 126  @001 

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 12 Int = 16 Wis = 10 Cha = 10  RemoveKnownSpells = 0
                          STR_VAR NpcName = ~XAN~ ScriptName = ~XAN~ ClassName = ~FIGHTER_MAGE~ END          

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 10 Int = 16 Wis = 8 Cha = 10  HideInShadows = 5 MoveSilently = 5
                          STR_VAR NpcName = ~SKIE~ ScriptName = ~SKIE~ ClassName = ~THIEF~ KitName = ~SHADOWDANCER~   END                           
        
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 13 Wis = 9 Cha = 15  RemoveKnownSpells = 0 
                          STR_VAR NpcName = ~ELDOTH~ ScriptName = ~ELDOTH~ ClassName = ~BARD~ KitName = ~BLADE~ END     
COPY_EXISTING ~ELDOTH.CRE~ ~override~
    ADD_MEMORIZED_SPELL ~SPIN116~ #0 ~innate~ //give back poison arrows

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 14 Con = 12 Int = 18 Wis = 9 Cha = 9 RemoveKnownSpells = 0
                          STR_VAR NpcName = ~XZAR~ ScriptName = ~XZAR~ ClassName = ~MAGE~ KitName = ~MAGESCHOOL_NECROMANCER~ END       

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 14 Int = 16 Wis = 9 Cha = 9  MoveSilently = 5 FindTraps = 5
                          STR_VAR NpcName = ~MONTAR~ ScriptName = ~MONTARON~ ClassName = ~THIEF~ KitName = ~ASSASIN~   END   

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 10 Con = 16 Int = 16 Wis = 14 Cha = 10
                          STR_VAR NpcName = ~TIAX~ ScriptName = ~TIAX~ ClassName = ~FIGHTER_MAGE_CLERIC~  END  
                        
COPY_EXISTING ~TIAX.CRE~ ~override~
    //give back summon ghast
    ADD_KNOWN_SPELL ~SPIN115~ #0 ~innate~
    ADD_MEMORIZED_SPELL ~SPIN115~ #0 ~innate~ 
    //add few wizard spells
    ADD_KNOWN_SPELL ~SPWI112~ #0 ~wizard~
    ADD_KNOWN_SPELL ~SPWI125~ #0 ~wizard~
    ADD_KNOWN_SPELL ~SPWI116~ #0 ~wizard~
    ADD_KNOWN_SPELL ~SPWI106~ #0 ~wizard~
    WRITE_LONG 0x0028 24580 // change animation to cleric

    

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 10 Con = 19 Int = 10 Wis = 11 Cha = 8
                          STR_VAR NpcName = ~KAGAIN~ ScriptName = ~KAGAIN~ ClassName = ~FIGHTER~ KitName = ~DWARVEN_DEFENDER~  END   

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 14 Con = 10 Int = 10 Wis = 10 Cha = 16 HpTotal = 10
                          STR_VAR NpcName = ~SHARTE~ ScriptName = ~SHARTEEL~ ClassName = ~FIGHTER~ KitName = ~WIZARDSLAYER~  END   
                          
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 12 Con = 14 Int = 18 Wis = 9 Cha = 10 RemoveKnownSpells = 0
                          STR_VAR NpcName = ~EDWIN~ ScriptName = ~EDWIN~ ClassName = ~MAGE~ KitName = ~MAGESCHOOL_CONJURER~ END

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 10 Int = 16 Wis = 14 Cha = 14 MoveSilently = 5 HideInShadows = 5 HpTotal = 15
                          STR_VAR NpcName = ~VICONI~ ScriptName = ~VICONIA~ ClassName = ~CLERIC_THIEF~ END   
EXTEND_BOTTOM ~bdviconc.bcs~ ~3ed/Npc/Common/ViconiaThief.baf~ //make viconia react on find traps and hide ai settings 
                         
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 9 Dex = 16 Con = 12 Int = 16 Wis = 11 Cha = 10 Lockpick = 5 FindTraps = 5
                          STR_VAR NpcName = ~IMOEN.*~ ScriptName = ~IMOEN~ ClassName = ~FIGHTER_MAGE_THIEF~ END   
COPY_EXISTING_REGEXP ~IMOEN+.*\.CRE~ ~override~    
    //add few wizard spells
    ADD_KNOWN_SPELL ~SPWI101~ #0 ~wizard~
    ADD_KNOWN_SPELL ~SPWI102~ #0 ~wizard~
    ADD_KNOWN_SPELL ~SPWI104~ #0 ~wizard~
    ADD_KNOWN_SPELL ~SPWI106~ #0 ~wizard~
    ADD_KNOWN_SPELL ~SPWI107~ #0 ~wizard~
    ADD_KNOWN_SPELL ~SPWI118~ #0 ~wizard~
    
LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 12 Int = 10 Wis = 15 Cha = 10  
                          STR_VAR NpcName = ~RASAAD~ ScriptName = ~RASAAD~ ClassName = ~MONK~ KitName = ~SUN_SOUL~ END       

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 10 Con = 13 Int = 8 Wis = 13 Cha = 15  
                          STR_VAR NpcName = ~DORN~ ScriptName = ~DORN~ ClassName = ~PALADIN~ KitName = ~BLACKGUARD~ END      

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 9 Dex = 16 Con = 12 Int = 17 Wis = 9 Cha = 11  RemoveKnownSpells = 0
                          STR_VAR NpcName = ~NEERA~ ScriptName = ~NEERA~ ClassName = ~MAGE~ KitName = ~WILDMAGE~  END

LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 18 Con = 12 Int = 10 Wis = 10 Cha = 18  
                          STR_VAR NpcName = ~BAELOTH~ ScriptName = ~BAELOTH~ ClassName = ~SORCERER~ KitName = ~DRAGON_DISCIPLE~   END
                          
                          