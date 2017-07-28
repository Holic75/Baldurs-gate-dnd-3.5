/* Example DLG file for example MOD */
BEGIN hfcre

IF ~True()~ THEN BEGIN 1
	SAY ~Select ability which will be increased by 2 points.~
	IF ~~  THEN REPLY ~Strength~ DO ~ApplySpellRES("HFSTRBN",LastSummonerOf(Myself))~ EXIT
	IF ~~  THEN REPLY ~Dexterity~ DO ~ApplySpellRES("HFDEXBN",LastSummonerOf(Myself))~ EXIT
	IF ~~  THEN REPLY ~Constitution~ DO ~ApplySpellRES("HFCONBN",LastSummonerOf(Myself))~ EXIT
	IF ~~  THEN REPLY ~Intelligence~ DO ~ApplySpellRES("HFINTBN",LastSummonerOf(Myself))~ EXIT
	IF ~~  THEN REPLY ~Wisdom~ DO ~ApplySpellRES("HFWISBN",LastSummonerOf(Myself))~ EXIT
	IF ~~  THEN REPLY ~Charisma~ DO ~ApplySpellRES("HFCHABN",LastSummonerOf(Myself))~ EXIT
END




