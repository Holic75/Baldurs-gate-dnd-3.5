
    //append thief_base
    OUTER_SPRINT THIEF_BASE_STR  ~$ $ THIEF_BASE~
    OUTER_FOR (i=0;i<=50;i=i+1) BEGIN
        OUTER_SPRINT THIEF_BASE_STR EVALUATE_BUFFER ~%THIEF_BASE% 0~
    END
        
    APPEND_COL  ~WEAPPROF.2DA~ 
    ~$ $ THIEF_BASE 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0~
      
        
	COPY ~3ed/Core/Proficiencies/Map/WEAPPROF.2DA~ ~override/MAP_PROF.2DA~ 
	
		COUNT_2DA_ROWS 10 n_rows
		COUNT_2DA_COLS n_cols 
		SET n_cols_header = n_cols - 4
				
		FOR (i=1;i<n_rows;i=i+1) BEGIN
				
			FOR (j=0;j<n_cols_header;j=j+1) BEGIN
				READ_2DA_ENTRY 0 (j+3) 10 class_string //read header 
				READ_2DA_ENTRY i  1 10 prof_id //read proficiency ids
				READ_2DA_ENTRY i (j+4) 10 max_prof_value 
					
				DEFINE_ASSOCIATIVE_ARRAY MaxProfsValuesMap  BEGIN					
					~%class_string%~,~%prof_id%~ =>~%max_prof_value%~
				END
			END
		
		END
		
	COPY_EXISTING ~WEAPPROF.2DA~ ~override~
		COUNT_2DA_ROWS 10 n_rows
		COUNT_2DA_COLS n_cols 
		SET n_cols_header = n_cols - 4
		FOR (i=1;i<n_rows;i=i+1) BEGIN
				
			FOR (j=0;j<n_cols_header;j=j+1) BEGIN
				READ_2DA_ENTRY 0 (j+3) 10 class_string //read header 
				READ_2DA_ENTRY i  1 10 prof_id //read proficiency ids
								
				//PATCH_PRINT ~%class_string%~
				//PATCH_PRINT ~%prof_id%~
				SET max_prof_value = $MaxProfsValuesMap("%class_string%" "%prof_id%") 
					
				SET_2DA_ENTRY i (j+4) 10 max_prof_value 
			END
		END
		