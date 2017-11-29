	INCLUDE ~3ed/DIMINISH_SPELL_CASTING.tph~
	
	//ftr/cleric spells
	LAF DIMINISH_SPELL_CASTING STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFC.SPL~ 
		 caption=~F_CSPL~ 2DAfile=~3ed/SpellProgression/F_CSPELLS.2DA~ END
    //cleric/thief
	LAF DIMINISH_SPELL_CASTING STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRECT.SPL~ 
		 caption=~C_TSPL~ 2DAfile=~3ed/SpellProgression/F_CSPELLS.2DA~ END	
	//ranger/cleric spells
	LAF DIMINISH_SPELL_CASTING STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRERC.SPL~ 
		 caption=~R_CSPL~ 2DAfile=~3ed/SpellProgression/F_CSPELLS.2DA~ END		 
	//fighter/druid spells
	LAF DIMINISH_SPELL_CASTING STR_VAR clab=~CLABDR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFD.SPL~ 
		 caption=~F_DSPL~ 2DAfile=~3ed/SpellProgression/F_CSPELLS.2DA~ END
		 
	//ftr/mage spells
	LAF DIMINISH_SPELL_CASTING INT_VAR is_wizard=1 levels_to_remove=0b110000000  STR_VAR clab=~CLABMA+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREFM.SPL~ 
		 caption=~F_MSPL~ 2DAfile=~3ed/SpellProgression/F_MSPELLS.2DA~ END
	//mage/thief spells 
	LAF DIMINISH_SPELL_CASTING INT_VAR is_wizard=1  STR_VAR clab=~CLABMA+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCREMT.SPL~ 
		 caption=~M_TSPL~ 2DAfile=~3ed/SpellProgression/M_TSPELLS.2DA~ END	
         
    //fighter/mage/thief spells
	LAF DIMINISH_SPELL_CASTING INT_VAR is_wizard=1 levels_to_remove=0b110000000  STR_VAR clab=~CLABMA+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRFMT.SPL~ 
		 caption=~FMTSPL~ 2DAfile=~3ed/SpellProgression/FMTSPELLS.2DA~ END		
         
	//cleric/mage spells
	LAF DIMINISH_SPELL_CASTING STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRECM.SPL~ 
		 caption=~CMCSPL~ 2DAfile=~3ed/SpellProgression/CMCSPELLS.2DA~ END
		 
	LAF DIMINISH_SPELL_CASTING INT_VAR is_wizard=1 STR_VAR clab=~CLABMA+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRECM.SPL~ 
		caption=~CMMSPL~ 2DAfile=~3ed/SpellProgression/CMMSPELLS.2DA~ END
		

    //fighter/cleric/mage spells
	LAF DIMINISH_SPELL_CASTING INT_VAR levels_to_remove=0b1100000 STR_VAR clab=~CLABPR01\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRFMC.SPL~ 
		 caption=~FCMCSPL~ 2DAfile=~3ed/SpellProgression/FMCCSPELLS.2DA~ END
		 
	LAF DIMINISH_SPELL_CASTING INT_VAR is_wizard=1 levels_to_remove=0b110000000 STR_VAR clab=~CLABMA+.*\.2DA~ mask_file=~3ed/Feats/FeatAttribution/SFTCRFMC.SPL~ 
		caption=~FCMMSPL~ 2DAfile=~3ed/SpellProgression/FMCMSPELLS.2DA~ END