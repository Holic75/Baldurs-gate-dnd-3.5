
    ACTION_IF (~%GameId%~ STR_EQ ~Bg1~) BEGIN

    	COPY  ~3ed/Npc/%GameId%~ ~override~
        //qualye dialog change
        STRING_SET 126  @001 
    
    END
    ELSE ACTION_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN
    
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 14 Con = 16 Int = 8 Wis = 8 Cha = 8 
                                  STR_VAR NpcName = ~MINSC+.*~ ScriptName = ~MINSC~ ClassName = ~FIGHTER~ KitName =~BARBARIAN~ END
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 10 Wis = 16 Cha = 10 
                                  STR_VAR NpcName = ~JAHEIR+.*~ ScriptName = ~JAHEIRA~ ClassName = ~FIGHTER_DRUID~ END
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 12 Con = 14 Int = 18 Wis = 9 Cha = 10 
                                  STR_VAR NpcName = ~EDWIN+.*~ ScriptName = ~EDWIN~ ClassName = ~MAGE~ Kit = ~MAGESCHOOL_CONJURER~ RemoveKnownSpells = 0 END
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 18 Con = 10 Int = 14 Wis = 14 Cha = 12 MoveSilently = 4 HideInShadows = 4
                                  STR_VAR NpcName = ~VICONI+.*~ ScriptName = ~VICONIA~ ClassName = ~CLERIC_THIEF~ END       
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 16 Con = 12 Int = 14 Wis = 8 Cha = 16 
                                  STR_VAR NpcName = ~IMOEN1+.*~ ScriptName = ~IMOEN~ ClassName = ~BARD~ RemoveKnownSpells = 0 END  
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 16 Con = 12 Int = 14 Wis = 8 Cha = 16  
                                  STR_VAR NpcName = ~IMOEN2+.*~ ScriptName = ~IMOEN2~ ClassName = ~BARD~ RemoveKnownSpells = 0 END   
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 16 Wis = 10 Cha = 10  Lockpick = 4 FindTraps = 4
                                  STR_VAR NpcName = ~YOSHI+.*~ ScriptName = ~YOSHIMO~ ClassName = ~FIGHTER_THIEF~ END    

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 14 Int = 10 Wis = 14 Cha = 10  
                                  STR_VAR NpcName = ~VALYG+.*~ ScriptName = ~VALYGAR~ ClassName = ~RANGER~ Kit = ~STALKER~ END     


        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 16 Con = 12 Int = 10 Wis = 10 Cha = 16  
                                  STR_VAR NpcName = ~Nalia[0-9]+.*~ ScriptName = ~NALIA~ ClassName = ~SORCERER~ Kit = ~DRAGON_DISCIPLE~   END                                    
                                  
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 18 Con = 14 Int = 10 Wis = 14 Cha = 10  
                                  STR_VAR NpcName = ~MAZZY+.*~ ScriptName = ~MAZZY~ ClassName = ~FIGHTER~ KitName= ~KENSAI~  RemoveKnownSpells = 0 END                                         
         //STRING_SET 11569  @002 //change biography (remove line about not being paladin)
         
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 12 Con = 18 Int = 8 Wis = 8 Cha = 8  
                STR_VAR NpcName = ~KORGAN+.*~ ScriptName = ~KORGAN~ ClassName = ~FIGHTER~ KitName = ~BERSERKER~ END      
         
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 10 Con = 14 Int = 10 Wis = 14 Cha = 16  
                STR_VAR NpcName = ~KELDOR+.*~ ScriptName = ~KELDORN~ ClassName = ~PALADIN~ KitName = ~INQUISITOR~ END       

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 16 Con = 16 Int = 16 Wis = 9 Cha = 9  Lockpick = 4 FindTraps = 4
                STR_VAR NpcName = ~JAN[0-9]+.*~ ScriptName = ~JAN~ ClassName = ~MAGE_THIEF~ KitName = ~MAGESCHOOL_ILLUSIONIST~ RemoveKnownSpells = 0 END                 
 
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 14 Con = 14 Int = 14 Wis = 10 Cha = 14  
                STR_VAR NpcName = ~HAER+.*~ ScriptName = ~HAERDALI~ ClassName = ~BARD~ KitName = ~BLADE~ RemoveKnownSpells = 0 END  

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 10 Dex = 14 Con = 12 Int = 10 Wis = 18 Cha = 10  
                STR_VAR NpcName = ~CERND+.*~ ScriptName = ~CERND~ ClassName = ~DRUID~ KitName = ~SHAPESHIFTER~ END    

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 15 Dex = 10 Con = 14 Int = 10 Wis = 16 Cha = 12  
                STR_VAR NpcName = ~ANOMEN+.*~ ScriptName = ~ANOMEN~ ClassName = ~FIGHTER_CLERIC~ END    
                
        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 8 Dex = 16 Con = 8 Int = 16 Wis = 16 Cha = 12  
                STR_VAR NpcName = ~AERIE+.*~ ScriptName = ~AERIE~ ClassName = ~CLERIC_MAGE~ RemoveKnownSpells = 0 END   

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 14 Con = 14 Int = 14 Wis = 10 Cha = 10  
                STR_VAR NpcName = ~SAREVOK~ ScriptName = ~SAREV25~ ClassName = ~FIGHTER~ END       

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 14 Dex = 16 Con = 12 Int = 10 Wis = 15 Cha = 10  
                STR_VAR NpcName = ~RASAAD+.*~ ScriptName = ~RASAAD~ ClassName = ~MONK~ KitName = ~SUN_SOUL~ END       

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 10 Con = 12 Int = 8 Wis = 14 Cha = 15  
                STR_VAR NpcName = ~DORN+.*~ ScriptName = ~DORN~ ClassName = ~PALADIN~ KitName = ~BLACKGUARD~ END      

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 9 Dex = 16 Con = 12 Int = 17 Wis = 9 Cha = 11  
                STR_VAR NpcName = ~NEERA+.*~ ScriptName = ~NEERA~ ClassName = ~MAGE~ KitName = ~WILDMAGE~ RemoveKnownSpells = 0 END   

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 18 Dex = 10 Con = 18 Int = 8 Wis = 8 Cha = 8  
                STR_VAR NpcName = ~WILSON+.*~ ScriptName = ~WILSON~ ClassName = ~FIGHTER~ KitName = ~GRIZZLY_BEAR~ END   
      

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 12 Dex = 16 Con = 12 Int = 16 Wis = 10 Cha = 10  
                STR_VAR NpcName = ~ohhfak+.*~ ScriptName = ~OHHFAK~ ClassName = ~THIEF~  KitName = ~THIEF_BASE~ RemoveKnownSpells = 0 END          

        LAF SET_DEFAULT_NPC_STATS INT_VAR Str = 16 Dex = 20 Con = 12 Int = 18 Wis = 12 Cha = 14  
                STR_VAR NpcName = ~ohhfak+.*~ ScriptName = ~OHHFAK~ ClassName = ~THIEF~ KitName = ~SHADOWDANCER~ RemoveKnownSpells = 0 END                      
    END
    