/* Example DLG file for example MOD */
BEGIN sftcre

IF ~True()~ THEN BEGIN 1
	SAY ~Select new feat.~
	%condition_str%
END


%give_feat_str%

