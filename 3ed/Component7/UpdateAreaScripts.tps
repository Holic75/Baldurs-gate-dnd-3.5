	
    //update area scripts so that animal companion is properly transferred to the location of summoner
    COPY_EXISTING_REGEXP GLOB ~.+\.are~ ~override~
	//first create empty scripts for areas without ones
        READ_ASCII 0x0094 script_name
        PATCH_IF (NOT STRING_LENGTH script_name) BEGIN
           SPRINT script_name EVALUATE_BUFFER ~%SOURCE_RES%~
        END       
		PATCH_IF NOT (FILE_EXISTS_IN_GAME ~%script_name%.bcs~) THEN BEGIN
			INNER_ACTION BEGIN 
				COPY ~3ed/Classes/AnimalCompanion/AreaExtension/ARTEMP.bcs~ ~override/%script_name%.bcs~
			END
			WRITE_EVALUATED_ASCII 0x0094 ~%script_name%~ #8
		END
		
	//then add script that moves all existing animal companions to area of player 1	
	OUTER_SET ar_id=0
	COPY_EXISTING_REGEXP GLOB ~.+\.are~ ~override~
		SET ar_id=ar_id+1
		SPRINT AreaName EVALUATE_BUFFER ~%SOURCE_RES%~
        READ_ASCII 0x0094 script_name
		INNER_ACTION BEGIN 
			EXTEND_BOTTOM ~%script_name%.bcs~ ~3ed/Classes/AnimalCompanion/ACMPAR.baf~
				EVALUATE_BUFFER
		END
	//unsummon all companions after rest
	EXTEND_TOP_REGEXP ~\(BD\)*BALDUR.*\.BCS~ ~3ed/Classes/AnimalCompanion/baldur2.baf~
		EVALUATE_BUFFER