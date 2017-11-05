/* Example DLG file for example MOD */
BEGIN feicre


IF ~True()~ THEN BEGIN 1
	SAY ~Improved Racial Enemy: At 1st level, a stalker may select a type of creature from among the list for which he gets +4 bonus on to hit and damage rolls as well as +2 AC and savingthrows bonus. Stalker can select another improved racial enemy at levels 5, 10, 15 and 20.~
	%condition_str%
END 

%give_str%
