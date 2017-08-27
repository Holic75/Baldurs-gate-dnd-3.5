


















# Baldurs-gate-dnd-3.5
This is a WeiDu mod for BG:Enchanced edition that changes 2ed ADnD rules to DnD 3.5 with some elements taken from Pathfinder.

It changes game mechanics (i.e classes, spells, abilities, etc...) to that of 3.5 edition (to the extent that game engine allows).
# Installation

Put all files to Game folder (the one which contains Baldur.exe) and run Setup-3ed.exe, choose to install ALL components.

in C:\Users\\<UserName>\Documents\Baldur's Gate - Enhanced Edition folder find file Baldur.lua and add the string 
```
SetPrivateProfileString('Game Options','3E Thief Sneak Attack','1')
```
if it is not already there (it replaces backstab with 3ed Sneak Attack).

This mod was only tested with clean BG:ENCHANCED EDITION 2.3 install and is not genrally compatible with any other mods.

# Rule Changes
## 1. Abilities

Roll based Abilities generation was replaced with point-buy system (characters start with 10 points in every ability and can distribute 20 more points among them, increasing ability till 14 costs one point, from 14 to 16 - 2 points and finally from 16 to 18  - 3 points).

The effects of abilities were also changed as follows:

##### STRENGTH: 
– Determines to hit bonus with melee weapons and throwing axes (+1 per 2 points above 9, -1 per 2 points below 8).
– Determines damage bonus with melee weapons and throwing axes and slings (+1 per 2 points above 10, -1 per 2 points below 9).
– Determines chance to force open the lock.
– Determines Weight Allowance.
STR | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---|--- | --- | --- | --- |--- |--- |--- |--- |--- |---|--- | --- | --- | --- |--- |--- |
Weight Allowance| 1 | 3 | 5 | 15 | 15 | 30 | 30 | 50 | 50 | 70 |100 | 120 | 160 | 200 | 250 | 300 | 350 | 400 | 500 | 600 | 700 | 800 | 1000 | 1200 | 1600 |
Bash| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |13 | 16 | 20 | 25 | 30 | 35 | 40 | 45 | 50 | 55 | 60 | 65 | 70 | 75 | 80 |
Note: two-handed weapons receive 1.5 damage bonus from STRENGTH.

##### DEXTERITY:
– Determines to hit bonus with ranged weapons (+1 per 2 points above 9, -1 per 2 points below 8).
– Determines AC bonus (+1 per 2 points above 10, -1 per 2 points below 9).
– Gives combat bonuses with certain feats, weapons and armors.
– Determines bonus to all base thieving skill values, except detect illusions (+2.5% per point above 10, -2.5% per point below 8).
– Improves Saving Throws vs. Rod/Staff/Wand and vs. Breath Weapon (+1 per 2 points above 9, -1 per 2 points below 10).
Note: wearing heavy armor may restrict maximum dexterity bonus to AC a character can have.

##### CONSTITUTION:
– Determines bonus HP that characters receives per level (+1 per 2 points above 10).
– For values greater than 19 gives slow HP regenearion over time.
– Improves Saving Throws vs. Paralysis/Poison/Death and vs. Petrification/Polymorph (+1 per 2 points above 9, -1 per 2 points below 10).

##### INTELLIGENCE
– Determines the maximum level of spell that can be cast by Bards and Mages.
– Determines number of spells per level that can be learned by Bards and Mages.
– Determines chance to learn a spell by Bards and Mages.
– Determines bonus to Lore (+3 per point above 10, -3 per point below 8).
– Gives combat bonuses with certain feats, weapons and armors.
– Increases all thieving skills (+5% of base value for every point above 10, i.e. if the base value of your skill is 50 and you have 18 INT the effective base value will become 50*(100%+8 x 5%) = 50 x 140% = 70).
– Increases number of spells per day that can be cast by Mages.
INT\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
12-13 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
14-15 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
16-17 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 
18-19 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 
20-21 | 2 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 
22-23 | 2 | 2 | 1 | 1 | 1 | 1 | 0 | 0 | 0 
24-25 | 2 | 2 | 2 | 1 | 1 | 1 | 1 | 0 | 0 
– Increases Saving Throw penalties for Wizard spells (i.e. effective Saving Throws of spell targets are reduced by 1 per 2 points above 10).
Note: A character with an Intelligence score of 8 or less is illiterate and cannot use scrolls or most wands regardless of her class.

##### WISDOM
– Increases AC bonus of Monk and Kensai (+1 per 2 points above 10).
– Increases number of spells per day that can be cast by Clerics, Paladins, Druids and Rangers.	
WIS\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
12-13 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
14-15 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
16-17 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 
18-19 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 
20-21 | 2 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 
22-23 | 2 | 2 | 1 | 1 | 1 | 1 | 0 | 0 | 0 
24-25 | 2 | 2 | 2 | 1 | 1 | 1 | 1 | 0 | 0 
– Improves Saving Throws vs. Spells (+1 per 2 points above 9, -1 per 2 points below 10).
– Increases Saving Throw penalties for Cleric, Druid, Paladin and Ranger spells (i.e. effective Saving Throws of spell targets are reduced by 1 per 2 points above 10).

##### CHARISMA
– Increases number of Channel Energy uses per day for Paladins and Clerics (+1 per 2 points above 10).
– Improves all Paladin and Jester savingthrows (+1 per 2 points above 9 and -1 per 2 points below 10).
– Increases number of Lay On Hands uses per day for Paladin or Absorb Health uses per day for Blackguards (+1 per 2 points above 12).
– Increases number of spells per day that can be cast by Bards, Sorcereres and Shamans.
CHA\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
12-13 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
14-15 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
16-17 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 
18-19 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 
20-21 | 2 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 
22-23 | 2 | 2 | 1 | 1 | 1 | 1 | 0 | 0 | 0 
24-25 | 2 | 2 | 2 | 1 | 1 | 1 | 1 | 0 | 0 
– Influences reaction of people on your character and prices in stores.
– Increases Saving Throw penalties for Bard, Sorcerer and Shaman spells (i.e. effective Saving Throws of spell targets are reduced by 1 per 2 points above 10).

## 2. Feats
The profciency system that was in the original was replaced with a feat system.
The changes are the follows.

#### Weapon Category feats
Due to limited number of proficiencies game engine supports it was necessary to group weapons in categories to free slots for other feats.

###### Straight Swords
This weapon category includes Bastard Swords, Two-handed swords and Long Swords.
###### Blades
This weapon category includes Daggers and Short swords.
###### Axes
This weapon category includes Battle Axes and Throwing Axes.
###### Curved Swords
This weapon category includes Scimitars, Katanas, Wakizashi and Ninja-to.
###### Blunt Weapons
This weapon category includes Maces, Clubs, Warhammers, and the Staff.
###### Spiked Weapons
This weapon category includes Morning Stars and Flails.
###### Polearm
This weapon category includes Spears and Halberds.
###### Crossbows
This weapon category includes Light and Heavy Crossbows.
###### Bows
This weapon category includes Shortbows and Longbows.
###### Missile Weapons
This weapon category includes Darts, Throwing Daggers and Sling.

The proficiency level in each weapon category gives the following bonuses:

Weapon Focus (1 star) - The character receives +1 to hit bonus with specified weapon category.
Weapon Specialziation (2 stars) - The character receives +2 bonus to damage with specified weapon category.
Greater Weapon Focus (3 stars) - The character receives another +1 to hit bonus with specified weapon category. 
Greater Weapon Specialization (4 stars) - The character receives another +2 bonus to damage with specified weapon category.
Weapon Mastery (5 stars) - The character reveives another +1 to hit and +2 damage bonus as well as 1/2 attack per round with specified weapon category.

#### Weapon Style feats
###### Two-Handed Combat
Style Focus (1 star) - The wielder gets a +1 bonus to damage rolls, and -1 bonus to Speed Factor.
Style Specialziation (2 stars) - The wielder gets a further +1 bonus to damge rolls (to a total of +2) and -1 bonus to Speed Factor to a total of (-2).
Greater Style Focus (3 stars) - The wielder gets a further +1 bonus to damge rolls (to a total of +3) and -1 bonus to Speed Factor to a total of (-3).
Greater Style Specialization (4 stars) - The wielder gets a further +1 bonus to damge rolls (to a total of +4) and -1 bonus to Speed Factor to a total of (-4).
Style Mastery (5 stars)  - The wielder gets a further +1 bonus to damge rolls (to a total of +5) and -1 bonus to Speed Factor to a total of (-5).

###### Sword and Shield Combat
Style Focus (1 star) - The wielder gets a -1 bonus to AC.
Style Specialziation (2 stars) - The wielder gets anoter -1 bonus to AC (to a total of -2).
Greater Style Focus (3 stars) - The wielder gets anoter -1 bonus to AC (to a total of -3).
Greater Style Specialization (4 stars) - The wielder gets anoter -1 bonus to AC (to a total of -4).
Style Mastery (5 stars)  - The wielder gets anoter -1 bonus to AC (to a total of -5).

###### Single Weapon Combat
Style Focus (1 star) - The wielder gets a -1 bonus to AC and inflicts critical damage on an attack roll of 18, 19 or 20.
Style Specialziation (2 stars) - The wielder gets a -2 bonus to AC and inflicts critical damage on an attack roll of 16, 17, 18, 19 or 20.
Greater Style Focus (3 stars) - The wielder gets a -2 bonus to AC and inflicts critical damage on an attack roll of 15, 16, 17, 18, 19 or 20.
Greater Style Specialization (4 stars) - The wielder gets a -2 bonus to AC and inflicts critical damage on an attack roll of 14, 15, 16, 17, 18, 19 or 20.
Style Mastery (5 stars)  - The wielder gets a -3 bonus to AC and inflicts critical damage on an attack roll of 13, 14, 15, 16, 17, 18, 19 or 20.

###### Two-Weapon Combat
Style Focus (1 star) - The wielder's penalties are reduced to -2 with the main weapon and -2 with the off-hand weapon.
Style Specialziation (2 stars) - The wielder's penalties are reduced to 0 with the main weapon and -2 with the off-hand weapon.
Greater Style Focus (3 stars) - The wielder's penalties are reduced to 0 with the main weapon and 0 with the off-hand weapon.
Greater Style Specialization (4 stars) - The wielder additionally gets +1 bonus to AC.
Style Mastery (5 stars)  - The wielder additionally gets another +1 bonus to AC (to a total of +2).

###### Archery
Style Focus (1 star) - The character receives Rapid Shot modal ability. While activated the character can make one additional APR with ranged weapons, but all attacks are done with -2 penalty to hit.
Style Specialziation (2 stars) - The character receives +1 to hit and +1 damage bonus with ranged weapons.
Greater Style Focus (3 stars) - Rapid Shot mode becomes permanently activated if character equips bow and she no longer suffers -2 penalty to hit.
Greater Style Specialization (4 stars) - The character receives Deadly Aim modal ability. While activated all attacks with ranged weapons are done with +3 bonus to damage but suffer -3 penalty to hit.
Style Mastery (5 stars)  - The character inflicts critical damage on an attack roll of 17, 18, 19 or 20 with ranged weapons.
Note: This Feat does not effect Throwing Axes

#### Other Feats
###### Combat Prowess
Weapon Finesse (1 star) - With unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves and spears the character may use Dexterity value instead of Strength to determine bonus to THAC0.
Dodge (2 stars) - The character receives +1 bonus to AC.
Lightning Reflexes (3 stars) - The character receives +2 bonus on Saving Throws vs. Rod/Staff/Wand and vs. Breath Weapon.
Flurry of Strikes (4 stars) - The character receives Flurry of Strikes modal ability. While activated can make one additional APR if she fights with either unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves or spears, but all attacks receive -5 penalty to THAC0.
Elegant Strike (5 stars) - With unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves and spears the character receives +1 bonus to damage for every 2 points of Dexterity above 10.
###### Warfare
Power Attack (1 star) - The character receives Power Attack modal ability. While activated all attacks with melee weapons are done with +3 bonus to damage but suffer -3 penalty to hit.
Cleave (2 stars) - Once per round, if the caharacter slays an enemy in melee, she gains one additional APR till end of round.
Great Fortitude (3 stars) - The character receives +2 bonus on Saving Throws vs. Paralysis/Poison/Death and vs. Pertification/Polymorph.
Greater Cleave (4 stars) - The effects of Cleave feat can be applied to the character any number of times per round whenever she slays an enemy with melee weapon.
Toughness (5 stars) - The character receives +30 bonus HP.
###### Tactics
Insightfull Strike (1 star) - With unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves and spears the character may use Intelligence value instead of Strength to determine bonus to damage.
	NOTE: This damage bonus is not multiplied by 1.5 for two-handed weapons, although if character got additional 0.5 strength bonus from Strength score, it is retained (i.e. if Strength is 14 and Intelligence is 16, the character will get +3 damage bonus from Intelligenge and +1 (0.5*2) from Strength to a total of +4 with two-handed weapons).
Combat Expertise (2 stars) - The character receives Combat Expertise modal ability. While activated all attacks with melee weapons suffer -3 penalty to THAC0 but character receives +3 bonus to AC.
Iron Will (3 stars) - The character receives +2 bonus on Saving Throws vs. Spells.
Study Opponent (4 stars) - The character receives Study Opponent innate ability which can be used 3 times per day.
Study Opponent:
Character can spend one round studying enemy and getting insight about its weakneses and share it the party. The target receives a -3 penalty to AC, saving throws and THAC0. 
This is an extraordinary ability and thus is not subject to magic resistance or savingthrows, neither can be dispelled.
Combat Intuition (5 stars) - While wearing light or no armor the character receives +1 bonus to AC for every 2 points of Intelligence above 10.
###### Bonus Priest Spell
(1 star) - The character can cast one more 1st level priest spell per day.
(2 stars) - The character can cast one more 2nd level priest spell per day.
(3 stars) - The character can cast one more 3rd and 4th level priest spells per day.
(4 stars) - The character can cast one more 5th and 6th level priest spells per day.
(5 stars) - The character can cast two more 7th level priest spells per day.
###### Bonus Wizard Spell
(1 star) - The character can cast one more 1st level wizard spell per day.
(2 stars) - The character can cast one more 2nd level wizard spell per day.
(3 stars) - The character can cast one more 3rd and 4th level wizard spells per day.
(4 stars) - The character can cast one more 5th and 6th level wizard spells per day.
(5 stars) - The character can cast one more 7th and 8th level wizard spells per day.
###### Empower Magic
(1 star) - Character's spells deal 5 % more damage.
(2 stars) - Character's spells deal 11 % more damage.
(3 stars) - Character's spells deal 18 % more damage.
(4 stars) - Character's spells deal 26 % more damage.
(5 stars) - Character's spells deal 35 % more damage.
###### Extend Magic
(1 star) - Character's spells last 10% longer.
(2 stars) - Character's spells last 22% longer.
(3 stars) - Character's spells last 36% longer.
(4 stars) - Character's spells last 52% longer.
(5 stars) - Character's spells last 70% longer.
###### Endure Magic
(1 star) - The character gains 5% resistance against Fire, Lightning, Acid, Cold and Magical damage.
(2 stars) - The character gains another 5% resistance (to a total of 10%) against Fire, Lightning, Acid, Cold and Magical damage.
(3 stars) - The character gains another 5% resistance (to a total of 15%) against Fire, Lightning, Acid, Cold and Magical damage.
(4 stars) - The character gains another 5% resistance (to a total of 20%) against Fire, Lightning, Acid, Cold and Magical damage.
(5 stars) - The character gains another 5% resistance (to a total of 25%) against Fire, Lightning, Acid, Cold and Magical damage.
###### Armored Arcana
(1 star) - The character ignores spell casting failure chance of Leather, Studded Leather and Hide Armors.
(2 stars) - The character ignores spell casting failure chance of Chain Mail and lighter armors.
(3 stars) - The character ignores spell casting failure chance of Splint Mail and lighter armors.
(4 stars) - The character ignores spell casting failure chance of Plate Mail and lighter armors.
(5 stars) - The character ignores spell casting failure chance of Full Plate Mail and lighter armors.


Generally character cun put up to 5 stars in any proficiency unless stated otherwise and as long as it makes sense (for example since Paladins can not cast spells of maximum 4th level, they can only put up to 3 stars in Bonus Priest Spell feat).


# To be condinued