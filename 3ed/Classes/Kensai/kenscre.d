/* Example DLG file for example MOD */
BEGIN kenscre

IF ~True()~ THEN BEGIN 1
	SAY ~Select Signature Weapon Category. 
	At level 1 kensai gets for free Weapon Focus with this category, at level 4 - Weapon Specilization, at level 8 - Improved Weapon Focus, at level 12 - Improved Weapon Specialization, at level 16 - Weapon Mastery, at level 21 - Epic Weapon Focus and finally at level 24 - Epic Weapon Specialization.~
	%condition_str%
END	

	%give_feat_str%




