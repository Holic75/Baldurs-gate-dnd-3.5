

COPY_EXISTING_REGEXP GLOB ~.+\.itm~ ~override~

    	LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~fighter_cleric~  RET usable_by_fighter_cleric = result END
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~mage_thief~  RET usable_by_mage_thief = result END
		LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~cleric_ranger~  RET usable_by_cleric_ranger = result END
        LPF GET_ITEM_USABILITY STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~cleric_mage~  RET usable_by_cleric_mage = result END
        
        SET usable_by_fmc = usable_by_cleric_mage OR (usable_by_cleric_ranger AND usable_by_fighter_cleric)
        
        LPF SET_ITEM_USABILITY INT_VAR value = usable_by_fmc STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~fighter_mage_cleric~   END
		LPF SET_ITEM_USABILITY INT_VAR value = usable_by_mage_thief STR_VAR values_table = ~3ed/ClassUsabilityValues.tps~  id_string = ~fighter_mage_thief~   END