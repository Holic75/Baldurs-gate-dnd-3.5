/* Example DLG file for example MOD */
BEGIN domain

IF ~True()~ THEN BEGIN 0
	SAY ~Choose a domain.~
	%domain_str%
END

IF ~True()~ THEN BEGIN 1000
	SAY ~Now choose another domain.~
	IF ~True()~ THEN GOTO 0
END


%domain_description_str%

