
    ACTION_IF (~%GameId%~ STR_EQ ~Bg1~) BEGIN

    	LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 12 Int = 10 Wis = 16 Cha = 10 
            STR_VAR NpcName = ~KIVAN~ ScriptName = ~KIVAN~ ClassName = ~CLERIC_RANGER~  END        
                   
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 20 Con = 10 Int = 14 Wis = 9 Cha = 9  PickPockets = 5 HideInShadows = 5
            STR_VAR NpcName = ~ALORA~ ScriptName = ~ALORA~ ClassName = ~THIEF~  KitName = ~THIEF_BASE~ END
            
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 14 Con = 16 Int = 8 Wis = 8 Cha = 8 
                                  STR_VAR NpcName = ~MINSC~ ScriptName = ~MINSC~ ClassName = ~FIGHTER~ KitName =~BARBARIAN~ END
           
        
        COPY  ~3ed/Npc/Bg1/DYNAHEIR.BCS~ ~override~//remove wizard spells given via script
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 14 Con = 14 Int = 10 Wis = 9 Cha = 17  
                                  STR_VAR NpcName = ~DYNAHE~ ScriptName = ~DYNAHEIR~ ClassName = ~SORCERER~  END     
      
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 10 Con = 16 Int = 10 Wis = 16 Cha = 12  
                                  STR_VAR NpcName = ~YESLIC~ ScriptName = ~YESLICK~ ClassName = ~CLERIC~  END 
                                 
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 18 Con = 12 Int = 10 Wis = 14 Cha = 10  
                                  STR_VAR NpcName = ~CORAN~ ScriptName = ~CORAN~ ClassName = ~RANGER~ Kit = ~FERALAN~ END     

    	LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 10 Con = 14 Int = 10 Wis = 14 Cha = 16 
                                  STR_VAR NpcName = ~AJANTI~ ScriptName = ~AJANTIS~ ClassName = ~PALADIN~  END   

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 14 Con = 14 Int = 15 Wis = 9 Cha = 9  Lockpick = 4 FindTraps = 4
                                  STR_VAR NpcName = ~KHALID~ ScriptName = ~KHALID~ ClassName = ~FIGHTER_THIEF~ END                

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 10 Wis = 16 Cha = 10 
                                  STR_VAR NpcName = ~JAHEIR~ ScriptName = ~JAHEIRA~ ClassName = ~FIGHTER_DRUID~ END    

                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 16 Con = 14 Int = 14 Wis = 9 Cha = 14 RemoveKnownSpells = 0
                                  STR_VAR NpcName = ~GARRIC~ ScriptName = ~GARRICK~ ClassName = ~BARD~  END  
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 11 Dex = 16 Con = 14 Int = 16 Wis = 9 Cha = 10  Lockpick = 4 FindTraps = 4 RemoveKnownSpells = 0 RemoveMemorizedSpells = 0
                                  STR_VAR NpcName = ~SAFANA~ ScriptName = ~SAFANA~ ClassName = ~THIEF~ KitName = ~SWASHBUCKLER~  END   

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 10 Wis = 16 Cha = 10
                                  STR_VAR NpcName = ~FALDOR~ ScriptName = ~FALDORN~ ClassName = ~DRUID~ KitName = ~BEASTFRIEND~ END 
                
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 15 Dex = 10 Con = 14 Int = 10 Wis = 16 Cha = 12  
                                  STR_VAR NpcName = ~BRANWE~ ScriptName = ~BRANWEN~ ClassName = ~FIGHTER_CLERIC~ END    
        COPY_EXISTING ~BRANWE.CRE~ ~override~
            //return spiritual hammer
            ADD_KNOWN_SPELL ~SPIN113~ #0 ~innate~
            ADD_MEMORIZED_SPELL ~SPIN113~ #0 ~innate~ (3)
        
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 16 Con = 16 Int = 16 Wis = 10 Cha = 8  Lockpick = 4 FindTraps = 4
                                  STR_VAR NpcName = ~QUAYLE~ ScriptName = ~QUAYLE~ ClassName = ~MAGE_THIEF~ KitName = ~MAGESCHOOL_ILLUSIONIST~ END    
        COPY_EXISTING ~QUAYLE.CRE~ ~override~        
            //return invisibility and 1st lvl spells
            ADD_KNOWN_SPELL ~SPIN118~ #0 ~innate~
            ADD_MEMORIZED_SPELL ~SPIN118~ #0 ~innate~                             
            ADD_KNOWN_SPELL ~SPWI112~ #0 ~wizard~
            ADD_KNOWN_SPELL ~SPWI125~ #0 ~wizard~
            
            WRITE_LONG 0x0028 25348 // change animation to thief
            //quayle dialog change reference from cleric mage to mage thief
            STRING_SET 126  @001 
        
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 12 Int = 16 Wis = 10 Cha = 10  RemoveKnownSpells = 0
                                  STR_VAR NpcName = ~XAN~ ScriptName = ~XAN~ ClassName = ~FIGHTER_MAGE~ END          

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 10 Int = 16 Wis = 8 Cha = 10  HideInShadows = 4 MoveSilently = 4
                                  STR_VAR NpcName = ~SKIE~ ScriptName = ~SKIE~ ClassName = ~THIEF~ KitName = ~SHADOWDANCER~   END                           
                
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 14 Wis = 10 Cha = 14  RemoveKnownSpells = 0 
                                  STR_VAR NpcName = ~ELDOTH~ ScriptName = ~ELDOTH~ ClassName = ~BARD~ KitName = ~BLADE~ END     
        COPY_EXISTING ~ELDOTH.CRE~ ~override~
            ADD_MEMORIZED_SPELL ~SPIN116~ #0 ~innate~ //give back poison arrows
        
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 14 Con = 12 Int = 18 Wis = 9 Cha = 9 RemoveKnownSpells = 0
                                  STR_VAR NpcName = ~XZAR~ ScriptName = ~XZAR~ ClassName = ~MAGE~ Kit = ~MAGESCHOOL_NECROMANCER~ END       
        
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 14 Int = 16 Wis = 9 Cha = 9  MoveSilently = 4 FindTraps = 4
                                  STR_VAR NpcName = ~MONTAR~ ScriptName = ~MONTARON~ ClassName = ~THIEF~ KitName = ~ASSASIN~   END   

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 16 Con = 16 Int = 16 Wis = 16 Cha = 8
                                  STR_VAR NpcName = ~TIAX~ ScriptName = ~TIAX~ ClassName = ~CLERIC_MAGE~  END                                            
        COPY_EXISTING ~TIAX.CRE~ ~override~
            //give back summon ghast
            ADD_KNOWN_SPELL ~SPIN115~ #0 ~innate~
            ADD_MEMORIZED_SPELL ~SPIN115~ #0 ~innate~ 
            //add few wizard spells
            ADD_KNOWN_SPELL ~SPWI112~ #0 ~wizard~
            ADD_KNOWN_SPELL ~SPWI125~ #0 ~wizard~
            ADD_KNOWN_SPELL ~SPWI116~ #0 ~wizard~
            WRITE_LONG 0x0028 25092 // change animation to mage
            //replace leather armor with robe knave's robe           
            REPLACE_CRE_ITEM ~CLCK12~ #0 #0 #0 ~IDENTIFIED~ ~ARMOR~
            
 
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 10 Con = 19 Int = 10 Wis = 11 Cha = 8
                                  STR_VAR NpcName = ~KAGAIN~ ScriptName = ~KAGAIN~ ClassName = ~FIGHTER~ KitName = ~DWARVEN_DEFENDER~  END   
 
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 16 Con = 10 Int = 10 Wis = 14 Cha = 8 HpTotal = 10
                                  STR_VAR NpcName = ~SHARTE~ ScriptName = ~SHARTEEL~ ClassName = ~RANGER~ KitName = ~STALKER~  END   
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 12 Con = 14 Int = 18 Wis = 9 Cha = 10 RemoveKnownSpells = 0
                                  STR_VAR NpcName = ~EDWIN~ ScriptName = ~EDWIN~ ClassName = ~MAGE~ Kit = ~MAGESCHOOL_CONJURER~ END

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 10 Int = 16 Wis = 14 Cha = 14 MoveSilently = 4 HideInShadows = 4
                                  STR_VAR NpcName = ~VICONI~ ScriptName = ~VICONIA~ ClassName = ~CLERIC_THIEF~ END   
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 9 Dex = 16 Con = 10 Int = 14 Wis = 8 Cha = 17 
                                  STR_VAR NpcName = ~IMOEN+.*~ ScriptName = ~IMOEN~ ClassName = ~BARD~ KitName = ~JESTER~ END                                    

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 12 Int = 10 Wis = 15 Cha = 10  
                                  STR_VAR NpcName = ~RASAAD~ ScriptName = ~RASAAD~ ClassName = ~MONK~ KitName = ~SUN_SOUL~ END       

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 10 Con = 12 Int = 8 Wis = 14 Cha = 15  
                                  STR_VAR NpcName = ~DORN~ ScriptName = ~DORN~ ClassName = ~PALADIN~ KitName = ~BLACKGUARD~ END      

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 9 Dex = 16 Con = 12 Int = 17 Wis = 9 Cha = 11  RemoveKnownSpells = 0
                                  STR_VAR NpcName = ~NEERA~ ScriptName = ~NEERA~ ClassName = ~MAGE~ KitName = ~WILDMAGE~  END

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 18 Con = 12 Int = 10 Wis = 10 Cha = 18  
                                  STR_VAR NpcName = ~BAELOTH~ ScriptName = ~BAELOTH~ ClassName = ~SORCERER~ KitName = ~DRAGON_DISCIPLE~   END                                    
                                  
    END
    ELSE ACTION_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN
    
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 14 Con = 16 Int = 8 Wis = 8 Cha = 8 
                                  STR_VAR NpcName = ~MINSC+.*~ ScriptName = ~MINSC~ ClassName = ~FIGHTER~ KitName =~BARBARIAN~ END
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 10 Wis = 16 Cha = 10 
                                  STR_VAR NpcName = ~JAHEIR+.*~ ScriptName = ~JAHEIRA~ ClassName = ~FIGHTER_DRUID~ END
        COPY_EXISTING_REGEXP ~JAHEIR+.*\.CRE~ ~override~ //put back harpers call
            ADD_MEMORIZED_SPELL ~SPJA01~ #4 ~priest~                                  
                                  
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 12 Con = 14 Int = 18 Wis = 9 Cha = 10 RemoveKnownSpells = 0
                                  STR_VAR NpcName = ~EDWIN+.*~ ScriptName = ~EDWIN~ ClassName = ~MAGE~ Kit = ~MAGESCHOOL_CONJURER~ END
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 10 Int = 16 Wis = 14 Cha = 14 MoveSilently = 4 HideInShadows = 4
                                  STR_VAR NpcName = ~VICONI+.*~ ScriptName = ~VICONIA~ ClassName = ~CLERIC_THIEF~ END       
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 16 Con = 12 Int = 14 Wis = 8 Cha = 16 RemoveKnownSpells = 0 
                                  STR_VAR NpcName = ~IMOEN1+.*~ ScriptName = ~IMOEN~ ClassName = ~BARD~ END  
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 16 Con = 12 Int = 14 Wis = 8 Cha = 16  RemoveKnownSpells = 0
                                  STR_VAR NpcName = ~IMOEN2+.*~ ScriptName = ~IMOEN2~ ClassName = ~BARD~  END   
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 16 Wis = 10 Cha = 10  Lockpick = 4 FindTraps = 4
                                  STR_VAR NpcName = ~YOSHI+.*~ ScriptName = ~YOSHIMO~ ClassName = ~FIGHTER_THIEF~ END    

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 14 Int = 10 Wis = 14 Cha = 10  
                                  STR_VAR NpcName = ~VALYG+.*~ ScriptName = ~VALYGAR~ ClassName = ~RANGER~ Kit = ~STALKER~ END     


        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 16 Con = 12 Int = 10 Wis = 10 Cha = 16  
                                  STR_VAR NpcName = ~Nalia[0-9]+.*~ ScriptName = ~NALIA~ ClassName = ~SORCERER~ Kit = ~DRAGON_DISCIPLE~   END                                    
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 18 Con = 14 Int = 10 Wis = 14 Cha = 10  RemoveKnownSpells = 0 RemoveMemorizedSpells = 0
                                  STR_VAR NpcName = ~MAZZY+.*~ ScriptName = ~MAZZY~ ClassName = ~FIGHTER~ KitName= ~KENSAI~   END                                         
         //STRING_SET 11569  @002 //change biography (remove line about not being paladin)
         
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 12 Con = 18 Int = 8 Wis = 8 Cha = 8  
                                  STR_VAR NpcName = ~KORGAN+.*~ ScriptName = ~KORGAN~ ClassName = ~FIGHTER~ KitName = ~BERSERKER~ END      
         
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 10 Con = 14 Int = 10 Wis = 10 Cha = 16  
                                  STR_VAR NpcName = ~KELDOR+.*~ ScriptName = ~KELDORN~ ClassName = ~PALADIN~ KitName = ~INQUISITOR~ END       

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 16 Con = 16 Int = 16 Wis = 9 Cha = 9  Lockpick = 4 FindTraps = 4 RemoveKnownSpells = 0 
                                  STR_VAR NpcName = ~JAN[0-9]+.*~ ScriptName = ~JAN~ ClassName = ~MAGE_THIEF~ KitName = ~MAGESCHOOL_ILLUSIONIST~ END                 
        COPY_EXISTING_REGEXP ~JAN[0-9]+.*\.CRE~ ~override~ //put innate for creating ammo back
            ADD_MEMORIZED_SPELL ~SPIN829~ #0 ~innate~
            
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 10 Int = 16 Wis = 10 Cha = 14  RemoveKnownSpells = 0 
                                  STR_VAR NpcName = ~HAER+.*~ ScriptName = ~HAERDALI~ ClassName = ~BARD~ KitName = ~BLADE~ END  

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 14 Con = 12 Int = 10 Wis = 18 Cha = 10  
                                  STR_VAR NpcName = ~CERND+.*~ ScriptName = ~CERND~ ClassName = ~DRUID~ KitName = ~SHAPESHIFTER~ END    

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 15 Dex = 10 Con = 14 Int = 10 Wis = 16 Cha = 12  
                                  STR_VAR NpcName = ~ANOMEN+.*~ ScriptName = ~ANOMEN~ ClassName = ~FIGHTER_CLERIC~ END    
                
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 10 Int = 16 Wis = 16 Cha = 12  RemoveKnownSpells = 0  HpTotal = 5
                                  STR_VAR NpcName = ~AERIE[0-9]+.*~ ScriptName = ~AERIE~ ClassName = ~CLERIC_MAGE~  END  
        COPY_EXISTING_REGEXP ~AERIE[0-9]+.*\.CRE~ ~override~       
                REMOVE_KNOWN_SPELL ~sppr202~ ~sppr206~ //remove druid spells

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 14 Con = 14 Int = 14 Wis = 10 Cha = 10  
                                  STR_VAR NpcName = ~SAREVOK~ ScriptName = ~SAREV25~ ClassName = ~FIGHTER~ END       

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 12 Int = 10 Wis = 15 Cha = 10  
                                  STR_VAR NpcName = ~RASAAD+.*~ ScriptName = ~RASAAD~ ClassName = ~MONK~ KitName = ~SUN_SOUL~ END       

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 10 Con = 12 Int = 8 Wis = 14 Cha = 15  
                                  STR_VAR NpcName = ~DORN+.*~ ScriptName = ~DORN~ ClassName = ~PALADIN~ KitName = ~BLACKGUARD~ END      

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 9 Dex = 16 Con = 12 Int = 17 Wis = 9 Cha = 11  RemoveKnownSpells = 0
                                  STR_VAR NpcName = ~NEERA+.*~ ScriptName = ~NEERA~ ClassName = ~MAGE~ KitName = ~WILDMAGE~  END   

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 10 Con = 18 Int = 8 Wis = 8 Cha = 8  
                                  STR_VAR NpcName = ~WILSON+.*~ ScriptName = ~WILSON~ ClassName = ~FIGHTER~ KitName = ~GRIZZLY_BEAR~ END   
      

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 16 Con = 12 Int = 16 Wis = 10 Cha = 10  Lockpick = 5 FindTraps = 5
                                  STR_VAR NpcName = ~ohhfak+.*~ ScriptName = ~OHHFAK~ ClassName = ~THIEF~  KitName = ~THIEF_BASE~  END          

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 20 Con = 12 Int = 18 Wis = 12 Cha = 14  HideInShadows = 4 FindTraps = 4 RemoveKnownSpells = 0 RemoveMemorizedSpells = 0
                                  STR_VAR NpcName = ~ohhex+.*~ ScriptName = ~HEXXAT~ ClassName = ~THIEF~ KitName = ~SHADOWDANCER~   END                      
    END
    