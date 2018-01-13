/* Example DLG file for example MOD */
BEGIN   

IF ~True()~ THEN BEGIN 1
	SAY ~Select ability which will be increased by 1 point.~
	IF ~~  THEN REPLY ~Strength~ DO ~ApplySpellRES("STSTRBN",LastSummonerOf(Myself))~ EXIT
	IF ~~  THEN REPLY ~Dexterity~ DO ~ApplySpellRES("STDEXBN",LastSummonerOf(Myself))~ EXIT
	IF ~~  THEN REPLY ~Constitution~ DO ~ApplySpellRES("STCONBN",LastSummonerOf(Myself))~ EXIT
	IF ~~  THEN REPLY ~Intelligence~ DO ~ApplySpellRES("STINTBN",LastSummonerOf(Myself))~ EXIT
	IF ~~  THEN REPLY ~Wisdom~ DO ~ApplySpellRES("STWISBN",LastSummonerOf(Myself))~ EXIT
	IF ~~  THEN REPLY ~Charisma~ DO ~ApplySpellRES("STCHABN",LastSummonerOf(Myself))~ EXIT
END




