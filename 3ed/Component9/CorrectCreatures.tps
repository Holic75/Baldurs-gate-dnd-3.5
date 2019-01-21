
//set general for undead for "undead creatures" who are not set by beamdog
OUTER_SET undead_id  = IDS_OF_SYMBOL ( ~General~ ~UNDEAD~)

ACTION_IF (~%GameId%~ STR_EQ ~Bg1~) BEGIN
    COPY_EXISTING ~BPSKEL.CRE~ ~override~
        WRITE_BYTE 0x0271 undead_id

END

ACTION_IF (~%GameId%~ STR_EQ ~Bg2~) BEGIN
    COPY_EXISTING ~ohbvmp02.CRE~ ~override~
        WRITE_BYTE 0x0271 undead_id
END
    
