
BEGIN mage_sl

IF ~True()~ THEN BEGIN 0
	SAY ~Choose a spell you want to scribe to a scroll.~
    
    IF ~%level1_cond_str%~ THEN REPLY ~First level spells.~ GOTO 11
    IF ~%level2_cond_str%~ THEN REPLY ~Second level spells.~ GOTO 12
    IF ~%level3_cond_str%~ THEN REPLY ~Third level spells.~ GOTO 13
    IF ~%level4_cond_str%~ THEN REPLY ~Fourth level spells.~ GOTO 14
    IF ~%level5_cond_str%~ THEN REPLY ~Fifth level spells.~ GOTO 15
    IF ~%level6_cond_str%~ THEN REPLY ~Sixth level spells.~ GOTO 16
    IF ~%level7_cond_str%~ THEN REPLY ~Seventh level spells.~ GOTO 17
    IF ~%level8_cond_str%~ THEN REPLY ~Eighth level spells.~ GOTO 18
    IF ~%level9_cond_str%~ THEN REPLY ~Nineth level spells.~ GOTO 19   
    IF ~True()~ THEN REPLY ~Pass.~ EXIT    
END

IF ~~ THEN BEGIN 11
    SAY ~Select first level spell to scribe to a scroll.~
    %level1_spell_list%
    IF ~True()~ THEN REPLY ~Choose a spell from another level.~ GOTO 0
END

IF ~~ THEN BEGIN 12
    SAY ~Select second level spell to scribe to a scroll.~
    %level2_spell_list%
    IF ~True()~ THEN REPLY ~Choose a spell from another level.~ GOTO 0
END

IF ~~ THEN BEGIN 13
    SAY ~Select third level spell to scribe to a scroll.~
    %level3_spell_list%
    IF ~True()~ THEN REPLY ~Choose a spell from another level.~ GOTO 0
END

IF ~~ THEN BEGIN 14
    SAY ~Select fourth level spell to scribe to a scroll.~
    %level4_spell_list%
    IF ~True()~ THEN REPLY ~Choose a spell from another level.~ GOTO 0
END

IF ~~ THEN BEGIN 15
    SAY ~Select fifth level spell to scribe to a scroll.~
    %level5_spell_list%
    IF ~True()~ THEN REPLY ~Choose a spell from another level.~ GOTO 0
END

IF ~~ THEN BEGIN 16
    SAY ~Select sixth level spell to scribe to a scroll.~
    %level6_spell_list%
    IF ~True()~ THEN REPLY ~Choose a spell from another level.~ GOTO 0
END

IF ~~ THEN BEGIN 17
    SAY ~Select seventh level spell to scribe to a scroll.~
    %level7_spell_list%
    IF ~True()~ THEN REPLY ~Choose a spell from another level.~ GOTO 0
END

IF ~~ THEN BEGIN 18
    SAY ~Select eighth level spell to scribe to a scroll.~
    %level8_spell_list%
    IF ~True()~ THEN REPLY ~Choose a spell from another level.~ GOTO 0
END

IF ~~ THEN BEGIN 19
    SAY ~Select nineth level spell to scribe to a scroll.~
    %level9_spell_list%
    IF ~True()~ THEN REPLY ~Choose a spell from another level.~ GOTO 0
END

%spell_entries%



