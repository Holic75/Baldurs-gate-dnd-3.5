/* Example DLG file for example MOD */
BEGIN bldline

IF ~True()~ THEN BEGIN 0
	SAY ~Choose your bloodline.~
	%bloodline_str%
END


%bloodline_description_str%

