/* Example DLG file for example MOD */
BEGIN mftcre

IF ~True()~ THEN BEGIN 1
	SAY ~Select new magic feat.~
	%condition_str%
END


%give_feat_str%

