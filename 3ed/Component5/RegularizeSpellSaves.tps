
//make saves of the spells (if any) uniformly equal to [(power+1)/2]

	COPY_EXISTING_REGEXP GLOB ~.+\.\(\(spl\)\|\(itm\)\)~ ~override~		
        PATCH_IF (~%SOURCE_RES%~ STR_EQ ~SPWI104~ //charm person (+3, nothing in iwd)
        OR ~%SOURCE_RES%~ STR_EQ ~SPWI118~  OR ~%SOURCE_RES%~ STR_EQ ~SPDR101~ //chromatic orb (+6)
        OR ~%SOURCE_RES%~ STR_EQ ~SPPR720~ OR ~%SOURCE_RES%~ STR_EQ ~SPOGRE01~ OR ~%SOURCE_RES%~ STR_EQ ~ohbquake~ //earthquake
        OR ~%SOURCE_RES%~ STR_EQ ~SPWI818~  //bigby hand
        OR ~%SOURCE_RES%~ STR_EQ ~SPWI918~ //bigby fist
        OR (~%SOURCE_RES%~ STR_EQ ~SPPR204~ AND NOT (~%GameId%~ STR_EQ ~Iwd~))) BEGIN  //charm person or mammal (+3, nothing in iwd)
            LPF REGULARIZE_SPELL_SAVES INT_VAR ignore_pwr = 0 increment_save = 1 END
        END
        ELSE BEGIN
             LPF REGULARIZE_SPELL_SAVES INT_VAR ignore_pwr = 0 RET update_descr = updated END
             
             PATCH_IF (update_descr) BEGIN
                FOR (substring_to_remove_ref = 10001; substring_to_remove_ref<=10007;substring_to_remove_ref+=1) BEGIN
                    LPF REMOVE_SUBSTRING INT_VAR strref_offset = 0x0050 substring_to_remove_ref END
                END
            END
        END
        
        

              
    COPY_EXISTING_REGEXP GLOB ~.+\.eff~ ~override~		
		READ_LONG 0x0018 power
        READ_BYTE 0x0040 save_type
        PATCH_IF (power>0 AND power>=10 AND save_type!=0) BEGIN
            SET save_bonus =  0 - ((power+1)/2)
            WRITE_LONG 0x0044 save_bonus
        END
        