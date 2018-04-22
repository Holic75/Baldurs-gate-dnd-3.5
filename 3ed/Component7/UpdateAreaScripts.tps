	
    //update area scripts so that animal companion is properly transferred to the location of summoner
    COPY_EXISTING_REGEXP GLOB ~.+\.are~ ~override~
	//first create empty scripts for areas without ones		
		PATCH_IF NOT (FILE_EXISTS_IN_GAME ~%SOURCE_RES%.bcs~) THEN BEGIN
			SPRINT AR_NAME EVALUATE_BUFFER ~%SOURCE_RES%~
			INNER_ACTION BEGIN 
				COPY ~3ed/Classes/AnimalCompanion/AreaExtension/ARTEMP.bcs~ ~override/%AR_NAME%.bcs~
			END
			WRITE_EVALUATED_ASCII 0x0094 ~%AR_NAME%~ #8
		END
		
	//then add script that moves all existing animal companions to area of player 1	
	OUTER_SET ar_id=0
	COPY_EXISTING_REGEXP GLOB ~.+\.are~ ~override~
		SET ar_id=ar_id+1
		SPRINT AreaName EVALUATE_BUFFER ~%SOURCE_RES%~
		INNER_ACTION BEGIN 
			EXTEND_BOTTOM ~%SOURCE_RES%.bcs~ ~3ed/Classes/AnimalCompanion/ACMPAR.baf~
				EVALUATE_BUFFER
		END
	//unsummon all companions after rest
	EXTEND_TOP_REGEXP ~\(BD\)*BALDUR.*\.BCS~ ~3ed/Classes/AnimalCompanion/baldur2.baf~
		EVALUATE_BUFFER