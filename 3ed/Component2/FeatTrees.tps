
//--------------------------------------feat trees-----------------
//--------------------------------------warfare---------------------

WITH_TRA ~%LANGUAGE%\warfare.tra~ BEGIN
	//1 - power attack (+3dmg, -3 to hit for melee weapons)
	OUTER_SPRINT game_name @001  OUTER_SPRINT game_description @002
	LAF ADD_ACT_FEAT STR_VAR ability_name=~PWRATK~ game_name game_description  END 
	
	//2 - cleave
	COPY ~3ed/Feats/PermanentAbilities/Cleave~  ~override~
	COPY_EXISTING ~CLEAV1FT.SPL~ ~override~
	
	//3 - Great Forititude
	COPY ~3ed/Feats/PermanentAbilities/GreatFortitude/GRTFTDFT.SPL~  ~override~
	
	//4 - Greater Cleave
	COPY ~3ed/Feats/PermanentAbilities/GreaterCleave~  ~override~
	COPY_EXISTING ~CLEAV2FT.SPL~ ~override~
		LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 duration=1 timing=9 STR_VAR resource=~CLEAV1FT~ END  //remove effects of previous cleave
		LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 duration=1 timing=9 STR_VAR resource=~CLEAVE1~ END  //remove effects of previous cleave
		
	//5 - Toughness
	COPY ~3ed/Feats/PermanentAbilities/Toughness/TOUGHSFT.SPL~  ~override~	
	
	//6 - Stunning attack (stun on hit with -6 penalty on save vs death - for 2 rounds once every 2 minutes)
	OUTER_SPRINT game_name @003  OUTER_SPRINT game_description @004
	LAF ADD_LUA_FEAT INT_VAR n_uses=1 copy_icons = 0 STR_VAR ability_name=~EPCSTN~ game_name game_description  END
	
	//change saving throws to -6
	ACTION_IF !(~%GameId%~ STR_EQ ~Bg1~) BEGIN
		OUTER_SET savebonus  = 0 - 6
		COPY_EXISTING ~SPCL906.EFF~ ~override~
		LPF ALTER_EFF INT_VAR savebonus END
		COPY_EXISTING ~SPCL906A.EFF~ ~override~
		LPF ALTER_EFF INT_VAR savebonus END
		COPY_EXISTING ~SPCL906B.EFF~ ~override~
		LPF ALTER_EFF INT_VAR savebonus END
	END
	//7 - Deathblow (slay on hit with -4 penalty on save vs death - for 2 rounds once every hour)
	OUTER_SPRINT game_name @005  OUTER_SPRINT game_description @006
	LAF ADD_LUA_FEAT INT_VAR n_uses=1 copy_icons = 0 STR_VAR ability_name=~EPCSLA~ game_name game_description  END
	//add saving throws, remove level restriction
	ACTION_IF !(~%GameId%~ STR_EQ ~Bg1~) BEGIN
		OUTER_SET savebonus  = 0 - 4
		OUTER_SET savingthrow  = 4 //paralyze/poison/death
		COPY_EXISTING ~SPCL903.EFF~ ~override~
		LPF ALTER_EFF INT_VAR savebonus savingthrow max_level = 0 END
		COPY_EXISTING ~SPCL903A.EFF~ ~override~
		LPF ALTER_EFF INT_VAR savebonus savingthrow max_level = 0 END
	END	
	
	//improved and supreme power attack of berzerker (technically not a part of the tree but  replace the power attack so is also defined here
	OUTER_SPRINT game_name @007  OUTER_SPRINT game_description @008
	LAF ADD_ACT_FEAT STR_VAR ability_name=~PWRATI~ game_name game_description  END //improved power attack (+5 dmg, -3 thaco)
	//add removal of standard power attack
		COPY_EXISTING ~PWRATIFT.SPL~ ~override~
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 duration=1 insert_point=0 STR_VAR resource=~PWRATKBN~ END 
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~PWRATK1~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~PWRATK1~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~PWRATK0~ END
	
	OUTER_SPRINT game_name @009  OUTER_SPRINT game_description @010
	LAF ADD_ACT_FEAT STR_VAR ability_name=~PWRATS~ game_name game_description  END //supreme power attack (+6 dmg, -3 thaco)
	//add removal of standard power attack
		COPY_EXISTING ~PWRATSFT.SPL~ ~override~
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 duration=1 insert_point=0 STR_VAR resource=~PWRATIBN~ END 
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~PWRATI1~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~PWRATI1~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~PWRATI0~ END	
END
//------------------------------------------combat prowess
WITH_TRA ~%LANGUAGE%\combat_prowess.tra~ BEGIN
	//1 - weapon finesse (dex replaces str for thac0 for light weapons)
	LAF ADD_PSR_FEAT INT_VAR min_val=1 max_val=25 step=2 par1=124 par2=122 STR_VAR ability_name=~WPFNS~ END 
	
	//2 - Dodge
	COPY ~3ed/Feats/PermanentAbilities/Dodge/DODGEFT.SPL~  ~override~
	
	//3 - lightning reflexes
	COPY ~3ed/Feats/PermanentAbilities/LightningReflexes/LTNGRXFT.SPL~  ~override~
	
	//4 - flurry strike (+1 attack, -5 to hit with light weapons)
	OUTER_SPRINT game_name @001  OUTER_SPRINT game_description @002
	LAF ADD_ACT_FEAT STR_VAR ability_name=~FLRSTK~ game_name game_description  END 
	
	//5 - elegant strike (dex bonus to damage with light weapons)
	LAF ADD_PSB_FEAT INT_VAR min_val=12 max_val=25 step=2 par1=122 STR_VAR ability_name=~ELTSTK~ END 
		
	//6 - whirlwind (10 apr for 1 round, -4 to hit, -4 dmg - once every 2 minutes)
	OUTER_SPRINT game_name @003  OUTER_SPRINT game_description @004
	LAF ADD_LUA_FEAT INT_VAR n_uses=1 copy_icons = 0 STR_VAR ability_name=~WHIRLN~ game_name game_description  END

	//7 - greater whirlwind - no penalties
	OUTER_SPRINT game_name @005  OUTER_SPRINT game_description @006
	LAF ADD_LUA_FEAT INT_VAR n_uses=1 copy_icons = 0 STR_VAR ability_name=~WHIRLG~ game_name game_description  END
		COPY_EXISTING ~WHIRLGFT.SPL~ ~override~ // remove uses and effects of normal whirlwind
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 duration=1 insert_point=0 STR_VAR resource=~WHIRLN~ END 
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~WHIRLN~ END
END	
//--------------------------------------------tactics
WITH_TRA ~%LANGUAGE%\tactics.tra~ BEGIN
	//1 - insightfull strike (int replaces str for damage for light weapons)
	LAF ADD_PSR_FEAT INT_VAR min_val=2 max_val=25 step=2 par1=124 par2=128 STR_VAR ability_name=~INSTK~ END 
	
	//2- combat expertise (+3AC, -3 to hit)
	OUTER_SPRINT game_name @001  OUTER_SPRINT game_description @002
	LAF ADD_ACT_FEAT STR_VAR ability_name=~CMBEXP~ game_name game_description END 
	
	//3 - Iron Will
	COPY ~3ed/Feats/PermanentAbilities/IronWill/IRONWLFT.SPL~  ~override~
	
	//4 - Study Oponent (-3 AC, thac0 and saves to one enemy, 3 times per day)
	OUTER_SPRINT game_name @003  OUTER_SPRINT game_description @004
	LAF ADD_LUA_FEAT INT_VAR n_uses=3 STR_VAR ability_name=~STUDOP~ game_name game_description  END 
	
	//5 - combat intuition (int bonus to ac with light armor)
	LAF ADD_PSB_FEAT INT_VAR min_val=12 max_val=25 step=2 par1=128 STR_VAR ability_name=~CMBINT~ END 
	
	//6 - critical strike (all hits - critical for 1 round - every 2 minutes)
	OUTER_SPRINT game_name @005  OUTER_SPRINT game_description @006
	LAF ADD_LUA_FEAT INT_VAR n_uses=1 copy_icons = 0 STR_VAR ability_name=~EPCCRT~ game_name game_description  END	
	
	//7 - premonition (+6 ac, +3 saves immunity to normal projectiles, faster movement for 5 rounds once every 5 minutes)
	OUTER_SPRINT game_name @007  OUTER_SPRINT game_description @008
	LAF ADD_LUA_FEAT INT_VAR n_uses=1 copy_icons = 0 STR_VAR ability_name=~EPCEVS~ game_name game_description  END	
END	
//-----------------------------------------------archery
WITH_TRA ~%LANGUAGE%\archery.tra~ BEGIN
	//1 - rapid shot (+1 attack, -2 to hit with ranged weapons, +rapid reload)
	OUTER_SPRINT game_name @001  OUTER_SPRINT game_description @002
	LAF ADD_ACT_FEAT STR_VAR ability_name=~RPDSHT~ game_name game_description  END 
	
	//2 - point blank shot (+1 attack,+1 damage with all ranged weapons)
	LAF ADD_PSL_FEAT STR_VAR ability_name=~PBSHOT~ END 
	
	//3 - improved rapid shot (+1 attack with bows)/darts/throwing daggers	
	LAF ADD_PSL_FEAT STR_VAR ability_name=~RPDSTI~ END 
		COPY_EXISTING ~RPDSTIFT.SPL~ ~override~
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~RPDSHTBN~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~RPDSHT1~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~RPDSHT1~ END
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~RPDSHT0~ END
	
	//4 - deadly aim (+3dmg, -3 to hit for ranged weapons)
	OUTER_SPRINT game_name @003  OUTER_SPRINT game_description @004
	LAF ADD_ACT_FEAT STR_VAR ability_name=~DEDAIM~ game_name game_description  END 
	
	//5 - Ranged Critical (Precise shot)
	COPY ~3ed/Feats/PermanentAbilities/RangedCritical/RNGCRTFT.SPL~  ~override~
	
	//6 - hail of arrows (10 apr for 1 round, -4 to hit, -4 dmg - once every 2 minutes)
	OUTER_SPRINT game_name @005  OUTER_SPRINT game_description @006
	LAF ADD_LUA_FEAT INT_VAR n_uses=1 copy_icons = 0 STR_VAR ability_name=~HAILAN~ game_name game_description  END

	//7 - greater hail of arrows - no penalties
	OUTER_SPRINT game_name @005  OUTER_SPRINT game_description @006
	LAF ADD_LUA_FEAT INT_VAR n_uses=1 copy_icons = 0 STR_VAR ability_name=~HAILAG~ game_name game_description  END
		COPY_EXISTING ~HAILAGFT.SPL~ ~override~ // remove uses and effects of normal hail of arrows
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=321 target=2 duration=1 insert_point=0 STR_VAR resource=~HAILAN~ END 
		LPF ADD_SPELL_EFFECT INT_VAR insert_point=0 opcode=172 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource=~HAILAN~ END
 END   	
//--------------------------------------------Protection from Magic
	//1 - 7  5% protection/star
	OUTER_FOR (i=1;i<=7;i=i+1) BEGIN
		COPY ~3ed/Feats/PermanentAbilities/MagicProtection/MGPTN.SPL~  ~override/MGPTN%i%FT.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR  parameter1=5*i END //resistance bonus 5*i% level
            FOR (j=1;j<i;j=j+1) BEGIN
                SPRINT resource EVALUATE_BUFFER ~MGPTN%j%FT~
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 2 duration =1 insert_point = 0 STR_VAR resource END
            END

	END


//----------------------------------------------Empower magic
	//1 - 7 (4 + 2*i) dmg bonus from spells  (6 14 24 36 50 66 84)%
    OUTER_SET res = 0
	OUTER_FOR (i=1;i<=7;i=i+1) BEGIN
        OUTER_SET res = res + (4 + 2*i)
		COPY ~3ed/Feats/PermanentAbilities/EmpowerMagic/EMPWR.SPL~  ~override/EMPWR%i%FT.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR  parameter1=res END //spell damage bonus
            FOR (j=1;j<i;j=j+1) BEGIN
                SPRINT resource EVALUATE_BUFFER ~EMPWR%j%FT~
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 2 duration =1 insert_point = 0 STR_VAR resource END
            END
             
        
	END

//------------------------------------------------------------------Extend magic
	// 1- 7  (11 24 39 56 75 96 119)
	OUTER_FOR (i=1;i<=7;i=i+1) BEGIN
		COPY ~3ed/Feats/PermanentAbilities/ExtendMagic/EXTND.SPL~  ~override/EXTND%i%FT.SPL~
		LPF ALTER_SPELL_EFFECT INT_VAR  parameter1=100+i*(10+i) END //spell duration
		SPRINT resource EVALUATE_BUFFER ~EXTND%i%FT~
		LPF ADD_SPELL_EFFECT INT_VAR opcode=206 target=2 parameter1=0 duration=1 timing=9 STR_VAR resource END
		FOR (j=1;j<i;j=j+1) BEGIN
			SPRINT resource EVALUATE_BUFFER ~EXTND%j%FT~
			LPF ADD_SPELL_EFFECT INT_VAR opcode=321 target=2 duration=1 timing=9 insert_point = 0 STR_VAR resource END  //remove effects of previous extend
		END
	END

//------------------------------------------------------------------quicken magic 
	//1- 5  -1 caster speed  per star
	OUTER_FOR (i=1;i<=5;i=i+1) BEGIN
		COPY ~3ed/Feats/PermanentAbilities/QuickenMagic/QUICKEN.SPL~  ~override/QUICK%i%FT.SPL~
            LPF ALTER_SPELL_EFFECT INT_VAR  parameter1=i END
            FOR (j=1;j<i;j=j+1) BEGIN
                SPRINT resource EVALUATE_BUFFER ~QUICK%i%FT~
                LPF ADD_SPELL_EFFECT INT_VAR opcode = 321 target = 2 duration =1 insert_point = 0  STR_VAR resource END
            END

	END
	
	//6 - 7 uses of improved alacrity 
	ACTION_IF !(~%GameId%~ STR_EQ ~Bg1~) BEGIN
		WITH_TRA ~%LANGUAGE%\quicken.tra~ BEGIN
			COPY_EXISTING ~SPWI921.SPL~  ~override/QUICKALA.SPL~ //make alacrity into innate ability (and change description)
				LPF CHANGE_SPELL_PROPERTIES INT_VAR spell_type=4 END	
				READ_LONG 0x0050 ~descr_strref~
				STRING_SET_EVALUATE %descr_strref% @001
		END
	END
	

	OUTER_FOR (i=6;i<=7;i=i+1) BEGIN
		COPY ~3ed/Feats/LimitedUseAbilities/Template/LUAFT.SPL~  ~override/QUICK%i%FT.SPL~			
			LPF ADD_SPELL_EFFECT INT_VAR opcode=171 target=2 timing=9 duration=1 STR_VAR resource = ~QUICKALA~ END
	END

//-------------------------------------------------------bonus priest spells
	OUTER_FOR (i=1;i<=7;i=i+1) BEGIN
		COPY ~3ed/Feats/PermanentAbilities/BonusPriestSpells/PRSLT%i%FT.SPL~  ~override~
	END
	
//-------------------------------------------------------bonus wizard spells
	OUTER_FOR (i=1;i<=7;i=i+1) BEGIN
		COPY ~3ed/Feats/PermanentAbilities/BonusWizardSpells/WZSLT%i%FT.SPL~  ~override~
	END

//------------------------------------------------------------armored caster
	//1 - 5 allows to cast in armors
	OUTER_FOR (i=1;i<=5;i=i+1) BEGIN
		COPY ~3ed/Feats/PermanentAbilities/ArmoredCaster/ARCST%i%FT.SPL~  ~override~
	END
	