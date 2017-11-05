
//to make robes sellable
	COPY_EXISTING_REGEXP ~.+\.sto~ ~override~
		READ_LONG 0x002c "purchased_offset"
		READ_LONG 0x0030 "purchased_count"
		SET insert_robes=0
		FOR (i=0;i<purchased_count;i=i+1) BEGIN
			READ_LONG (purchased_offset + i*4)  "category"
			PATCH_IF (category=ArmorCategory OR ScrollsCategory) BEGIN //scrolls or armors
				SET insert_robes=1
			END
		END
		PATCH_IF (insert_robes) BEGIN
			WRITE_LONG 0x0030 (purchased_count+1)
			INSERT_BYTES (purchased_offset + purchased_count*4) 4	
			WRITE_LONG (purchased_offset + purchased_count*4) 0x0043
		END
	BUT_ONLY