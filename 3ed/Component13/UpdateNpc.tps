
    ACTION_IF (~%GameId%~ STR_EQ ~Bg1~) BEGIN
       INCLUDE ~3ed/Component13/NpcBg1.tps~ 

        ACTION_IF (IncludesSod) BEGIN
            INCLUDE ~3ed/Component13/NpcSod.tps~ 
        END
       
    END
    ELSE ACTION_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN
        INCLUDE ~3ed/Component13/NpcBg2.tps~                        
    END
    
    