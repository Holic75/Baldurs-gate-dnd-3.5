/* Example DLG file for example MOD */
BEGIN fecre


IF ~True()~ THEN BEGIN 1
	SAY ~Racial Enemy: At 1st level, a ranger, cleric/ranger, or fighter/druid may select a type of creature from among the list for which <PRO_HESHE> gets +4 bonus on damage rolls. Characters of these classes can select another racial enemy at level 5 and every 5 levels thereafter.~
	%condition_str%
END 


%give_str%


