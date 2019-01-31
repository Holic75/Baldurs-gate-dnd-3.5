


ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
    OUTER_SET col_width = 5
END
ELSE ACTION_IF (~%GameId%~ STR_EQ ~Bg1~ AND IncludesSod) BEGIN
    OUTER_SET col_width = 3
END
ELSE BEGIN
    OUTER_SET col_width = 4
END


OUTER_SPRINT AREA_FIND ~area 0 0 280 55~
OUTER_SPRINT AREA_REPLACE ~area 0 0 270 55~
ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
    OUTER_SPRINT AREA_FIND ~area 0 0 230 55~
    OUTER_SPRINT AREA_REPLACE ~area 0 0 180 55~
END                    


OUTER_SET original_name_col_width = 62
ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
    OUTER_SET original_name_col_width = 53
END
ELSE ACTION_IF (IncludesSod) BEGIN
    OUTER_SET original_name_col_width = 64
END
OUTER_SET target_name_col_width = original_name_col_width - (2*col_width)

OUTER_SPRINT NAME_COL_WIDTH_FIND EVALUATE_BUFFER ~width %original_name_col_width%~
OUTER_SPRINT NAME_COL_WIDTH_REPLACE EVALUATE_BUFFER ~width %target_name_col_width%~

OUTER_SPRINT BUTTON_PLUS_FIND ~if cellNumber == 7 and plusButtonClickable(currentChargenProficiency) then~
OUTER_SPRINT BUTTON_PLUS_REPLACE ~if cellNumber == 9 and plusButtonClickable(currentChargenProficiency) then~
OUTER_SPRINT BUTTON_MINUS_FIND ~if cellNumber == 8 and minusButtonClickable(currentChargenProficiency) then~
OUTER_SPRINT BUTTON_MINUS_REPLACE ~if cellNumber == 10 and minusButtonClickable(currentChargenProficiency) then~

OUTER_SPRINT PROF_FIND ~enabled "chargen.proficiency[rowNumber].value > 4"~
OUTER_SPRINT PROF_REPLACE EVALUATE_BUFFER
               ~enabled "chargen.proficiency[rowNumber].value > 6"
            }
        }
		column
		{
			width %col_width%
			label
			{
				bam GUIPFC
				area 0 19 16 16
				align center center
				enabled "chargen.proficiency[rowNumber].value > 5"
			}
		}
		column
		{
			width %col_width%
			label
			{
				bam GUIPFC
				area 0 19 16 16
				align center center
				enabled "chargen.proficiency[rowNumber].value > 4"~
                
COPY_EXISTING ~UI.menu~ ~override~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%PROF_FIND%~ ~%PROF_REPLACE%~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%BUTTON_PLUS_FIND%~ ~%BUTTON_PLUS_REPLACE%~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%BUTTON_MINUS_FIND%~ ~%BUTTON_MINUS_REPLACE%~    
    REPLACE_TEXTUALLY   CASE_SENSITIVE EXACT_MATCH ~%NAME_COL_WIDTH_FIND%~ ~%NAME_COL_WIDTH_REPLACE%~ 
    REPLACE_TEXTUALLY   CASE_SENSITIVE EXACT_MATCH ~%AREA_FIND%~ ~%AREA_REPLACE%~