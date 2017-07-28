/* Example DLG file for example MOD */
BEGIN domain

IF ~True()~ THEN BEGIN 0
	SAY ~Choose a domain.~
	%domain_str%
END


%domain_description_str%

