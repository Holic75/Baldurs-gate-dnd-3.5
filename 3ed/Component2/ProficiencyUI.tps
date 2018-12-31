


ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
    OUTER_SET col_width = 5
END
ELSE IF (~%GameId%~ STR_EQ ~Bg1~ AND IncludesSod) BEGIN
    OUTER_SET col_width = 3
END
ELSE BEGIN
    OUTER_SET col_width = 4
END


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
    REPLACE_TEXTUALLY ~%PROF_FIND%~ ~%PROF_REPLACE%~               
   