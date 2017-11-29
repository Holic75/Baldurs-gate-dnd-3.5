
//---------------------------------------------update enemy profciencies and saves/dcs


    ACTION_DEFINE_ASSOCIATIVE_ARRAY ProfRemapCre BEGIN
        90 => 89
        91 => 89
        93 => 89
        96 => 90
        92 => 91
        94 => 92
        95 => 92
       115 => 93
       101 => 93
        97 => 93
       102 => 93
       100 => 94
        98 => 95
        99 => 95
       103 => 96
       105 => 97
       104 => 97
       106 => 98
       107 => 98
    END
    
    COPY_EXISTING_REGEXP GLOB ~.+\.CRE~ ~override~
        PHP_EACH ProfRemapCre AS original_prof => new_prof BEGIN
            LPF ALTER_EFFECT INT_VAR silent = 1 match_opcode = 233 match_parameter2 =  original_prof opcode = 1233 parameter2 = new_prof END
        END
        LPF ALTER_EFFECT INT_VAR silent = 1 match_opcode = 1233 opcode = 233 END 


        //spell dc bonus based on stats
		LPF ADD_CRE_EFFECT INT_VAR opcode=272 timing=9 parameter1=1 parameter2=3 duration=1 STR_VAR resource=~SPDCWBN~ END //int 
		LPF ADD_CRE_EFFECT INT_VAR opcode=272 timing=9 parameter1=1 parameter2=3 duration=1 STR_VAR resource=~SPDCPBN~ END //wis 
		//saves bonus based on stats
		LPF ADD_CRE_EFFECT INT_VAR opcode=272 timing=9 parameter1=1 parameter2=3 duration=1 STR_VAR resource=~DEXSAVBN~ END
		LPF ADD_CRE_EFFECT INT_VAR opcode=272 timing=9 parameter1=1 parameter2=3 duration=1 STR_VAR resource=~CONSAVBN~ END
		LPF ADD_CRE_EFFECT INT_VAR opcode=272 timing=9 parameter1=1 parameter2=3 duration=1 STR_VAR resource=~WISSAVBN~ END
    
        //fix low hp (that npc do not die because of low const)
    
        READ_SHORT 0x0024 CurHp
        READ_SHORT 0x0026 MaxHp
    
        PATCH_IF (MaxHp<5) BEGIN
        
            WRITE_SHORT 0x0024 5
            WRITE_SHORT 0x0026 5
        END
    

    
