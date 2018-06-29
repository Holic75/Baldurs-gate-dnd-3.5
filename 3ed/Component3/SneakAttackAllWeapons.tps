
    OUTER_SET ThiefStrRef = RESOLVE_STR_REF (~Thief~)
    COPY_EXISTING_REGEXP GLOB ~.+\.itm~ ~override~

    	LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~kensai~  RET usable_by_kensai = result END
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~thief~  RET usable_by_thief = result END

        
         //create kits usability
        PATCH_IF (usable_by_kensai AND NOT(usable_by_thief)) BEGIN
            //add all weapons to kitless thief usability to allow making backstab with them
            LPF SET_ITEM_USABILITY INT_VAR value = usable_by_thief OR usable_by_kensai STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~thief~   END  
            //and remove them via effect
            LPF ADD_ITEM_EQEFFECT INT_VAR opcode = 319 target = 1 parameter1 = 4 parameter2 = 5 timing = 2 special = ThiefStrRef END
        END
       /* //create kits usability
        LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~assassin~  RET usable_by_assassin = result END
        LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~bounty_hunter~  RET usable_by_bh = result END
        LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~swashbuckler~  RET usable_by_swashbuckler = result END
            
        LPF SET_ITEM_USABILITY INT_VAR value = usable_by_thief AND usable_by_assassin STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~assassin~   END
        LPF SET_ITEM_USABILITY INT_VAR value = usable_by_thief AND usable_by_bh STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~bounty_hunter~   END
        LPF SET_ITEM_USABILITY INT_VAR value = usable_by_thief AND usable_by_swashbuckler STR_VAR values_table = ~3ed/KitUsabilityValues.tps~  id_string = ~swashbuckler~   END
        
        
        //add all weapons to kitless thief usability to allow making backstab with them
        LPF SET_ITEM_USABILITY INT_VAR value = usable_by_thief OR usable_by_kensai STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~thief~   END*/

        