
////////////
//magic fang
////////////

OUTER_SET CycleLocation = 2+256*256*30 //location and speed of color blinking


//copying icons 
COPY ~3ed/MagicFang/rgmfangb.bam~ ~override~
COPY ~3ed/MagicFang/rgmfangc.bam~ ~override~

SET maxlvl=20

OUTER_FOR (i=1;i<=maxlvl;i+=1) BEGIN
	COPY ~3ed/MagicFang/MFANG.eff~ ~override/MFANG%i%.eff~ 
		WRITE_EVALUATED_ASCII 0x30 ~MFANG%i%~ #8   WRITE_LONG 0x001c i   //copying eff and change caster level
	COPY ~3ed/MagicFang/MFANGBN.spl~ ~override/MFANG%i%.spl~ 
		LPF ALTER_SPELL_EFFECT  INT_VAR  duration = 60*i  END  //copying spl and updating duration
END

COPY ~3ed/MagicFang/MFANG.spl~ ~override~ 
SET Color = 256*99+219*256*256+55*256*256*256 
FOR (i=1;i<=maxlvl;i+=1) BEGIN
	LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=2 target=1 target_count=0 range=1 required_level=i speed=6 projectile=1  STR_VAR icon=~RGMFANGB~ END
	LPF ADD_SPELL_EFFECT  INT_VAR  header = i power=1 opcode=345 target = 2 resist_dispel = 1 power=1 parameter1=1 duration = 60*i  END   // updating enchantment bonus and duration
	LPF ADD_SPELL_EFFECT  INT_VAR  header = i power=1 opcode=278 target = 2 resist_dispel = 1 power=1 parameter1=1 duration = 60*i  END   // updating THAC0 bonus  and duration
	LPF ADD_SPELL_EFFECT  INT_VAR  header = i power=1 opcode=73  target = 2 resist_dispel = 1 power=1 parameter1=1 duration = 60*i  END   // updating damage bonus and duration	
	LPF ADD_SPELL_EFFECT  INT_VAR  header = i power=1 opcode=9   target = 2 resist_dispel = 1 power=1 duration = 60*i  parameter1 = Color   parameter2 = CycleLocation END   // updating color pulse duration 		
END
LPF ADD_SPELL_EFFECT  INT_VAR  opcode=321 target=2 power=1 resist_dispel = 1 insert_point=0 STR_VAR resource = ~NATAV~ END
LPF ADD_SPELL_EFFECT  INT_VAR  opcode=321 target=2 power=1 resist_dispel = 1 insert_point=0 STR_VAR resource = ~MFANG~ END
LPF ADD_SPELL_EFFECT  INT_VAR  opcode=321 target=2 power=1 resist_dispel = 1 insert_point=0 STR_VAR resource = ~GMFANG~ END
LPF ADD_SPELL_EFFECT  INT_VAR  opcode=318 target=2 power=1 resist_dispel = 1 insert_point=0 parameter2 = 8 STR_VAR resource = ~MFANG~ END//protection from spell for non-animals

//properly adding magic fang spell to spells.ids
ADD_SPELL "override/MFANG.spl" 1  1 DRUID_MAGIC_FANG 
  SAY NAME1 @001
  SAY UNIDENTIFIED_DESC @002
  
  
//copying icons 
COPY ~3ed/MagicFang/rgmfnggb.bam~ ~override~
COPY ~3ed/MagicFang/rgmfnggc.bam~ ~override~
///////////////////////////////////////
////////////
//greater magic fang
////////////
COPY ~3ed/MagicFang/GMFANG.spl~ ~override~ 
SET Color = 256*57+126*256*256+230*256*256*256 

FOR (i=1;i<=maxlvl;i+=1) BEGIN
	LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=2 target=1 target_count=0 range=1 required_level=i speed=6 projectile=1  STR_VAR icon=~RGMFANGB~ END
	LPF ADD_SPELL_EFFECT  INT_VAR  header = i power=3 opcode=345 target = 2 resist_dispel = 1 power=1 parameter1=1+i/5 duration = 60*i  END   // updating enchantment bonus and duration
	LPF ADD_SPELL_EFFECT  INT_VAR  header = i power=3 opcode=278 target = 2 esist_dispel = 1 power=1 parameter1=1+i/5 duration = 60*i  END   // updating THAC0 bonus  and duration
	LPF ADD_SPELL_EFFECT  INT_VAR  header = i power=3 opcode=73  target = 2 resist_dispel = 1 power=1 parameter1=1+i/5 duration = 60*i  END   // updating damage bonus and duration	
	LPF ADD_SPELL_EFFECT  INT_VAR  header = i power=3 opcode=9   target = 2 resist_dispel = 1 power=1 duration = 60*i  parameter1 = Color   parameter2 = CycleLocation END   // updating color pulse duration 		
END
LPF ADD_SPELL_EFFECT  INT_VAR  opcode=321 target=2 power=3 resist_dispel = 1 insert_point=0 STR_VAR resource = ~NATAV~ END
LPF ADD_SPELL_EFFECT  INT_VAR  opcode=321 target=2 power=3 resist_dispel = 1 insert_point=0 STR_VAR resource = ~MFANG~ END
LPF ADD_SPELL_EFFECT  INT_VAR  opcode=321 target=2 power=3 resist_dispel = 1 insert_point=0 STR_VAR resource = ~GMFANG~ END
LPF ADD_SPELL_EFFECT  INT_VAR  opcode=318 target=2 power=3 resist_dispel = 1 insert_point=0 parameter2 = 8 STR_VAR resource = ~GMFANG~ END //protection from spell for non-animals



//properly adding greater magic fang spell to spells.ids
ADD_SPELL "override/GMFANG.spl" 1  3 DRUID_GMAGIC_FANG 
  SAY NAME1 @003
  SAY UNIDENTIFIED_DESC @004
  
////////////  
//nature's avatar HLA
 ////////////

//copying icons 
COPY ~3ed/MagicFang/rgnatavb.bam~ ~override~
COPY ~3ed/MagicFang/rgnatavc.bam~ ~override~

COPY ~3ed/MagicFang/GMFANG.spl~ ~override/NATAV.SPL~ 
SET Color = 256*222+164*256*256+55*256*256*256 
	WRITE_LONG 0x0034 7 //spell level
	WRITE_ASCII 0x003a  ~rgnatavc~ #8

	
	LPF ADD_SPELL_HEADER  INT_VAR  type=1 location=2 target=1 target_count=0 range=1 required_level=1 speed=6 projectile=1  STR_VAR icon=~RGNATAVB~ END
	LPF ADD_SPELL_EFFECT  INT_VAR  power=7 opcode=345 target = 2 resist_dispel = 1 power=1 parameter1=5 duration = 60*20  END   // updating enchantment bonus and duration
	LPF ADD_SPELL_EFFECT  INT_VAR  power=7 opcode=278 target = 2 esist_dispel = 1 power=1 parameter1=10 duration = 60*20  END   // updating THAC0 bonus  and duration
	LPF ADD_SPELL_EFFECT  INT_VAR  power=7 opcode=73  target = 2 resist_dispel = 1 power=1 parameter1=10 duration = 60*20  END   // updating damage bonus and duration	
	LPF ADD_SPELL_EFFECT  INT_VAR  power=7 opcode=9   target = 2 resist_dispel = 1 power=1 duration = 60*20  parameter1 = Color   parameter2 = CycleLocation END   // updating color pulse duration 	
	LPF ADD_SPELL_EFFECT INT_VAR opcode=18 power=7  target=2 parameter1=4*20 parameter2=0 timing=0 resist_dispel=1 duration=60*20 END //hp	bonus
	LPF ADD_SPELL_EFFECT INT_VAR opcode=1 power=7  target=2 parameter1=1  resist_dispel=1 duration=60*20 END //+1 apr
	
	LPF ADD_SPELL_EFFECT  INT_VAR  opcode=321 target=2 power=7 resist_dispel = 1 insert_point=0 STR_VAR resource = ~NATAV~ END
	LPF ADD_SPELL_EFFECT  INT_VAR  opcode=321 target=2 power=7 resist_dispel = 1 insert_point=0 STR_VAR resource = ~MFANG~ END
	LPF ADD_SPELL_EFFECT  INT_VAR  opcode=321 target=2 power=7 resist_dispel = 1 insert_point=0 STR_VAR resource = ~GMFANG~ END
	LPF ADD_SPELL_EFFECT  INT_VAR  opcode=318 target=2 power=7 resist_dispel = 1 insert_point=0 parameter2 = 8 STR_VAR resource = ~NATAV~ END//protection from spell for non-animals

	SAY NAME1 @005
	SAY UNIDENTIFIED_DESC @006
	
/*COPY_EXISTING ~DRD_EPC.SPL~ ~override~ //give nature's avatar as level 24 epic druid spell
	LPF ADD_SPELL_HEADER  INT_VAR  copy_header = 5 END
	LPF ALTER_SPELL_HEADER  INT_VAR  header = 6 min_level = 24 END
	LPF ALTER_SPELL_EFFECT INT_VAR header = 6 STR_VAR resource = ~NATAV~ END*/
	
