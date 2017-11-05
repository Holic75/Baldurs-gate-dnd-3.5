
ACTION_DEFINE_ASSOCIATIVE_ARRAY RacesDescriptions BEGIN

	 HUMAN => 001
	 ELF => 002
	 DWARF => 003
	 GNOME => 004
	 HALFLING => 005
	 HALF_ORC => 006
	 HALF_ELF =>007

END



COPY_EXISTING ~RACETEXT.2DA~ ~Override~

	COUNT_2DA_ROWS 6 n_rows
	COUNT_2DA_COLS n_cols 
	
	FOR (i=0;i<n_rows;i=i+1) BEGIN
	
		READ_2DA_ENTRY i 0 6 race_string
		
		READ_2DA_ENTRY i 3 6 descr_string

		
		PATCH_SILENT
		PATCH_TRY		//try to set kit description
			SET StrRef =  $RacesDescriptions(~%race_string%~)	
				
			INNER_ACTION BEGIN
				STRING_SET_EVALUATE %descr_string% (AT "StrRef")			
			END			
		WITH		
			DEFAULT
				PATCH_PRINT ~Description for %race_string% not found~
		END
	
		
	END

	VERBOSE
	
