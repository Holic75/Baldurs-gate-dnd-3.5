

OUTER_SPRINT POINT_BUY_CORE_FIND ~chargen.ability = {~
OUTER_SPRINT POINT_BUY_CORE_REPLACE  ~~~~~chargen.CurrentPointCost = {
	1, --1
	1, --2
	1, --3
	1, --4
	1, --5
	1, --6
	1, --7
	1, --8
	1, --9
	1, --10
	1, --11
	1, --12
	1, --13
	1, --14
	2, --15
	2, --16
	3, --17
	3, --18
	4, --19
	4, --20
	5, --21
	5 --22
}

chargen.AbilityModifiers = {
	0,
	0,
	0,
	0,
	0,
	0
}

chargen.BaseAbilityValue=10
chargen.ExtraAbilitiesMod=0
chargen.StoreExtraAbilitiesMod=0

function GetAbilityValue(i)

	local sep
	sep=string.find(chargen.ability[i].roll,"/")
	if (sep==nil) then
		return tonumber(chargen.ability[i].roll)
	else
		return 18
	end

end


function RollPointBuy(total_roll)

	chargen.ExtraAbilitiesMod=0 --initialize modifier for ExtraAbilities
	while chargen.totalRoll ~= total_roll do
		createCharScreen:OnAbilityReRollButtonClick()
	end

	-- Reduce all Ability scores to minimum
	local oldPoints
	for i = 1,6 do
		oldPoints = chargen.extraAbilityPoints + 1
		while oldPoints ~= chargen.extraAbilityPoints do
			oldPoints = chargen.extraAbilityPoints
			createCharScreen:OnAbilityPlusMinusButtonClick(i,false)
		end
	end

	--Determine Maximum Ability Values

	for i = 1,6 do
		oldPoints = chargen.extraAbilityPoints + 1
		while (oldPoints ~= chargen.extraAbilityPoints) do
				oldPoints = chargen.extraAbilityPoints
				createCharScreen:OnAbilityPlusMinusButtonClick(i,true)
		end
		chargen.AbilityModifiers[i]=GetAbilityValue(i)-18
		oldPoints = chargen.extraAbilityPoints + 1
		while (oldPoints ~= chargen.extraAbilityPoints) do
				oldPoints = chargen.extraAbilityPoints
				createCharScreen:OnAbilityPlusMinusButtonClick(i,false)
		end
	end


	-- Put abilities to base value
	for i = 1,6 do
		while (GetAbilityValue(i)<chargen.BaseAbilityValue+chargen.AbilityModifiers[i]) do
			createCharScreen:OnAbilityPlusMinusButtonClick(i,true)
		end
	end
end

function TryToIncreaseAbility(i)
    local old_roll
	local new_roll

	old_roll=GetAbilityValue(i)
	createCharScreen:OnAbilityPlusMinusButtonClick(i, true)
	new_roll=GetAbilityValue(i)
	if (old_roll~=new_roll)	then
		new_roll=new_roll-chargen.AbilityModifiers[i]
		if (chargen.CurrentPointCost[new_roll]>chargen.extraAbilityPoints-chargen.ExtraAbilitiesMod+1) then
			createCharScreen:OnAbilityPlusMinusButtonClick(i, false) -- put it back to previous value
		else
			chargen.ExtraAbilitiesMod=chargen.ExtraAbilitiesMod-1+chargen.CurrentPointCost[new_roll]
		end
	end
end

function TryToDecreaseAbility(i)
    local old_roll
	local new_roll

	old_roll=GetAbilityValue(i)
	createCharScreen:OnAbilityPlusMinusButtonClick(i, false)
	new_roll=GetAbilityValue(i)
	if (old_roll~=new_roll)	then
		old_roll=old_roll-chargen.AbilityModifiers[i]
		chargen.ExtraAbilitiesMod=chargen.ExtraAbilitiesMod+1-chargen.CurrentPointCost[old_roll]
	end
end


function TryToModifyAbility(i, plus)
    if (plus) then
        TryToIncreaseAbility(i)
    else
        TryToDecreaseAbility(i)
    end
end

chargen.ability = {~~~~~



OUTER_SPRINT ON_OPEN_FIND ~onopen "ticksPassed = 0; ticksStarting = 0"~
OUTER_SPRINT ON_OPEN_REPLACE ~onopen "ticksPassed = 0; ticksStarting = 0; RollPointBuy(80);"~

ACTION_IF (~%GameId%~ STR_EQ ~Iwd~) BEGIN
    OUTER_SPRINT ON_OPEN_FIND ~currentChargenAbility = 0~
    OUTER_SPRINT ON_OPEN_REPLACE ~currentChargenAbility = 0
            RollPointBuy(80)~
END

OUTER_SPRINT ABIL_INC_FIND ~createCharScreen:OnAbilityPlusMinusButtonClick(currentChargenAbility, true)~
OUTER_SPRINT ABIL_INC_REPLACE ~TryToIncreaseAbility(currentChargenAbility)~

OUTER_SPRINT ABIL_MOD_FIND ~createCharScreen:OnAbilityPlusMinusButtonClick(ability, plus)~
OUTER_SPRINT ABIL_MOD_REPLACE ~TryToModifyAbility(ability, plus)~

OUTER_SPRINT ABIL_DEC_FIND ~createCharScreen:OnAbilityPlusMinusButtonClick(currentChargenAbility, false)~
OUTER_SPRINT ABIL_DEC_REPLACE ~TryToDecreaseAbility(currentChargenAbility)~

OUTER_SPRINT TEXT_ABIL_FIND ~text lua "chargen.extraAbilityPoints"~
OUTER_SPRINT TEXT_ABIL_REPLACE ~text lua "chargen.extraAbilityPoints - chargen.ExtraAbilitiesMod"~

OUTER_SPRINT REROLL_FIND ~action "createCharScreen:OnAbilityReRollButtonClick()"~
OUTER_SPRINT REROLL_REPLACE ~clickable lua "false"
		action " chargen.ExtraAbilitiesMod = 0; RollPointBuy(80);"~
        
OUTER_SPRINT STORE_FIND ~action "createCharScreen:OnAbilityStoreButtonClick()"~
OUTER_SPRINT STORE_REPLACE ~action "chargen.StoreExtraAbilitiesMod=chargen.ExtraAbilitiesMod
					  createCharScreen:OnAbilityStoreButtonClick()"~

OUTER_SPRINT RECALL_FIND ~action "createCharScreen:OnAbilityRecallButtonClick()"~
OUTER_SPRINT RECALL_REPLACE ~action "chargen.ExtraAbilitiesMod=chargen.StoreExtraAbilitiesMod
					createCharScreen:OnAbilityRecallButtonClick()"~



COPY_EXISTING ~UI.menu~ ~override~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%ON_OPEN_FIND%~ ~%ON_OPEN_REPLACE%~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%ABIL_INC_FIND%~ ~%ABIL_INC_REPLACE%~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%ABIL_DEC_FIND%~ ~%ABIL_DEC_REPLACE%~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%ABIL_MOD_FIND%~ ~%ABIL_MOD_REPLACE%~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%TEXT_ABIL_FIND%~ ~%TEXT_ABIL_REPLACE%~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%REROLL_FIND%~ ~%REROLL_REPLACE%~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%STORE_FIND%~ ~%STORE_REPLACE%~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%RECALL_FIND%~ ~%RECALL_REPLACE%~
    REPLACE_TEXTUALLY 	CASE_SENSITIVE EXACT_MATCH ~%POINT_BUY_CORE_FIND%~ ~%POINT_BUY_CORE_REPLACE%~
    