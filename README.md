


















# Baldurs-gate-dnd-3.5 v2.15.4
This is a WeiDu mod for BG:Enhanced edition and BG2:Enhanced edition that changes 2ed ADnD rules to DnD 3.5 with some elements taken from Pathfinder.  
It changes game mechanics (i.e. classes, spells, abilities, etc...) to that of 3.5 edition (to the extent that game engine allows).

# Installation

Put all files to Game folder (the one which contains Baldur.exe) and run Setup-3ed.exe, choose to install ALL components (you can optionally skip Component [More powerful enemies] , Component [Point buy system] and Component [Rest once in 8 hours]).
In C:\Users\UserName\Documents\Baldur's Gate (II) - Enhanced Edition folder find file Baldur.lua and add the string
```
SetPrivateProfileString('Game Options','3E Thief Sneak Attack','1')
```
if it is not already there (it replaces backstab with 3ed Sneak Attack for Baldurs gate 1 and 2, for IWD it can be changed through the game menu).

Also it is strongly advised that you make a backup of your dialog.tlk file before installing.

This mod is only expected to work with english versions BG:ENHANCED EDITION 2.5 (or Sod with modmerge), BG 2:ENHANCED EDITION 2.5 and might not be compatible with any other mods.
It also works with Icewind Dale ENHANCED EDITION 2.5.

I also strongly suggest to use a mod Colorful Specialist Slots made by kjeron ( https://us.v-cdn.net/5019558/uploads/editor/nn/cv0dplebsnjj.rar) which forces specialist mages to
spend 1 or 2 slots only on the spells from corresponding school (I suggest to use 2 as per Pathfidner rules). It should be installed after DND3.5 mod.  

#### Due to big amount of content it is very difficult to test everything, so I would really appreciate if you could send information on the bugs and inconsistencies you found to holic.denis@gmail.com or post them on the issues page. Any critics and suggestions are also more than welcome.

# Rule Changes
## 1. Abilities

If Component [Point Buy System] is installed, roll based Abilities generation will be replaced with point-buy system (characters start with 10 points in every ability and can distribute 20 more points among them, increasing ability till 14 costs one point, from 14 to 16 - 2 points and finally from 16 to 18  - 3 points).

The effects of abilities were also changed as follows:

#### STRENGTH:
– Determines to hit bonus with melee weapons and throwing axes (+1 per 2 points above 9, -1 per 2 points below 10).  
– Determines damage bonus with melee weapons and throwing axes and slings (+1 per 2 points above 10, -1 per 2 points below 11).  
– Determines chance to force open the lock.  
– Determines Weight Allowance.  

STR | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---|--- | --- | --- | --- |--- |--- |--- |--- |--- |---|--- | --- | --- | --- |--- |---
Weight Allowance| 1 | 3 | 5 | 15 | 15 | 30 | 30 | 50 | 50 | 70 |100 | 120 | 160 | 200 | 250 | 300 | 350 | 400 | 500 | 600 | 700 | 800 | 1000 | 1200 | 1600
Bash| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |13 | 16 | 20 | 25 | 30 | 35 | 40 | 45 | 50 | 55 | 60 | 65 | 70 | 75 | 80

Note: two-handed weapons receive 1.5 damage bonus from STRENGTH.  
Note: Composite longbows also receive 0.5 damage bonus from STRENGTH.  

#### DEXTERITY:
– Determines to hit bonus with ranged weapons (+1 per 2 points above 9, -1 per 2 points below 10).  
– Determines AC bonus (+1 per 2 points above 10, -1 per 2 points below 11).  
– Gives combat bonuses with certain feats, weapons and armors.  
– Determines bonus to Hide In Shadows, Move Silently and Pickpocket skills (+5% per point above 10, -5% per point below).    
– Improves Saving Throws vs. Rod/Staff/Wand and vs. Breath Weapon (+1 per 2 points above 9, -1 per 2 points below 10).  
Note: wearing heavy armor may restrict maximum dexterity bonus to AC a character can have.  

#### CONSTITUTION:
– Determines bonus HP that characters receives per level (+1 per 2 points above 10).  
– For values greater than 19 gives slow HP regeneration over time.  
– Improves Saving Throws vs. Paralysis/Poison/Death and vs. Petrification/Polymorph (+1 per 2 points above 9, -1 per 2 points below 10).  
– Increases duration of Skald, Avenger and Barbarian Rage, Berserker Enrage and Dwarven Defender Defensive Stance.  

#### INTELLIGENCE
– Determines number of spells per level that can be learned by Bards and Mages.  
– Determines chance to learn a spell by Bards and Mages.  
– Determines bonus to Lore (+3 per point above 10, -3 per point below 8).  
– Gives combat bonuses with certain feats, weapons and armors.  
– Determines bonus to Find Traps, Open Lock and Set Traps skills (+5% per point above 10, -5% per point below).  
– Increases number of spells per day that can be cast by Mages and Assassins.  
– Increases Saving Throw penalties for Mage and Assassin spells (i.e. effective Saving Throws of spell targets are reduced by 1 per 2 points above 10).  
– Determines the duration of the effect of Maze spell cast on character.     
Note: A character with an Intelligence score of 8 or less is illiterate and cannot use scrolls or most wands regardless of her class.

INT | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---|--- | --- | --- | --- |--- |--- |--- |--- |--- |---|--- | --- | --- | --- |--- |---
Chance to learn spell| 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 20 | 30 |40 | 50 | 60 | 70 | 80 | 90 | 95 | 99 | 99 | 99 | 99 | 99 | 99 | 99 | 99
Number of spells per level| 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 4 |6 | 8 | 10 | 12 | 14 | 16 | 18 | 20 | All | All | All | All | All | All | All

#### WISDOM
– Increases AC bonus of Monk, Kensai and Ninja (+1 per 2 points above 10).  
– Increases number of spells per day that can be cast by Clerics, Paladins, Druids and Rangers.
– Determines bonus to Detect Illusion skill (+5% per point above 10, -5% per point below).   
– Improves Saving Throws vs. Spells (+1 per 2 points above 9, -1 per 2 points below 10).  
– Increases Saving Throw penalties for Cleric, Druid, Paladin and Ranger spells (i.e. effective Saving Throws of spell targets are reduced by 1 per 2 points above 10).  

#### CHARISMA
– Increases number of Channel Energy uses per day for Paladins and Clerics (+1 per 2 points above 10).  
– Improves all Paladin, Hexblade and Jester savingthrows (+1 per 2 points above 9 and -1 per 2 points below 10).  
– Increases number of Lay On Hands uses per day for Paladin or Absorb Health uses per day for Blackguards (+1 per 2 points above 12).  
– Increases number of uses per day and Saving Throw penalties for Bardic Performance.   
– Increases duration of Paladin and Hexblade auras.     
– Increases number of spells per day that can be cast by Bards, Hexblades, Sorcerers and Shamans.  
– Influences reaction of people on your character and prices in stores.  
– Increases Saving Throw penalties for Bard, Hexblade, Sorcerer and Shaman spells (i.e. effective Saving Throws of spell targets are reduced by 1 per 2 points above 10).

## 2. Feats
The proficiency system that was in the original was replaced with a feat system, also you can now place up to seven stars in most proficiency groups.   
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
Weapon Specialization (2 stars) - The character receives +2 bonus to damage with specified weapon category.  
Greater Weapon Focus (3 stars) - The character receives another +1 to hit bonus with specified weapon category.    
Greater Weapon Specialization (4 stars) - The character receives another +2 bonus to damage with specified weapon category.  
Weapon Mastery (5 stars) - The character receives additional 1/2 attack per round with specified weapon category.  
Epic Weapon Focus (6 stars) - The character receives another +2 to hit bonus with specified weapon category.  
Epic Weapon Specialization (7 stars) - The character receives another +4 bonus to damage with specified weapon category.


#### Weapon Style feats
###### Two-Handed Combat
Style Focus (1 star) - The wielder gets a +1 bonus to damage rolls, and -1 bonus to Speed Factor.  
Style Specialization (2 stars) - The wielder gets a further +1 bonus to damage rolls (to a total of +2).  
Greater Style Focus (3 stars) - The wielder gets a further +1 bonus to damage rolls (to a total of +3) and -1 bonus to Speed Factor to a total of (-2).  
Greater Style Specialization (4 stars) - The wielder gets a further +1 bonus to damage rolls (to a total of +4).  
Style Mastery (5 stars) - The wielder gets a further +1 bonus to damage rolls (to a total of +5) and -1 bonus to Speed Factor to a total of (-3).  
Improved Style Mastery (6 stars) - The wielder gets a further +2 bonus to damage rolls (to a total of +7)  
Epic Style Mastery (7 stars) - The wielder gets a further +2 bonus to damage rolls (to a total of +9)

###### Sword and Shield Combat
Style Focus (1 star) - The wielder gets a -1 bonus to AC.  
Style Specialization (2 stars) - The wielder gets another -1 bonus to AC (to a total of -2).  
Greater Style Focus (3 stars) - The wielder gets another -1 bonus to AC (to a total of -3).  
Greater Style Specialization (4 stars) - The wielder gets another -1 bonus to AC (to a total of -4).  
Style Mastery (5 stars) - The wielder gets another -1 bonus to AC (to a total of -5).  
Improved Style Mastery (6 stars) - The wielder gets another -1 bonus to AC (to a total of -6).  
Epic Style Mastery (7 stars) - The wielder gets another -1 bonus to AC (to a total of -7).

###### Single Weapon Combat
Style Focus (1 star) - The wielder gets a -1 bonus to THAC0 and inflicts critical damage on an attack roll of 18 - 20.  
Style Specialization (2 stars) - The wielder gets another -1 bonus to AC and THAC0 (to a total of -2) and inflicts critical damage on an attack roll of 17 - 20.  
Greater Style Focus (3 stars) - The wielder gets another -1 bonus to THAC0 (to a total of -3) and inflicts critical damage on an attack roll of 15 - 20.  
Greater Style Specialization (4 stars) - The wielder gets another -1 bonus to AC (to a total of -2) and THAC0 (to a total of -4) and inflicts critical damage on an attack roll of 14 - 20.  
Style Mastery (5 stars) - The wielder gets another -1 bonus to THAC0 (to a total of -5) and inflicts critical damage on an attack roll of 12 - 20.  
Improved Style Mastery (6 stars) - The wielder gets another -1 bonus to AC (to a total of -3) and THAC0 (to a total of -6) and inflicts critical damage on an attack roll of 11 - 20.  
Epic Style Mastery (7 stars) - The wielder gets another -1 bonus to THAC0 (to a total of -7) and inflicts critical damage on an attack roll of 9 - 20.

###### Two-Weapon Combat
Style Focus (1 star) - The wielder's penalties are reduced to -2 with the main weapon and with the off-hand weapon.  
Style Specialization (2 stars) - The wielder's penalties are reduced to 0 with the main weapon and  with the off-hand weapon.  
Greater Style Focus (3 stars) - The wielder receives a -1 bonus to AC.  
Greater Style Specialization (4 stars) - The wielder additionally gets -1 bonus to AC to a total of -2.  
Style Mastery (5 stars)  - The wielder additionally gets another -1 bonus to AC (to a total of -3) and inflicts critical damage on an attack roll of 19 - 20.  
Improved Style Mastery (6 stars) - he wielder additionally gets another -1 bonus to AC (to a total of -4) and inflicts critical damage on an attack roll of 18 - 20.  
Epic Style Mastery (7 stars) - The wielder additionally gets another -1 bonus to AC (to a total of -5) and inflicts critical damage on an attack roll of 17 - 20.

###### Archery
Style Focus (1 star) - The character receives Rapid Shot modal ability. While activated the character can make one additional APR with ranged weapons, but all attacks are done with -2 penalty to hit.  
Style Specialization (2 stars) - The character receives +1 to hit and +1 damage bonus with ranged weapons.  
Greater Style Focus (3 stars) - Rapid Shot mode becomes permanently activated if character equips bow and she no longer suffers -2 penalty to hit.  
Greater Style Specialization (4 stars) - The character receives Deadly Aim modal ability. While activated all attacks with ranged weapons are done with +3 bonus to damage but suffer -3 penalty to hit.  
Style Mastery (5 stars)  - The character inflicts critical damage on an attack roll of 17 - 20 with ranged weapons.  
Improved Style Mastery (6 stars) - The character receives Hail of Arrows innate ability.
```
Hail of Arrows:
Hail of arrows greatly speeds up archer's ability to strike at foes with ranged weapons. The ability sets archer's number of attacks per round to 10, but her THAC0 and damage suffer a 4 point penalty. The Hail of Arrows lasts for one round. Can be used once every 2 minutes.
```  
Epic Style Mastery (7 stars) - The character receives Greater Hail of Arrows innate ability.
```
Greater Hail of Arrows:
Greater Hail of arrows greatly speeds up archer's ability to strike at foes with ranged weapons. The ability sets archer's number of attacks per round to 10. The Greater Hail of Arrows lasts for one round. Can be used once every 2 minutes.
```  
Note: This Feat does not effect Throwing Axes.

#### Other Feats
###### Combat Prowess
Weapon Finesse (1 star) - With unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves and spears the character may use Dexterity value instead of Strength to determine bonus to THAC0.  
Dodge (2 stars) - The character receives +1 bonus to AC.  
Lightning Reflexes (3 stars) - The character receives +2 bonus on Saving Throws vs. Rod/Staff/Wand and vs. Breath Weapon.  
Flurry of Strikes (4 stars) - The character receives Flurry of Strikes modal ability. While activated can make one additional APR if she fights with either unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves or spears, but all attacks receive -5 penalty to THAC0.  
Elegant Strike (5 stars) - With unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves and spears the character receives +1 bonus to damage for every 2 points of Dexterity above 10.  
Whirlwind Attack (6 stars) - The character receives Whirlwind Attack innate ability.
```
Whirlwind Attack:
This ability allows the warrior to unleash a flurry of super-fast blows. The ability sets one's number of attacks per round to 10, but one's THAC0 and damage suffer a 4 point penalty. The Whirlwind Attack lasts for one round. Can be used once every 2 minutes.
```  
Greater Whirlwind Attack (7 stars) - The character receives Greater Whirlwind Attack innate ability.
```
Greater Whirlwind Attack:
This ability allows the warrior to unleash a flurry of super-fast blows. The ability sets one's number of attacks per round to 10. The Greater Whirlwind Attack lasts for one round. Can be used once every 2 minutes.
```  

###### Warfare
Power Attack (1 star) - The character receives Power Attack modal ability. While activated all attacks with melee weapons are done with +3 bonus to damage (+4 for two-handed weapons) but suffer -3 penalty to hit.  
Cleave (2 stars) - Once per round, if the character slays an enemy in melee, she gains one additional APR till end of round.  
Great Fortitude (3 stars) - The character receives +2 bonus on Saving Throws vs. Paralysis/Poison/Death and vs. Petrification/Polymorph.  
Greater Cleave (4 stars) - Once per round, if character hits a target she receives +1/2 additional APR till end of round.  
Toughness (5 stars) - The character regenerates 3 Hit points per round.  
Stunning Attack (6 stars) - The character receives Stunning Attack innate ability.
```
Stunning Attack:
Stunning Attack allows the warrior to strike blows so forceful that they stun an opponent for 2 rounds if the opponent fails a Save vs. Death at a -6 penalty. The ability lasts for 2 rounds and can be used once every 5 minutes.
```  
Deathblow (7 stars) - The character receives Deathblow innate ability.
```
Deathblow:
This ability allows the warrior to vanquish foes with a single blow.  For the next 2 rounds, any creature is instantly killed when struck by the warrior unless it makes a Save vs. Death  at a -4 penalty. This ability can be used once every 2 hours.
```  


###### Tactics
Insightful Strike (1 star) - With unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves and spears the character may use Intelligence value instead of Strength to determine bonus to damage.  
NOTE: This damage bonus is not multiplied by 1.5 for two-handed weapons, although if character got additional 0.5 strength bonus from Strength score, it is retained (i.e. if Strength is 14 and Intelligence is 16, the character will get +3 damage bonus from Intelligence and +1 (0.5*2) from Strength to a total of +4 with two-handed weapons).  
Combat Expertise (2 stars) - The character receives Combat Expertise modal ability. While activated all attacks with melee weapons suffer -3 penalty to THAC0 but character receives +3 bonus to AC, character also suffers additional 15% spell casting failure. Can be used only with melee weapon equipped.  
Iron Will (3 stars) - The character receives +2 bonus on Saving Throws vs. Spells.  
Study Opponent (4 stars) - The character receives Study Opponent innate ability which can be used 5 times per day.    
```
Study Opponent:
Character can spend one round studying enemy and getting insight about its weaknesses and share them to the party. The target receives a -3 penalty to AC, saving throws and THAC0 for next 10 rounds.
This is an extraordinary ability and thus is not subject to magic resistance or savingthrows, neither can be dispelled.  
```
Combat Intuition (5 stars) - While wearing light or no armor the character receives +1 bonus to AC for every 2 points of Intelligence above 10.  
Critical Strike (6 stars) - The character receives Critical Strike innate ability.
```
Critical Strike:
A high-level warrior's intimate knowledge of vital spots on opponents allows her to concentrate all of the attacks in one round to strike a vital area every time. With this ability, every attack roll made in the next round is a natural 20, a critical hit. This ability can be used once every 2 minutes.
```
Premonition (7 stars) - The character receives Premonition innate ability.
```
Premonition:
Premonition allows character to use his experience and mastery of combat to predict where a next blow will land and physically avoid being in that place. This ability improves Armor Class by 6 and Saving Throws by 3. Also to everyone else character seem to move so quickly that her movement rate is increased by 2 (base is 10) and normal missiles have no chance of striking her. This ability lasts for 2 rounds. Can be used once every 5 minutes.
```

###### Bonus Priest Spell
(1 star) - The character can cast one more 1st level priest spell per day.  
(2 stars) - The character can cast one more 2nd level priest spell per day.  
(3 stars) - The character can cast one more 3rd and 4th level priest spells per day.  
(4 stars) - The character can cast one more 5th and 6th level priest spells per day.  
(5 stars) - The character can cast two more 7th level priest spells per day.  
(6 stars) - The character can cast one more priest spell of each level per day.  
(7 stars) - The character can cast one more priest spell of each level per day.

###### Bonus Wizard Spell
(1 star) - The character can cast one more 1st level wizard spell per day.  
(2 stars) - The character can cast one more 2nd level wizard spell per day.  
(3 stars) - The character can cast one more 3rd and 4th level wizard spells per day.  
(4 stars) - The character can cast one more 5th and 6th level wizard spells per day.  
(5 stars) - The character can cast one more 7th and 8th level wizard spells per day.  
(6 stars) - The character can cast two more 9th level wizard spells per day.  
(7 stars) - The character can cast one more wizard spell of each level per day.

###### Empower Magic
(1 star) - Character's spells deal 10 % more damage.  
(2 stars) - Character's spells deal 15 % more damage.  
(3 stars) - Character's spells deal 20 % more damage.  
(4 stars) - Character's spells deal 25 % more damage.  
(5 stars) - Character's spells deal 30 % more damage.  
(6 stars) - Character's spells deal 40 % more damage.  
(7 stars) - Character's spells deal 50 % more damage.

###### Extend Magic
(1 star) - Character's spells last 20% longer.  
(2 stars) - Character's spells last 30% longer.  
(3 stars) - Character's spells last 40% longer.  
(4 stars) - Character's spells last 50% longer.  
(5 stars) - Character's spells last 60% longer.  
(6 stars) - Character's spells last 80% longer.  
(7 stars) - Character's spells last 100% longer.

###### Endure Magic
(1 star) - The character gains 10% resistance against Fire, Lightning, Acid, Cold and Magical damage.  
(2 stars) - The character gains another 5% resistance (to a total of 15%) against Fire, Lightning, Acid, Cold and Magical damage.  
(3 stars) - The character gains another 5% resistance (to a total of 20%) against Fire, Lightning, Acid, Cold and Magical damage.  
(4 stars) - The character gains another 5% resistance (to a total of 25%) against Fire, Lightning, Acid, Cold and Magical damage.  
(5 stars) - The character gains another 5% resistance (to a total of 30%) against Fire, Lightning, Acid, Cold and Magical damage.  
(6 stars) - The character gains another 5% resistance (to a total of 35%) against Fire, Lightning, Acid, Cold and Magical damage.  
(7 stars) - The character gains another 5% resistance (to a total of 40%) against Fire, Lightning, Acid, Cold and Magical damage.  

###### Quicken magic
(1 star) - Spell casting time for all spells is reduced by 1.   
(2 stars) - Spell casting time for all spells is further reduced by 1.  
(3 stars) - Spell casting time for all spells is further reduced by 1.  
(4 stars) - Spell casting time for all spells is further reduced by 1.  
(5 stars) - Spell casting time for all spells is further reduced by 1.  
(6 stars) - The character receives Improved Alacrity innate ability which can be used once per day.  
```
Improved Alacrity:
Improved Alacrity essentially erases the pause between casting spells. When cast, the wizard can begin casting a new spell the instant she is finished casting her current spell. The effect lasts for 2 rounds.
```
(7 stars) - The character receives another use per day of Improved Alacrity innate ability.


Generally character can put up to 7 stars in any proficiency unless stated otherwise and as long as it makes sense (for example since Paladins can cast spells of maximum 4th level, they can only put up to 3 stars in Bonus Priest Spell feat).  
Unless stated otherwise characters get a new Feat at level 1, level 3 and every 3 levels thereafter. The maximum number of stars that can be put in any feat tree is equal to 1 + 1/per 4 levels of the character (although 6th star can not be obtained before level 21).

## 3. Races
### HUMANS
Humans have the following traits:  
– Receive one bonus feat at level 1.  
– +5% to all thieving skills.  

### HALF-ELVES
Half-elves have the following traits:  
– 30% resistance against charm and sleep magics.  
– At first level receive +2 bonus to any chosen ability score.  
– Infravision.  
– +10% Pick Pockets, +5% Hide in Shadows.  

### ELVES
Elves have the following traits:  
– 90% resistance against charm and sleep magics.  
– Infravision.  
– +1 THAC0 bonus with bows, blades and straight swords weapon categories.  
– -5% Open Locks, +5% Pick Pockets, +5% Move Silently, +10% Hide in Shadows.  
– +2 Dexterity, -2 Constitution.  

### DWARVES
Dwarves have the following traits:  
– +2 bonus to Saving Throws vs. Paralysis/Poison/Death, vs. Rod/Staff/Wand, and vs. Spell.  
– Infravision.  
– +10% Open Locks, +15% Find Traps, +5% Detect Illusion, +10% Set Traps.  
– +2 Constitution, -2 Charisma.  

### GNOMES
Gnomes have the following traits:  
– +2 bonus to Saving Throws vs. Rod/Staff/Wand and vs. Spell.  
– Infravision.  
– +5% Open Locks, +10% Find Traps, +5% Move Silently, +5% Hide in Shadows, +10% Detect Illusion, +5% Set Traps.  
– +2 Constitution, -2 Strength.  
– Being a small race they receive -1 to weapon damage rolls, +1 to AC and +1 to THAC0.  

### HALFLINGS
Halflings have the following traits:  
– +2 bonus to Saving Throws vs. Paralysis/Poison/Death, vs. Rod/Staff/Wand, and vs. Spell.  
– +1 THAC0 bonus with missile weapons category.  
– +5% Open Locks, +5% Find Traps, +5% Pick Pockets, +10% Move Silently, +15% Hide in Shadows.  
– +2 Dexterity, -2 Strength.  
– Being a small race they receive -1 to weapon damage rolls, +1 to AC and +1 to THAC0.  

### HALF-ORCS
Half-orcs have the following traits:  
– Infravision.  
– +2 Strength, -2 Intelligence.  
– +1 THAC0 with straight swords and axes.  


## 4. Classes

All the classes were changed to better correspond to the DND 3.5 Edition counterparts (or Pathfinder ones), some of the kits were completely replaced or removed. Dual-classing was disabled (instead humans can now choose any multi-class) since with the feat system it becomes utterly unfair (dual-class characters would gain twice the number of feats). The experience progression of multi-classes were changed so that with same amount of experience they will have the same level as single classes (i.e. a for example with 160 000 experience a single class Fighter will reach level 9, same as Fighter/Mage will reach level 9/9), although the abilities they get were changed so that instead of being almost a direct sum of 2 single classes they now correspond more to Pathfinder approach for  hybrid classes which gain a mix of certain traits of both parent classes as well as receiving some unique abilities.
The number of experience points needed to reach new levels was also changed as follows:

Lvl| Exp Points |
--- | ---
1|       0
2|    2500
3|    5000
4|   10000
5|   19000
6|   34000
7|   60000
8|  100000
9|  160000
10| 270000
11| 420000
12| 720000
13|1030000
14|1350000
15|1680000
16|2020000
17|2370000
18|2730000
19|3100000
20|3480000
21|3870000
22|4270000
23|4680000
24|5100000
25|5530000
26|5970000
27|6420000
28|6880000
29|7350000
30|7830000


New description of classes is given below.

### FIGHTER
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon and shield (including large shield).  
– May get seven stars in any weapon category.  
– Gets one bonus feat at level 1 and at every even level.  
– At 4th level gets Armor Training which increases max dexterity AC bonus from any armor by 1. Max dexterity AC bonus is further increased by 1 every 4 levels thereafter (up to a maximum of +4 at level 16).  
– At 8th level receives +1 to hit and damage bonus with all weapon categories, this bonus is increased to +2 at level 16 and +3 at level 24.     
– Can use Hardiness once per day starting from level 21, gains an additional use at level 26.
```
HARDINESS:
Calling upon hidden reserves of strength during times of danger, a warrior can use the Hardiness ability to gain 40% resistance to all forms of physical damage. The ability lasts for 1 round for every 2 levels of the warrior.
```
– Can use Resist Magic once per day starting from level 23, gains an additional use at level 28.
```
RESIST MAGIC:
This ability allows the warrior to temporarily tap a great inner strength and fight off the effects of malevolent magic. For 4 rounds, the warrior's Magic Resistance is set to 50%. This is not cumulative with other forms of Magic Resistance, so if the warrior already has 50% Magic Resistance or greater, the ability is useless.
```
– Hit Die: d10  
– High THAC0/APR progression, High Savingthrows vs. Death and vs. Polymorph

### BERSERKER
Advantages:  
– Hit Die: d12  
– Bonus Feats: at level 1 Berserker receives Warfare (1):Power Attack, at level 4 she receives Warfare (2):Cleave and finally at level 8 - Warfare (3):Great Fortitude.    
– May use Rage ability once per day. Gains one use at level 1, additional uses at level 4 and every 4 levels thereafter.
```
RAGE: The enraged state lasts for 3 rounds + 1 per 2 points of Berserker's Constitution above 10. While enraged, a Berserker gains a bonus of +3 to her attack and damage rolls as well as 10% physical damage reduction but suffers -2 penalty to her Armor Class, and becomes immune to charm, confusion, fear, feeblemind, hold, imprisonment, level drain, maze, stun, and sleep.
At 10th the attack and damage rolls bonus increases to +5 and physical damage resistance bonus to 20%.
At 19th level the attack and damage rolls bonus increases to +7 and physical damage resistance bonus to 30%.
```
– 8th level: Endless Berserk: Berserker can prolong her rage if the combat lasts too long, while enraged she can spend an extra use of her Rage to prolong it for a new full duration, she does not feel the tiring effects until the end of this new Rage, she can continue to prolong the Rage as long as she has Rages.  
– 12th level: Improved Power Attack: Power attack damage bonus is increased to +5 (+7 for two-handed weapons).  
– 16th level: Supreme Power Attack:  Power attack damage bonus is further increased to +6 (+9 for two-handed weapons).  
– 18th level: Immortal Berserker: The hit points of enraged Berserker can not be reduced below 1, but at the end of Rage Berserker receives 15 points of damage which can kill her if she has fewer hit points.   
Note: although her hit points can not be reduced below 1, Berserker can still be killed by spells like Slay Living, Disintegrate and others.  
– 20th level: Last Berserk: Berserker gains one use per day of special form of Rage called Last Berserk. It has the same effect as normal Rage but the damage bonus is increased to +15. However it can not be prolonged and after it ends Berserker can no longer use Rage for next 8 hours.    
– Gets one bonus feat at levels 22, 25 and 28.

Disadvantages:  
– Becomes winded after berserking: -2 penalty to Armor Class, to-hit rolls, and damage rolls.  
– Can not use ranged weapons.  
– Does not get Hardiness and Resist Magic abilities.  
– Does not get bonus feats like trueclass fighters do.  
– May only put one star in any weapon she can use.  
– May not wear armor heavier than splint mail and use large shield.  
– Alignment restricted to any non-lawful.  

### HEXBLADE (replaces WIZARDSLAYER)
Advantages:  
– Receives a bonus to all saving throws for every 2 points of Charisma above 9 (i.e +1 at 11, +2 at 13, etc) and penalty for every 2 points below 10.  
– May use Hexblade's Curse innate ability. Gets a number of uses per day equal to 1 + 1 per 2 points of Charisma above 10 at level 1. Gets one additional use per day every 4 levels thereafter.  
```
HEXBLADE'S CURSE:
Hexblade unleashes a curse upon a foe who receives a penalty of -2 to THAC0, damage and savingthrows for 1 turn if he fails the savingthrow vs. Spell with penalty equal to one fourth of Hexblade's level rounded down + 1 per 2 points of Hexblade's Charisma above 10.
At level 7 the penalty to THAC0, damage and savingthrows increases to -4, at level 17 to -6 and finally at level 27 to - 8.
```
– May summon Familiar starting from level 4.  
– Starting from level 4 can cast a limited number of Spells (through Innate Abilities menu). Hexblade does not need to memorize her spells in advance and can spontaneously cast any spell she knows.  
```
Hexblade Spellbook:
First Level Spells: Starting from level 4 Hexblade gets access to the following spells: Sleep, Blindness, Charm Person, Spook and Protection from Evil.
Second Level Spells: Starting from level 7 Hexblade gets access to the following spells: Strength, Glitterdust, Invisibility, Mirror Image and Stinking Cloud.
Third Level Spells: Starting from level 10 Hexblade gets access to the following spells: Vampiric Touch, Dispel Magic, Dire Charm, Detect Illusions and Slow.
Fourth Level Spells: Starting from level 13 Hexblade gets access to the following spells: Improved Invisibility, Emotion:Hopelessness, Polymorph Other, Secret Word and Confusion.
```
– Gets one bonus feat only at levels 5, 10, 15, 20, 22 and 28.  
– Starting from level 6 may use Swift Spell ability once per day. Gets additional uses at levels 8, 11, 14, 18, 23 and 30.  
```
SWIFT SPELL:
When this ability is activated for next round Hexblade's casting speed is increased by 5.
```
– Starting from level 12 may use the Aura of Unluck ability once per day. Gains and additional use every 4 levels thereafter.  
 ```
AURA OF UNLUCK:
When this ability is activated, all enemies within 30 feet of the Hexblade suffer -1 penalty to luck. This penalty increases to -2 at level 16, -3 at level 20 and finally up to -4 at level 24.
The effect lasts for 3 rounds + 1 round per 2 points of Hexblades's Charisma above 10.
```
– High Savingthrows vs. Spell  

Disadvantages:  
– May not be of good alignment.  
– Does not get bonus feats like trueclass fighters do.  
– Does not get Hardiness and Resist Magic abilities.  
– May only put one star in any weapon she can use.  
– May use only light armor and medium armor, may not use large shield.  

### KENSAI
Advantages:  
– Gains +1 bonus to AC for every 2 points of Wisdom above 10.  
–  Signature Weapon Category: At level 1 Kensai chooses one weapon category which becomes his Signature Weapon Category. At level 1 Kensai gets for free Weapon Focus with this category, at level 4 - Weapon Specialization, at level 8 - Greater Weapon Focus, at level 12 - Greater Weapon Specialization, at level 16 - Weapon Mastery, at level 21 - Epic Weapon Focus, at level 24 - Epic Weapon Specialization.  
– +1 to hit and damage rolls with Signature weapon category every 4 levels (starting from level 4).  
– Immune to sneak attack.  
– Has Evasion passive ability.  
```
EVASION: this passive ability allows the target of an area attack to leap or twist out of the way. If subjected to an attack that allows a Savingthrow vs. Breath Weapon or vs. Wand for half damage, a character with evasion takes no damage on a successful save.
```
– May use the Kai ability once per day. Gains one use at level 1 then at level 5 and an additional use every 5 levels thereafter.  
```
KAI: All successful attacks within the next 10 seconds deal maximum damage.
```
– Gets one bonus feat at levels 22 and 28.  

Disadvantages:  
– May only wear light armor.  
– May not use shields.  
– Does not get bonus feats like trueclass fighters do.  
– Does not get Hardiness and Resist Magic abilities.  
– May only put one star in any weapon category she can use.  
– Alignment restricted to any non-chaotic.  

### BARBARIAN
Advantages:  
– Moves 2 points faster than other characters.  
– Immune to sneak attack.  
– May use the Rage ability once per day. Gains one use at level 1, then at level 4 and an additional use every 4 levels thereafter.  
```
RAGE: The enraged status provides a +4 bonus to Strength and Constitution, a -2 penalty to Armor Class and a +2 bonus to Saving Throws vs. Spell, as well as immunity to all charm, hold, fear, maze, stun, sleep, confusion, and level drain spells.
It lasts for 3 rounds + 1 round per 2 points of newly modified Constitution above 10. At the end of the rage, the character loses the rage modifiers and becomes fatigued (-2 penalty to Strength, -2 penalty to Dexterity) for the duration of 5 rounds.
```
– Gains 5% resistance to crushing, slashing, piercing, and missile damage at level 7 and every 3 levels thereafter to a maximum of 40% at level 28.  
– 11th level: Greater Rage: Barbarian’s Rage bonuses to Strength and Constitution during rage each increase to +6, and morale bonus on saves  vs. Spell increases to +6. The penalty to AC remains at -2.  
– 17th level: Tireless Rage: Barbarian is no longer fatigued after the rage ends.  
– 20th level: Mighty Rage: Barbarian’s Rage bonuses to Strength and Constitution during rage each increase to +8, and morale bonus on saves  vs. Spell increases to +4. The penalty to AC remains at -2.  
– Hit Die: d12  
– High Savingthrows vs. Breath Weapon and vs. Wand  

Disadvantages:  
– May not wear armor heavier than splint mail.  
– May not use large shields.  
– Gets bonus feats only at levels 4, 8, 12, 16, 20, 22 and 28.    
– Does not get Hardiness and Resist Magic abilities.  
– Can not use Hardiness and Resist Magic abilities.  
– May only put one star in any weapon she can use.     

### DWARVEN DEFENDER
Advantages:  
– May use Defensive Stance once per day. Gains one use at level 1, one use at level 4, and an additional use every 4 levels thereafter.  
```
DEFENSIVE STANCE:
Dwarven Defender gains phenomenal strength and durability, but can move only at 50% of its speed. Dwarven Defender gains +2 to Strength, +2 to Constitution, a +1 bonus on all savingthwrows, and a +2 bonus to AC. A defensive stance lasts for a number of rounds equal to 3 + 1 per 2 points of the character’s (newly improved) Constitution above 10.    
At the end of the Defensive Stance, the character becomes fatigued (-2 penalty to Strength) for the duration of 5 rounds.
At 10th level, Dwarven Defender’s bonuses to Strength, Constitution and AC each increase to +4, and bonus on saves increases to +2.
At 17th level, the character is no longer subject to fatigue effects after Defensive Stance.
```
– Gains 5% resistance to crushing, slashing, piercing, and missile damage at level 3 and every 3 levels thereafter to a maximum of 50% at level 30.  
– High Savingthrows vs. Spell   
– Hit Die: d12  

Disadvantages:  
– Race restricted to dwarf.  
– Gets bonus feats only at levels 4, 8, 12, 16, 20, 22 and 28.  
– Does not get Hardiness and Resist Magic abilities.  
– May only put one star in any weapon she can use.  

### PALADIN
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon and shield.  
– May use Lay On Hands ability once per day for every 2 points of Charisma above 10.  
```
LAY ON HANDS:The character channels positive energy to heal the touched creature of 2 Hit Points per level of the caster.
Starting from level 6 Paladin also cures touched creature of any disease and starting from level 9 of any poison effects.
This ability has the reverse effect on undead creatures harming them instead of healing.
```
– Starting from level 6 Lay On Hands ability also cures disease.  
– Starting from level 9 Lay On Hands ability also cures poison.  
– May cast Detect Evil once per day per level (starts at 1st level with 4 uses).  
– May channel positive energy starting from level 3 number of times per day equal to 1 per 2 points of Charisma above 10 as good clerics (2d6 damage/healing at level 3 plus 1d6 per 2 levels).  
```
CHANNEL POSITIVE ENERGY:  Priest creates a burst of positive energy that affects all creatures  in a 30-foot radius centered on her.
All allied living creatures are healed for 1d6 hit points per Channel Energy Level of the caster.
All hostile undead creatures suffer 1d6 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster level rounded down. In which case they receive only half damage.
```
– May cast priest spells starting at level 4.  
– May use Smite Evil ability. Gains one use per day at level 1, level 4 and every 4 levels thereafter.  
```
SMITE EVIL: For 10 seconds Paladin receives +1 bonus to her attack roll per 2 points of Charisma above 10 and deals 1 extra point of damage per level against evil creatures.
```
– Starting from level 3 may use the Aura of Faith ability once per day. Gains and additional use every 6 levels thereafter.  
```
AURA OF FAITH:
When this ability is activated, all allies within 30 feet receive beneficial effects based on the caster level for 3 rounds + 1 round per 2 points of caster's Charisma above 10:
  3rd Level: - All allies receive a +1 bonus to hit, damage rolls and Armor Class as well as immunity to fear.
  9th Level: - All allies receive a +2 bonus to hit, damage rolls and Armor Class as well as immunity to fear.
  15th Level: - All allies receive a +3 bonus to hit, damage rolls and Armor Class as well as immunity to fear.
  21st Level: - All allies receive a +4 bonus to hit, damage rolls and Armor Class as well as immunity to fear.
```
– Receives a bonus to all saving throws for every 2 points of Charisma above 9 (i.e. +1 at 11, +2 at 13, etc) and penalty for every 2 points below 10.  
– Gets one bonus feat at levels 22 and 28.  
– Alignment restricted to lawful good.  
– Hit Die: d10  
– High THAC0/APR progression, High Savingthrows vs. Death , vs. Polymorph and vs. Spell

### CAVALIER
Advantages:  
– +3 bonus to hit and damage rolls against all fiendish and draconic creatures.  
– May cast Remove Fear once per day per level.  
– Immune to charm, fear, poison, and morale failure.  
– 20% resistance to fire and acid.  

Disadvantages:  
– May not use Aura of Faith ability.    
– May not use missile weapons.  

### INQUISITOR
Advantages:  
– May cast Dispel Magic once per day. Gains one use at level 4 and an additional use every 4 levels thereafter. The spell is cast at Speed Factor 1 and acts at twice the Inquisitor's character level.   
– May cast True Sight once per day. Gains one use at level 4 and an additional use every 4 levels thereafter.  
– Immune to hold and charm.  
– Each successful hit bestows a 25% cumulative chance of spell failure on the target.  
– Magic Resistance: 25% +2% per level to a maximum of 85% at level 30.  
– May use Smite Mage ability. Gains one use per day at level 1, level 5 and every 5 levels thereafter.  
```
SMITE MAGE: For 10 seconds Inquisitor receives +1 bonus to her attack roll per 2 points of Charisma above 10 and deals 1 extra point of damage per level against arcane magic users.
```

Disadvantages:  
– May not channel positive energy.  
– May not use the Lay On Hands ability.   
– May not use Smite Evil ability.  
– May not use Aura of Faith ability.  
– May not cast priest spells.  

### UNDEAD HUNTER
Advantages:  
– +3 bonus to hit and damage rolls against undead creatures.  
– Immune to hold and level drain.  
– May use Smite Undead ability. Gains one use per day at level 1, level 4 and every 4 levels thereafter.  
```
SMITE UNDEAD: For 10 seconds Undead Hunter receives +1 bonus to her attack roll per 2 points of Charisma above 10 and deals 1 extra point of damage per level against undead creatures.
```
Disadvantages:  
– May not use Lay On Hands ability.  
– May not use Smite Evil ability.  

### BLACKGUARD
Advantages:  
– Immune to level drain and fear.  
– May channel negative energy starting from level 3 number of times per day equal to 1 + 1 per 2 points of Charisma above 10 as evil clerics.  
```
CHANNEL NEGATIVE ENERGY:  Priest creates a burst of negative energy that affects all creatures  in a 30-foot radius centered on her.
All allied undead creatures are healed for 1d6 hit points per Channel Energy Level of the caster.
All hostile living creatures suffer 1d6 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster rounded down. In which case they receive only half damage.
```
– May use the Absorb Health ability once per day per 2 points of Charisma above 10.  
```
ABSORB HEALTH: The character steals 2 Hit Points per level from a target creature and transfers them to herself.
If applied to undead creatures this ability heals them instead.
```
– May use the Poison Weapon ability once per day. Gains one use at level 1, one use at level 5, and an additional use every 5 levels thereafter.  
```
POISON WEAPON:
Each successful hit within the next 5 rounds will inject poison into the target. Each target can only be affected once per round. The amount of poison damage depends on the character's level:

1st - Target suffers 1 poison damage per second for 6 seconds (Save vs. Death at +1 negates)
4th - Target suffers 1 poison damage per second for 12 seconds (Save vs. Death negates), and also immediately suffers 2 poison damage (no save)
8th - Target suffers 1 poison damage per second for 18 seconds (Save vs. Death at -1 negates), and also immediately suffers 4 poison damage (no save)
12th - Target suffers 1 poison damage per second for 24 seconds (Save vs. Death at -2 negates), and also immediately suffers 6 poison damage (no save)
16th - Target suffers 1 poison damage per second for 24 seconds (Save vs. Death at -3 negates), and also immediately suffers 9 poison damage (no save)
20th - Target suffers 1 poison damage per second for 24 seconds (Save vs. Death at -4 negates), and also immediately suffers 12 poison damage (no save)
24th - Target suffers 2 poison damage per second for 24 seconds (Save vs. Death at -5 negates), and also immediately suffers 16 poison damage (no save)
```
– 3rd level: May use the Aura of Despair ability once per day. Gains and additional use every 6 levels thereafter.     
```
AURA OF DESPAIR:
Targets all enemies within 30 ft. with effects that improve based on the caster's level for 3 rounds + 1 round per 2 points of caster's Charisma above 10:
  3rd Level: -1 penalty to hit and damage rolls and a -2 penalty to Armor Class.
  9th Level: -2 penalty to hit and damage rolls and a -2 penalty to Armor Class.
  15th Level: -4 penalty to hit and damage rolls and a -4 penalty to Armor Class; causes fear in enemies of level 8 or below.
  21st Level: -4 penalty to hit and damage rolls and a -4 penalty to Armor Class; causes fear in enemies level 18 or below.
There is no Saving Throw against this ability.
```

– May use Smite Good ability. Gains one use per day at level 1, level 4 and every 4 levels thereafter.  
```
SMITE GOOD: For 10 seconds Blackguard receives +1 bonus to her attack roll per 2 points of Charisma above 10 and deals 1 extra point of damage per level against good creatures.
```

Disadvantages:  
– Alignment restricted to evil.  
– May not cast Detect Evil.  
– May not use the Lay on Hands ability.  
– May not use Smite Evil ability.  
– May not use Aura of Faith ability.  

### RANGER
CLASS FEATURES:  
– May wear helmets.  
– May use any weapon and shield (excluding large shield).  
– May not wear armor heavier than splint mail.  
– Has Evasion passive ability.  
```
EVASION: this passive ability allows the target of an area attack to leap or twist out of the way. If subjected to an attack that allows a Savingthrow vs. Breath Weapon or vs. Wand for half damage, a character with evasion takes no damage on a successful save.
```
– Gets one bonus combat style feat at levels 2, 6, 10, 14, 18, 22 and 26.    
– May select one racial enemy at levels 1, 5 and every 5 levels thereafter which grants a +2 bonus on to hit and damage rolls against the selected enemy race. These bonuses increase by 1 at every 5th level.  
– May use the Charm Animal ability once per day. Gains one use at level 1 and an additional use every 2 levels thereafter.  
– May use the Hide In Shadows and Move Silently skills (15% at level 1, +5% at every next level).   
– May call for an animal companion who fights for her side.  
– Starting from level 21 may call for epic animal companion who in addition receives 20% magic and elemental damage resistance, immunity to all mind-effecting spells and attacks as if with +4 weapon.  
– May cast druidic spells starting at level 4.  
– Gets one bonus feat at level 28.  
– Alignment restricted to good.  
– Hit Die: d10  
– High THAC0/APR progression, High Savingthrows vs. Death , vs. Polymorph, vs. Breath Weapon and vs. Wand


### ARCHER
Advantages:  
– Bonus Feats: Archer gets Style Focus in Archery for free at level 2, Style Specialization at level 6, Greater Style Focus at level 10, Greater Style Specialization at level 14 Style Mastery at level 18, Improved Style Mastery at level 22 and Epic Style Mastery at level 26.  
– Once per day can create 40 arrows (starts with normal arrows at level 1, which become +1 at level 5, +2 at levle 10, +3 at level 15 and +4 at level 20).  
– May use the Called Shot ability once per day. Gains one use at level 4 and an additional use every 2 levels thereafter.  
```
CALLED SHOT: All successful ranged attacks within the next 10 seconds have the following cumulative effects besides normal damage, according to the level of the Archer:
 4th level: -2 penalty to target's THAC0.
 8th level: -2 penalty to target's Saving Throws vs. Spell.
 12th level: -2 penalty to the target's Strength score.
 16th level: +4 bonus to damage roll.
```
Disadvantages:  
– Does not gain weapon style bonus feats.  
– May only wear light armor.  
– May not use the Charm Animal ability.  

### BEAST MASTER
Advantages:  
– +15% to Move Silently and Hide In Shadows.  
– Has a telepathic link with his animal companion which allows them to fight as one. When fighting close to each other Beast master and his animal companion get +1 To Hit, Damage, AC and Saving Throws. These bonuses increase to +2 at level 6,  +3 at level 12 and +4 at level 18, +5 at level 24 and +6 at level 30.  
– Gains additional bonus feat at level 22.  
– Hit Die: d12.  

Disadvantages:  
– Does not gain bonus combat style feats.  
– May use only weapons available to druids as well as axes, longbows and shortbows.  
– May only wear armor a druid can.  

### STALKER
Advantages:  
– +20% to Move Silently and Hide In Shadows.  
– Racial Enemy is replaced with Improved Racial Enemy.  
```
IMPROVED RACIAL ENEMY: At 1st level, a stalker may select a type of creature from among the list for which she gets +2 bonus on to hit and damage rolls as well as +2 bonus to AC and savingthrows. At every 5th level to hit and damager bonuses are increased by 2 and stalker can select an additional improved racial enemy.
```
– May use Smite Racial Enemy ability. Gains one use per day at level 1, level 4 and every 4 levels thereafter.  
```
SMITE RACIAL ENEMY: For 10 seconds Stalker receives +1 bonus to her attack roll per 2 points of Wisdom above 10 and deals 1 extra point of damage per level against racial enemies.
```
– May be of any alignment.  
– Gains additional bonus feat at level 22.  

Disadvantages:  
– Does not gain bonus weapon style feats.    
– May only wear light armor.  
– May not use the Charm Animal ability.  

### CLERIC
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and shield (excluding large shield).  
– May only use non-bladed, non-piercing weapons (war hammer, club, flail, mace, quarterstaff, sling).  
– May only become Proficient (one star) in any weapon class.  
– May channel positive (good and neutral clerics) or negative (evil clerics) energy starting from level 1 number of times per day equal to 3 + 1 per 2 points of Charisma above 10. (1d6 damage/healing at level 1 plus 1d6 per 2 levels).  
```
CHANNEL POSITIVE ENERGY:  Priest creates a burst of positive energy that affects all creatures  in a 30-foot radius centered on her.
All allied living creatures are healed for 1d6 hit points per Channel Energy Level of the caster.
All hostile undead creatures suffer 1d6 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster level rounded down. In which case they receive only half damage.
```
```
CHANNEL NEGATIVE ENERGY:  Priest creates a burst of negative energy that affects all creatures  in a 30-foot radius centered on her.
All allied undead creatures are healed for 1d6 hit points per Channel Energy Level of the caster.
All hostile living creatures suffer 1d6 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster level rounded down. In which case they receive only half damage.
```
– May cast priest spells.  
– May spontaneously convert memorized spells to healing ones (Good and Neutral Clerics) or harming ones (Evil Clerics).  
– At 1st level chooses two domains that grant her access to additional spells and abilities, normally not available to Clerics of other domains.  
– Gains access to the following epic spells: Globe of Blades (at level 19), Mass Raise Dead (at level 20), Storm of Vengeance (at level 21), Energy Blades (at level 22), Implosion (at level 23) and Summon Deva (at level 24).  
– Gets one bonus feat at levels 22, 25 and 28.  
– Hit Die: d8  
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph and vs. Spell


### PRIEST OF LATHANDER
Advantages:  
– May use Cleansing Flames starting from level 1 number of times per day equal to 5 plus 1 per 2 points of Charisma above 10.  
```
Cleansing Flames:  Priest creates a burst of cleansing fire that affects all creatures  in a 30-foot radius centered on her.
All allied living creatures are healed for 1d8 hit points per Channel Energy Level of the caster.
All hostile creatures are blinded for 2 rounds, additionally evil creatures suffer 1d8 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster level rounded down +2. In which case they receive only half damage and are not subject to blind effect.
```
– Immune to hold, level drain and poison.  

Disadvantages:  
– Alignment restricted to lawful good, neutral good, chaotic good, and true neutral.   
– May not wear armor heavier than splint mail.  
– Can cast two less spells per day per level than trueclass clerics.  

### PRIEST OF HELM  
Advantages:  
– Gains one bonus combat feat at levels 5, 10, 15 and 20.  
– May get up to Weapon Specialization (2 stars) in any weapon they can use.  

Disadvantages:  
– Alignment restricted to lawful good, lawful neutral, lawful evil, and true neutral.  
– Can cast two less spells per day per level than trueclass clerics.  

### PRIEST OF TALOS
Advantages:  
– Gets for free Empower Magic (1): 10% at level 1, Empower Magic (2): 15% at level 4 and finally Empower Magic (3): 20% at level 8.  
– Deals additional electrical damage on every successful hit (double on critical hits):  
  Level 1-5: 1d2  
  Level 6-10: 1d4  
  Level 11-15: 1d6  
  Level 16-20: 1d8   
  Level 21-25: 1d10  
  Level 26+: 1d12  

Disadvantages:  
– Alignment restricted to neutral evil, chaotic evil, and chaotic neutral.  
– May not channel energy.  

### PRIEST OF TYR
Advantages:  
– May use Smite Evil ability. Gains one use per day at level 1, level 4 and every 4 levels thereafter.  

Disadvantages:  
– Alignment restricted to lawful good, neutral good, or lawful neutral.  
– Can cast two less spells per day per level than trueclass clerics.  

### PRIEST OF TEMPUS  (IWD and BG2 only)
Advantages:  
– Can use Rage ability (starts with one use at level 1 then get another one at level 5 and every 5 levels thereafter), though Priest of Tempus never gets benefits of Greater or Mighty Rage.  
```
RAGE: The character is enraged  which grants her a +4 bonus to Strength and Constitution, a -2 penalty to Armor Class, and a +2 bonus to Saving Throws vs. Spell, as well as immunity to all charm, hold, fear, maze, stun, sleep, confusion, and level drain spells.
The enraged state lasts 3 rounds + 1 round per 2 points of newly modified Constitution above 10.
At the end of the rage, the character loses the rage modifiers and becomes fatigued (-2 penalty to Strength, -2 penalty to Dexterity) for the duration of 5 rounds.
```
– May cast Chaos of Battle once per day starting from level 1. Gains an additional use at level 4 and every 4 levels thereafter.  
```
CHAOS OF BATTLE: Chaos of Battle applies bonuses to all allies and penalties to all enemies within a 30-ft. radius of the caster. The spell lasts for 3 rounds + 1 round per 2 points of caster Charisma above 10 and will randomly affect the targets' Armor Class, Hit Points, THAC0, saves, or luck. The magnitude of the effect starts at 1 (5 for Hit Points) at level 1 and will improve by 1 (5 for Hit Points) every 6 levels of the caster.
```
Disadvantages:  
– May not channel energy.  
– Alignment restricted to chaotic good, chaotic neutral, chaotic evil, or true neutral.  

### DRUID
CLASS FEATURES:  
– May only wear non-metallic armor.  
– May only equip bucklers and non-metallic shields.  
– May only use the following weapons: scimitar, dagger, club, spear, quarterstaff, dart, sling.  
– May cast druidic spells.  
– May use the Charm Animal ability once per day. Gains one use at level 1 and an additional use every 2 levels thereafter.  
– May spontaneously convert memorized spells to summoning ones.  
– May call for an animal companion who fights for her side.  
– 5th level: Gains Shapeshift ability which allows to transform  into a wolf, black bear, or brown bear once per day, gains additional uses at levels 6, 7, 10, and every 4 levels thereafter. While shapechanged druid can not use any weapons or shields but continues to benefit from bonuses from all the other equipment.  
– 8th level: While using Shapeshift ability a Druid can alternatively transform into fire salamander, sword spider or baby wyvern.  
– 11th level (IWD only): While using Shapeshift ability a Druid can alternatively transform into polar bear, boring beetle or winter wolf.  
– 15th level: Becomes immune to poison.  
– 16th level: While using Shapeshift ability a Druid can alternatively take form of large fire, earth  or water (IWD only) elementals.    
– 20th level: While using Shapeshift ability a Druid can alternatively take form of greater fire, earth  or water (IWD only) elementals.  
– 21th level: May call for epic animal companion who in addition receives 20% magic and elemental damage resistance, immunity to all mind-effecting spells and attacks as if with +4 weapon.  
– Gains access to the following epic spells: Elemental Summoning (at level 19), Aura of Flaming Death (at level 20), Storm of Vengeance (at level 21), Energy Blades (at level 22), Greater Elemental Summoning (at level 23) and Nature's Avatar (at level 24).  
– Gets one bonus feat at levels 22 and 28.  
– Alignment restricted to true neutral.  
– Hit Die: d8  
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph and vs. Spell

### AVENGER
Advantages:  
– Moves 2 points faster than other characters.  
– Can use Rage ability (starts with one use at level 1 then get another one at level 5 and every 5 levels thereafter), though Avenger never gets benefits of Greater or Mighty Rage.  
```
RAGE: The character is enraged  which grants her a +4 bonus to Strength and Constitution, a -2 penalty to Armor Class, and a +2 bonus to Saving Throws vs. Spell, as well as immunity to all charm, hold, fear, maze, stun, sleep, confusion, and level drain spells.
The enraged state lasts 3 rounds + 1 round per 2 points of newly modified Constitution above 10.
At the end of the rage, the character loses the rage modifiers and becomes fatigued (-2 penalty to Strength, -2 penalty to Dexterity) for the duration of 5 rounds.
```
– 17th level: Tireless Rage: Avenger is no longer fatigued after the rage ends.  

Disadvantages:  
– May not call for an animal companion.  
– May not use the Charm Animal ability.  
– May not spontaneously convert memorized spells to summoning ones.  

### SHAPESHIFTER
Advantages:  
– May shapeshift into the form of a werewolf once per day. Gains one use at level 1 and an additional use every 2 levels thereafter.  
– 15th level: shapeshifts into greater werewolf instead.  

Disadvantages:  
– May not call for an animal companion.  
– No other shapeshifting abilities due to the effort required in maintaining balance in her primary forms.  

### SPELLFUSED WARDEN (replaces TOTEMIC DRUID)
Advantages:  
– At 1st level spellfused warden chooses an arcane school and gets access to all its 1st to 7th level spells. These spells are cast as druidic ones and do not suffer from arcane spellcasting failure which may be induced by armor spellfused warden wears.   

Disadvantages:  
– Cannot use shapeshift.

### MAGE
CLASS FEATURES:  
– May not wear any armor.  
– May only use the following weapons: dagger, quarterstaff, dart, sling, crossbow.  
– Receives one bonus magic Feat at level 5, 10, 15, 20, 22 and 28.  
– May cast arcane spells.  
– Acquires 2 scrolls with any arcane spell up to maximum level she can cast at every level up starting from level 2.  
– Gains access to the following epic spells: Comet (at level 21), Energy Blades (at level 22), Dragon's Breath (at level 23) and Summon Planetar (at level 24).  
– Hit Die: d4  
– Low THAC0/APR progression, High Savingthrows vs. Spell

### THIEF
CLASS FEATURES:  
– May not wear armor heavier than studded leather.  
– May not equip shields larger than bucklers.  
– May only use the following weapons: long sword, short sword, katana, scimitar, dagger, club, quarterstaff, crossbow, shortbow, dart, sling.  
– Immune to sneak attack.    
– Has Evasion passive ability.  
```
EVASION: this passive ability allows the target of an area attack to leap or twist out of the way. If subjected to an attack that allows a Savingthrow vs. Breath Weapon or vs. Wand for half damage, a character with evasion takes no damage on a successful save.
```
– Receives one bonus feat at levels 4, 8, 12, 16, 20, 22, 25 and 28.  
– May distribute 20 points per level (30 at level 1) in thieving abilities: Open Locks, Pick Pockets, Find Traps, Move Silently, Hide In Shadows, Detect Illusion, Set Traps.  
– Starts with base scores of 10% in Open Locks, 5% in Find Traps, 15% in Pick Pockets, 10% in Move Silently, and 5% in Hide in Shadows.  
– May Sneak attack for increased damage: 1d6 at level 1 + 1d6 every 2 levels thereafter.  
– May use the Set Snare ability once per day. Gains one use at levels 1, 5, 10, 15 and 20.  
```
SET SNARE: Set a trap in the chosen location when no hostile creatures are in sight. Traps grow more powerful with the Thief's level and can only be triggered by enemies.
  1st level: Deals 2d8+5 missile damage.
  10th level: Deals 2d8+5 missile damage and additionally deals 2d6 poison damage per round for the next 3 rounds.
  15th level: Deals 3d8+5 missile damage and 4d8+2 fire damage.
  20st level: Deals 3d8+5 missile damage and 20 poison damage with no save; slays target if a Save vs. Death with a +4 bonus is failed.
```
– Can set Spike Trap once per day starting from level 21, gets an additional use at level 26.  
```
SET SPIKE TRAP:
This ability allows the rogue to set a powerful spring-loaded spike trap that does 20d6 damage to the unsuspecting creature that sets it off.
```
– Can set Exploding Trap once per day starting from level 23, gets an additional use at level 28.
```
SET EXPLODING TRAP
This ability allows the rogue to set a powerful trap that unleashes a fireball which causes 10d6 damage (Save vs. Spell with -5 penalty for half damage) and will knock its victims off their feet.
```
– Can set Time Trap once per day starting from level 25, gets an additional use at level 30.
```
SET TIME TRAP:
This ability allows the rogue to set a magical trap that casts a weaker version of the high-level Time Stop spell. For 10 seconds, the flow of time slows for all but the rogue. Often, a rogue will use this trap to get behind an opponent for a free attack.
```
– Alignment restricted to any except lawful good.  
– Hit Die: d6  
– Medium THAC0/APR progression, High Savingthrows vs. Breath Weapon and Wand

### ASSASSIN
Advantages:  
– Better Sneak attack progression: +1d6 damage bonus at every 6th level (in addition to trueclass thief sneak attack damage).  
– May use the Poison Weapon ability. Gains one use at level 1, then at level 4 and an additional use every 4 levels thereafter.  
```
POISON WEAPON:
Each successful hit within the next 5 rounds will inject poison into the target. Each target can only be affected once per round. The amount of poison damage depends on the character's level:

1st - Target suffers 1 poison damage per second for 6 seconds (Save vs. Death at +1 negates)
4th - Target suffers 1 poison damage per second for 12 seconds (Save vs. Death negates), and also immediately suffers 2 poison damage (no save)
8th - Target suffers 1 poison damage per second for 18 seconds (Save vs. Death at -1 negates), and also immediately suffers 4 poison damage (no save)
12th - Target suffers 1 poison damage per second for 24 seconds (Save vs. Death at -2 negates), and also immediately suffers 6 poison damage (no save)
16th - Target suffers 1 poison damage per second for 24 seconds (Save vs. Death at -3 negates), and also immediately suffers 9 poison damage (no save)
20th - Target suffers 1 poison damage per second for 24 seconds (Save vs. Death at -4 negates), and also immediately suffers 12 poison damage (no save)
24th - Target suffers 2 poison damage per second for 24 seconds (Save vs. Death at -5 negates), and also immediately suffers 16 poison damage (no save)
30th - Target suffers 2 poison damage per second for 24 seconds (Save vs. Death at -6 negates), and also immediately suffers 16 poison damage (no save)
```
– Starting from level 4 can cast a limited number of Spells (through Innate Abilities menu). Assassin does not need to memorize her spells in advance and can spontaneously cast any spell she knows.  
```
Assassin Spellbook:  
First level spells: starting from level 4 Assassin gets access to the following spells: Sleep, Blindness, Reflected Image, Chill Touch.  
Second level spells: starting from level 7 Assassin gets access to the following spells: Ghoul Touch, Glitterdust, Blur, Invisibility.  
Third level spells: starting from level 10 Assassin gets access to the following spells: Vampiric Touch, Non-Detection, Hold Person, Detect Illusions.	  
Fourth level spells: starting from level 13 Assassin gets access to the following spells: Improved Invisibility, Free Action, Poison, Cloak of Fear.  
```
Disadvantages:  
– Does not receive bonus feats at levels 4, 12, 20 and 25 as trueclass thieves do.   
– May only distribute 10 skill points per level among thieving skills (20 points at level 1)  

### SWASHBUCKLER
Advantages:  
– Hit Die: d8  
– May get up yo seven stars in any weapon category.  
– +1 bonus to Armor Class at 1st level, plus an additional +1 bonus every 5 levels.  
– High THAC0/APR progression.  
– Receives one Bonus Feat at levels 4, 8, 12, 16, 20, 22, 25 and 28.  
– At first level receives for free Combat Prowess(1):Weapon Finesse and Tactics(1):Insightful Strike feats.  
– At 8th level receives +1 to hit and damage bonus with all weapon categories, this bonus is increased to +2 at level 18 and +3 at level 24.   
– At 11th level Swashbuckler receives +1 bonus to all savingthrows.  
– At 14th level each critical hit of Swashbuckler reduces target's Strength by 2 points for 5 rounds (cumulatively).  
– At 19th level each critical hit of Swashbuckler additionally reduces target's Constitution by 2 points for 5 rounds (cumulatively).  

Disadvantages:  
– May not use Sneak attack.  
– May only distribute 15 skill points per level among thieving skills (25 points at level 1)  

### NINJA  (replaces BOUNTY HUNTER)
Advantages:  
– May use the Poison Weapon ability. Gains one use at level 1, then at level 5 and an additional use every 5 levels thereafter.  
– Gains +1 AC bonus at level 5 and every five levels thereafter.  
– Gains +1 AC bonus per 2 points of Wisdom above 10.  
– Ninja gains a pool of ki points equal to 1/2 of her level +1 per 2 points of Wisdom above 10. These points can be spent to use different ki powers and are replenished after rest.  
  Starting from level 1 ninja can spend one point from ki pool to become invisible for 10 seconds.  
  Starting from level 4 ninja can alternatively spend one point from ki pool to create 1d4 mirror images of herself or become blurred (+3 AC, +1 Saving throw bonus) for 10 seconds or detect invisible creatures.  
  Starting from level 7 ninja can alternatively spend one point from ki pool to become hasted for 10 seconds.  
  Starting from level 10 ninja can alternatively spend one point from ki pool to make all her attacks for next round stun opponents unless they make a Saving throw vs. Paralyze (with penalty equal to one quarter level of ninja rounded down).  
  Starting from level 13 ninja can alternatively spend one point from ki pool to heal 10 Hit Points to herself and neutralize any poison.  
  Starting from level 16 ninja can alternatively spend one point from ki pool to place herself under the effect of Improved Invisibility spell or use True Sight ability for 10 seconds.  
  Starting from level 19 ninja can alternatively spend one point from ki pool to place herself under the effect of Improved Haste spell for 10 seconds.  

Disadvantages:  
– May not wear any armor or use shields.   
– May only distribute 15 skill points per level among thieving skills (25 points at level 1).  
– Does not receive bonus feats at levels 4, 12, 20 and 25 as trueclass thieves do.   

### SHADOWDANCER
Advantages:  
– +10% bonus to Hide In Shadows and Move Silently.  
– Hide In Plain Sight: A Shadowdancer may hide in shadows even while being observed.  
– May cast Shadowstep once per day starting from level 4. Gains an additional use every 5 levels thereafter.  
```
SHADOWSTEP: Step into the Shadow Plane and move for 7 seconds while others are frozen in time. The Shadowdancer cannot attack or cast spells while in the Shadow Plane.
```
– May cast Shadowform once per day starting from level 7. Gains an additional use every 6 levels thereafter.
```
SHADOW FORM:
This ability temporarily transposes some of the user's tissue with shadow-material, making the subject partially incorporeal. For the next 5 rounds, all physical attacks directed against the Shadowdancer only deal 50% of their normal damage. During this time, the Shadowdancer is also under the effects of Improved Invisibility and cannot be directly targeted by spells.
```
– May cast Simulacrum once per day starting from level 10. Gains an additional use every 5 levels thereafter.  
– Slippery Mind: +1 bonus to Saving Throws vs. Spell.  
– May use Shadow Maze ability once per day starting from level 21. Gains an additional use at level 26.  
```
SHADOW MAZE:
This ability opens a temporary gateway to a small pocket within the Plane of Shadow. All enemies within 10 feet of the Shadowdancer must make a Save vs. Spell at a -5 penalty or become trapped inside a shadowy labyrinth as per the Maze spell.
```
Disadvantages:  
– Alignment restricted to any non-lawful.  
– Worse Sneak attack progression: 1d6 at level 1 + 1d6 every 3 levels thereafter.  
– May only distribute 15 skill points per level (25 at level 1) among thieving skills.  
– Does not receive bonus feats at levels 4, 12, 20 and 25 as trueclass thieves do.  
– May not use the Set Snare ability.  

### BARD
CLASS FEATURES:  
– May wear helmets.   
– May not wear armor heavier than splint mail.    
– May use nay shield (excluding large shield).  
– Receives one bonus Feat at levels 22 and 28.  
– Thieving abilities: Pick Pockets (15% at level 1, +5% at every next level).  
– Increased Lore score.  
– May cast arcane spells up to level 6.  
– At 1st level gets Armored Arcana: Light Armor Casting passive feat which removes chance of spell failure while casting spells in light armor. At level 6 receives Armored Arcana: Chain Mail Casting, and finally at level 12 Armored Arcana: Splint Mail Casting.  
- Acquires one scroll with any arcane spell up to maximum level she can cast at every level up starting from level 2.  
– Bardic Performance: a bard is trained to perform to create magical effects on those around her. Bard can use this ability for a number of times per day equal to 1 + 1 per 2 points of Charisma above 10. At each even level a bard can use bardic performance one more time per day.  
– Medium THAC0/APR progression, High Savingthrows vs. Breath Weapon vs. Wand, and vs. Spell

List of Bardic Performances:  
```
Inspire Courage  	
A 1st level bard can use her performance to inspire courage in her allies (including herself), bolstering them against fear and improving their combat abilities. To be affected, an ally must be able to perceive the bard’s performance. An affected ally receives a +1 bonus on attack and weapon damage rolls as well and becomes immune to fear and panic effects for 4 rounds. At 6th level, and every six levels thereafter, this bonus increases by +1, to a maximum of +6 at 30th level.  
```
```
Countersong  
At 1st level, a bard learns to counter magic effects that depend on sound. Any creature within 30 feet of the bard becomes Immune to the following spells: Silence 15', Command, Greater Command, Wail of Banshee.
```
```
Inspire Competence
A bard of 3rd level or higher can use her performance to help her ally succeed at a task. The allies must be within 30 feet and able to see and hear the bard. They get a +5% bonus to all their thieving skills for 4 rounds. This bonus increases by +5% at level 6 and every 6 levels thereafter to a maximum of 30% at level 30.
```
```
Fascinate
At 1st level, a bard can use her performance to cause one creature to become fascinated with her. Creature must be able to see and hear the bard, and capable of paying attention to him. The bard must also be able to see the creatures affected. If creatures fails saving throw vs. Spell the creature sits quietly and observes the performance for next 4 rounds. Any obvious threat, such as someone drawing a weapon, casting a spell, or aiming a weapon at the target, automatically breaks the effect.
Target creatures receives -1 penalty to Saving throws to resist Fascinate per 5 levels of the bard to a maximum of -6 at level 30.
At 8th level bard fascinates all creatures around her in 30ft radius instead.
```
```
Dirge of Doom
A bard of 8th level or higher can use her performance to foster a sense of growing dread in her enemies, causing them to become shaken and receive -2 penalty to their attack rolls, Armor Class and Saving throws. To be affected, an enemy must be within 30 feet and able to see and hear the bard’s performance. The effect persists for 4 rounds. There is no Saving throw against this ability.
```
```
Inspire Greatness
A bard of 9th level or higher can use her performance to inspire greatness in all her allies within 30 feet, granting extra fighting capability. To inspire greatness, all of the targets must be able to see and hear the bard. A creature inspired with greatness gains 10 bonus Hit Points and a +2 bonus on attack rolls and Saving Throws vs. Death for next 4 rounds. These bonuses increase to 15 Hit Points and +3 to THAC0 and Saving Throws vs. Death at level 12. Every 6 levels thereafter the bonus Hit Points increase by +5 and THAC0 and Saving Throws vs. Death bonus increases by 1.
```
```
Soothing Performance
A bard of 12th level or higher can use her performance to create an effect equivalent to the mass cure light wounds, using the bard’s level as the caster level.
```
```
Frightening Tune
A bard of 14th level or higher can use her performance to cause fear in her enemies. To be affected, an enemy must be able to hear the bard perform and be within 30 feet. Each enemy within range can make a Saving Throw vs. Spell with -4 penalty  (-5 at level 24, -6 at level 30) to negate the effect. If the Saving Throw fails, the target becomes panicked for next 4 rounds.
```
```
Inspire Heroics
A bard of 15th level or higher can inspire tremendous heroism in all her allies within 30 feet. To inspire heroics, all of the targets must be able to see and hear the bard. Inspired creatures gain a +4 bonus on Saving Throws and a +4 bonus to AC. The effect lasts for 4 rounds. The bonuses increase to +5 at level 24, and +6 at level 30.
```
```
Deadly Performance
A bard of 20th level or higher can use her performance to cause one enemy to die from joy or sorrow. To be affected, the target must be able to see and hear the bard perform and be within 30 feet. The target can make a Saving Throw vs. Spell with -4 penalty (-5 at level 25, and -6 at level 30) to negate the effect. If a creature’s Saving Throw succeeds, the target is paralyzed for 2 rounds. If a creature’s Saving Throw fails, it dies.

```
```
Song of Requiem
A bard of 24th level or higher can use this epic performance drains the very life force of the bard's enemies causing them to suffer 1 point of damage per 2 levels of bard per round for next 4 rounds.
```
– Alignment restricted to any neutral.  
– Hit Die: d6

### BLADE
Advantages:  
– May use the Battle Dance ability once per day. Gains one use at level 2  and an additional use every 4 levels thereafter.  
```
Battle Dance:
A blade is trained to use her performance to improve <PRO_HISHER> battle skills. A blade can enter either offensive or defensive spin.

Offensive Spin: During the next 4 rounds, the Blade's movement rate doubles and she gains a +2 bonus to hit and damage rolls as well as an extra attack per round. All attacks deal maximum damage for the duration. Offensive Spin may not be used in conjunction with the Haste or Improved Haste spells.

Defensive: During the next 4 rounds, the Blade is rooted to the spot and gains a +1 bonus to Armor Class per 2 levels, up to a maximum of +10.
```
– Bardic Performance: a blade is trained to perform to create magical effects on those around her. Blade can use this ability for a number of times per day equal to 1 + 1 per 2 points of Charisma above 10. At each fourth level a blade can use bardic performance one more time per day.  
List of Bardic Performances:  
Inspire Courage (staring from level 1)  
Inspire Greatness (starting from level 9)  
Soothing Performance (starting from level 12)  
Inspire Heroics (starting from level 15)  
Song of Requiem (starting from level 24)  

Disadvantages:  
– Smaller variety of available Bardic performance types and less uses per day.  
– Receives only half of Lore bonus per level.  

### SKALD
Advantages:  
– Gains 5% resistance to crushing, slashing, piercing, and missile damage at level 9 and every 5 levels thereafter to a maximum of 25% at level 29.  
– Can use Rage (starts with one use at level 2 then gets another every 4 levels thereafter), though Skald never gets benefits of Greater or Mighty Rage.  
```
RAGE: The character is enraged  which grants her a +4 bonus to Strength and Constitution, a -2 penalty to Armor Class, and a +2 bonus to Saving Throws vs. Spell, as well as immunity to all charm, hold, fear, maze, stun, sleep, confusion, and level drain spells.
The enraged state lasts 3 rounds + 1 round per 2 points of newly modified Constitution above 10.
At the end of the rage, the character loses the rage modifiers and becomes fatigued (-2 penalty to Strength, -2 penalty to Dexterity) for the duration of 5 rounds.
```
– 17th level: Tireless Rage: Skald is no longer fatigued after the rage ends.  
– Bardic Performance: a skald is trained to perform to create magical effects on those around her. Skald can use this ability for a number of times per day equal to 1 + 1 per 2 points of Charisma above 10. At each fourth level a skald can use bardic performance one more time per day.  
List of Bardic Performances:  
Inspire Courage (staring from level 1)  
Inspire Greatness (starting from level 9)  
Soothing Performance (starting from level 12)  
Inspire Heroics (starting from level 15)  
Song of Requiem (starting from level 24)  

– Hit Die: d8  
Disadvantages:  
– Smaller variety of available Bardic performance types and less uses per day.

### JESTER
Advantages:  
– May use the Poison Weapon ability. Gains one use at level 2, and an additional use every 4 levels thereafter.  
– Laugh It Off: Fate protects fools and little children, and Jesters certainly adopt the role of fools. Jester receives a bonus to all her saves per 2 points of CHARISMA above 9 (but also suffers a penalty per 2 points below 10).  
– May Sneak attack for increased damage: 1d6 at level 3 + 1d6 every 4 levels thereafter.  
– Bardic Performance: a jester is trained to perform to create magical effects on those around her. Jester can use this ability for a number of times per day equal to 1 + 1 per 2 points of Charisma above 10. At each fourth level a jester can use bardic performance one more time per day.  

List of Bardic Performances:  
Jester's Song (starting from level 1)
```
Jester's Song
The jester is the master of the verbal put down, the hilarious joke, or the savage verbal lashing. Starting from level 1 her words can inspire dread and outrage in her enemies making them confused for next 4 rounds. The target creatures receive a Saving Throw vs. Spell with +2 bonus to avoid this effect.
At level 5 the enemies no longer receive a bonus to their Saving Throws.
At level 10 they receive a -2 penalty instead, which increases further to -3 at level 15, -4 at level 20, -5 at level 25 and -6 at level 30.
```
Fascinate (starting from level 1)  
Dirge of Doom (starting from level 8)  
Frightening Tune (starting from level 14)  
Song of Requiem (starting from level 24)  

Disadvantages:  
– Smaller variety of available Bardic performance types and less uses per day.  
– May only use weapons a wizard can (daggers, quarterstaves, darts, slings, crossbows).  
– May only wear light armor and use bucklers.    

### SORCERER
CLASS FEATURES:  
– May not wear any armor.  
– May only use the following weapons: dagger, quarterstaff, dart, sling, crossbow.  
– May cast arcane spells.  
– Receives one bonus magic Feat at level 5, 10, 15, 20, 22 and 28.  
– May not scribe spells into their spellbooks as Mages do. Instead, Sorcerers learn a small number of spells at each level, which they can cast daily without memorization.  
– At 1st level chooses a bloodline which grants access to 9 spells (1 per spell level) in addition to those gained normally.  
– Gains access to the following epic spells: Comet (at level 21), Energy Blades (at level 22), Dragon's Breath (at level 23) and Summon Planetar (at level 24).  
– Hit Die: d4  
– Low THAC0/APR progression, High Savingthrows vs. Spell

### BATTLE CASTER (replaces DRAGON DISCIPLE)
Advantages:  
– May wear light armor.  
– May equip bucklers.
– Receives one bonus Feat at level 5, 10, 15, 20, 22 and 28 (can choose any feat, not only magic ones)  
– May use the following weapons: long sword, short sword, katana, scimitar, dagger, club, quarterstaff, crossbow, shortbow, dart, sling.    
– At first level gets Armored Arcana: Light Armor Casting passive feat which removes chance of spell failure while casting spells in light armor.  
– Hit Die: d6  
– Medium THAC0/APR progression, High Savingthrows vs. Death and vs. Polymorph  

Disadvantages:  
– Does not gain access to epic spells.  
– May not choose bloodline and thus may not receive bonus bloodline spells.   
– May cast one fewer spell per level per day.  


### MONK
CLASS FEATURES:  
– May not wear any armor or use shields.  
– May only use weapons available to the Thief class.  
– Has Evasion passive ability.  
```
EVASION: this passive ability allows the target of an area attack to leap or twist out of the way. If subjected to an attack that allows a Savingthrow vs. Breath Weapon or vs. Wand for half damage, a character with evasion takes no damage on a successful save.
```
– May put stars in any fighting style except sword and shield and archery.  
– Moves 2 points faster than other characters. Movement rate further improves by 1 every 5 levels.  
– Gains Flurry of Blows modal ability.  
```
FLURRY OF BLOWS: A monk may strike with a flurry of blows at the expense of accuracy. When doing so, she may make one extra attack per round, but all attacks take a -2 penalty. When a monk reaches 5th level, the penalty lessens to -1, and at 9th level it disappears, thus ability becomes permanently activated.
When a monk reaches 11th level, her flurry of blows ability improves. In addition to the standard single extra attack she gets from flurry of blows, she gets another one without any penalties.
When using flurry of blows, a monk may attack only with unarmed strikes, with dagger(s) or quarterstaff.  
```
– Damage dealt by unarmed attacks increases with level as follows:  
  Level 1-3: 1d6  
  Level 4-7: 1d8  
  Level 8-11: 1d10  
  Level 12-15: 2d6  
  Level 16-19: 2d8  
  Level 20-23: 2d10  
  Level 24-27: 3d8  
  Level 28+: 3d10  
– At level 4, unarmed attacks are treated as a +1 magical weapon, monk also receives +1 bonus on unarmed to hit rolls. The enchantment and to hit bonus improve to +2 at level 8, +3 at level 12, +4 at level 16,  +5 at level 20 and +6 at level 28.     
– Gains +1 AC bonus at level 5 and every five levels thereafter.  
– Gains +1 AC bonus per 2 points of Wisdom above 10.  
– May use the Stunning Blow ability once per day. Gains one use at level 1 and an additional use every 2 levels thereafter.  
```
STUNNING BLOW: All successful attacks within the next round force the victim to save vs. Paralyze (with penalty equal to one quarter of monk level rounded down) or be stunned. This special ability automatically modifies normal attacks; no targeting needs to be done.
```
– 5th level: Becomes immune to all diseases and cannot be slowed or hasted.  
– 7th level: May use the Lay On Hands ability on herself to heal 2 Hit Points per level.  
– 8th level: Gains a -1 bonus to Speed Factor.  
– 9th level: Becomes immune to charm.  
– 11th level: Becomes immune to poison.  
– 12th level: Gains another -1 bonus to Speed Factor.  
– 13th level: May use the Quivering Palm ability once per day.  
```
QUIVERING PALM: The next successful attack forces the opponent to save vs. Death (with penalty equal to one quarter of monk level rounded down) or die. This special ability automatically modifies normal attacks; no targeting needs to be done.
```
– 14th level: Gains 3% Magic Resistance per level (starting with 42% at 14th level).  
– 20th level: Becomes immune to non-magical weapons.  
– Thieving abilities: Move Silently, Hide In Shadows, Find Traps (but not disarm) and Detect Illusion. Monks can distribute 10 skill points per level (20 points at level 1).  
– Gets one bonus feat at levels 22 and 28.  
– Alignment restricted to lawful.  
– Hit Die: d8   
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph, vs. Breath Weapon, vs. Wand and vs. Spell

### DARK MOON MONK
Advantages:  
– +10% to Detect Illusion.  
– May use the Frozen Fist ability once per day. Gains one use at level 1, then at level 4 and an additional use every 4 levels thereafter.  
```
FROZEN FIST: When this ability is activated, the Dark Moon Monk's fists are wreathed in a frosty shell. For 1 turn, the Dark Moon Monk's unarmed attacks deal an additional 2 points of cold damage on each successful hit.
```
– 1st level: May cast Blindness once per day, gains an additional use at level 11.  
– 3rd level: May cast Blur once per day, gains an additional use at level 13.  
– 7th level: May cast Vampiric Touch once per day, gains an additional use at level 17.  
– 11th level: May cast Mirror Image once per day, gains an additional use at level 21.  

Disadvantages:  
– Alignment restricted to lawful evil.  
– May not use the Lay On Hands ability.  
– May not use the Stunning Blow ability.  

### SUN SOUL MONK
Advantages:  
– 2nd level: May cast Sun Soulray once per day.  
```
SUN SOULRAY: The Sun Soul Monk projects a blast of light from her open palm, dealing 1d8 fire damage for every 2 caster levels (up to a maximum of 5d8 damage) to a single target. Undead creature receive 1d8 damage per monk level instead.
```
– 5th level: May cast Flaming Fists once per day.  
```
FLAMING FISTS: The Sun Soul Monk channels her inner light into her unarmed attacks, turning her fists into flaming weapons that deal an additional 2d6 fire damage per hit for the next round. The duration increases to 2 rounds at level 9, 3 rounds at level 12, 4 rounds at level 15, and 5 rounds at level 25. This special ability automatically modifies normal attacks; no weapon-switching needs to be done.
```
– 6th level: Gains an additional use of Sun Soulray.  
– 8th level: May cast Greater Sun once per day.  
```
GREATER SUN: The Sun Soul Monk wreathes herself in flames that act as a Fireshield (Red), granting the Monk 50% Fire Resistance and protecting her from attacks made within a 5-ft. radius. An opponent that hits the Monk with any weapons or spells within this radius suffers 1d8+2 points of fire damage.
```
– 10th level: Gains an additional use of Sun Soulray.  
– 13th level: May cast Soul Sunbeam once per day.  
```
SUN SOULBEAM: The character emits a dazzling burst of light that strikes at all hostile creatures within a 30-ft. radius. The Sun Soulbeam does not automatically hit all targets, but makes a melee attack using the character's current THAC0 (+3 to hit vs. undead). Struck creatures suffer 1d4 points of fire damage per monk level, unless they save vs. Spell for half with penalty equal to one fourth of monk level rounded down. In addition, all targets must save vs. Spell or be blinded for 2 hours.
```
– 15th level: Gains additional uses of Sun Soulray and Flaming Fists.    
– 25th level: Gains an additional use of Flaming Fists.  

Disadvantages:  
– Alignment restricted to lawful good.  
– May not use Stunning Blow ability.  
– May not use Quivering Palm ability.  

### SHAMAN
CLASS FEATURES:  
– May only wear leather, studded leather, and hide armor.  
– May not equip shields larger than bucklers.  
– May only use the following weapons: dagger, club, spear, axe, quarterstaff, dart, sling, and shortbow.  
– May cast druidic spells.  
– Does not automatically learn all spells of a given level as Druids do. Instead, Shamans select new spells to learn at each level, which they can cast daily without memorization.  
– Gains immediate access to a number of Shaman-specific spells, which can be cast like any other: Spirit Ward, Writhing Fog, Spiritual Clarity, Spirit Fire, Recall Spirit, Spiritual Lock, and Ether Gate.  
– Gains use of the Detect Illusion skill with 20% points as a base and an 4 points per level, up to a maximum of 100% at level 20.  
– May use Summon Spirit innate ability number of times per day equal to 1 + 1 per 2 points of Charisma above 10. Gets an additional use at every even level.  
```
SUMMON SPIRIT: The Shaman calls on a special spirit to aid <PRO_HIMHER> for 5 rounds + 1 round per 2 points of Charisma above 10.
The spirit grow in power as the Shaman gains additional levels:
  Level 1: Minor animal spirits (snake, fox, hound).
  Level 6: Major animal spirits (bear, panther, boar).
  Level 12: Minor nature spirits (lesser air spirit, lesser earth spirit, lesser fire spirit).
  Level 18: Major nature spirits (air spirit, earth spirit, fire spirit)
  Level 24: Greater nature spirits (greater air spirit, greater earth spirit, greater fire spirit).
Spirit will do its best to protect the Shaman but is not controlled directly.
```
– Gains access to the following epic spells: Elemental Summoning (at level 19), Aura of Flaming Death (at level 20), Storm of Vengeance (at level 21), Energy Blades (at level 22), Greater Elemental Summoning (at level 23) and Ethereal Retribution (at level 24).  
– Gets one bonus feat at levels 22 and 28.  
– Alignment restricted to neutral good, true neutral, and neutral evil.  
– Ineligible for any stronghold. (This affects only the Shadows of Amn campaign in Baldur's Gate II: Enhanced Edition.)  
– Hit Die: d8  
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph and vs. Spell

### FIGHTER/THIEF
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon.  
– Immune to sneak attack.    
– Has Evasion passive ability.  
```
EVASION: this passive ability allows the target of an area attack to leap or twist out of the way. If subjected to an attack that allows a Savingthrow vs. Breath Weapon or vs. Wand for half damage, a character with evasion takes no damage on a successful save.
```
– May get up to Greater Weapon Specialization (4 stars) in any weapon they can use.  
– May distribute 15 skill points per level among thieving skills (25 points at level 1).  
– Gets one bonus feat at level 1 and every 3 levels thereafter.  
– May Sneak attack for increased damage: 1d6 at level 3 + 1d6 every 4 levels thereafter.  
– At 4th level gets Armor Training which increases max dexterity AC bonus from any armor by 1 and reduces penalty to thieving skills by 10%. Max dexterity AC bonus is further increased by 1 at and skill penalties are reduced by 10% every 4 levels thereafter (up to a maximum of +4 increase in max AC bonus and -40% decrease of thieving skill penalty at level 16).  
– Starting from level 5 every hit of Fighter/Thief has 5% + 1% per level chance to slow the target for 1d4 rounds.
– Starting from level 10 every hit of Fighter/Thief has additional 5% + 1% per level chance to blind the target for 1d4 rounds.
– Starting from level 15 every hit of Fighter/Thief has additional 5% + 1% per level chance to make the target Sickened for 1d4 rounds (-2 to THAC0, Damage and all Savingthorws).  
– Hit Die: d8  
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph, vs. Breath Weapon and vs. Wand

### FIGHTER/CLERIC
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon and shield (excluding large shield).  
– May get up to Greater Weapon Specialization (4 stars) in any weapon they can use.  
– Can cast two spell per day less than trueclass cleric.  
– At 4th level gets Armor Training which increases max dexterity AC bonus from any armor by 1. Max dexterity AC bonus is further increased by 1 every 4 levels thereafter (up to a maximum of +4 at level 16).  
– Gets one bonus combat feat at every 4th level up to level 20.  
– Gets one bonus feat at levels 22, 25 and 28.  
– May channel positive (good and neutral clerics) or negative (evil clerics) energy starting from level 2 number of times per day equal to 3 + 1 per 2 points of Charisma above 10. (1d6 damage/healing at level 2 plus 1d6 per 4 levels).  
– Can use Spontaneous Battlecasting.  
```
SPONTANEOUS BATTLE CASTING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into her weapon(s) and armor to get +1 on to hit and damage rolls per 2 levels of sacrificed spell rounded up and +1 AC bonus per 2 levels of sacrificed spell rounded down for 3 rounds. Ability lasts for 1 round, or until the first spell is sacrificed.
```
– At 1st level chooses one domain that grants her access to additional spells and abilities, normally not available to Clerics of other domains.  
– Hit Die: d9  
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph and vs. Spell

### FIGHTER/MAGE
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon and shield (excluding large shield).  
– May get up to Greater Weapon Specialization (4 stars) in any weapon they can use.     
– Cannot cast spells of 8th and 9th levels.  
– Gets one bonus feat at every 4th level up to level 20.  
– Gets one bonus feat at levels 22, 25 and 28.  
– At 1st level gets Armored Arcana: Light Armor Casting passive feat which removes chance of spell failure while casting spells in light armor. At level 4 receives Armored Arcana: Chain Mail Casting, at level 8 Armored Arcana: Splint Mail Casting, at level 12 Armored Arcana: Plate Mail Casting and finally at level 16 Armored Arcana: Full Plate Mail Casting.  
- Acquires one scroll with any arcane spell up to maximum level she can cast at every level up starting from level 2.  
– Can use Spontaneous Battlecasting.  
```
SPONTANEOUS BATTLE CASTING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into her weapon(s) and armor to get +1 on to hit and damage rolls per 2 levels of sacrificed spell rounded up and +1 AC bonus per 2 levels of sacrificed spell rounded down for 3 rounds. Ability lasts for 1 round, or until the first spell is sacrificed.
```
– Can use Resist Magic once per day starting from level 23, gains an additional use at level 28.
```
RESIST MAGIC:
This ability allows the warrior to temporarily tap a great inner strength and fight off the effects of malevolent magic. For 4 rounds, the warrior's Magic Resistance is set to 50%. This is not cumulative with other forms of Magic Resistance, so if the warrior already has 50% Magic Resistance or greater, the ability is useless.
```
– Hit Die: d7  
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph and vs. Spell  

NOTE: Gnomes can choose this class, but become Fighter/Illusionists by default. Gnomes are the only race that can combine a specialist Mage class in a hybrid class.  

### FIGHTER/DRUID
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor a druid can and use any weapon and shield (excluding large shield).   
– Can cast two spell per day less than trueclass druid.  
– Gets one bonus combat feat at every 4th level up to level 20.  
– May spontaneously convert memorized spells to summoning ones.  
– May select one racial enemy at levels 1, 10, 20 and 30 which grants a +2 bonus on to hit and damage rolls against the selected enemy race. These bonuses increase by 1 at every 10th level.  
– May call for an animal companion who fights for her side.  
– Starting from level 21 may call for epic animal companion who in addition receives 20% magic and elemental damage resistance, immunity to all mind-effecting spells and attacks as if with +4 weapon.  
– Gets one bonus feat at levels 22, 25 and 28.  
– Hit Die: d9  
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph and vs. Spell


### CLERIC/RANGER
CLASS FEATURES:	  
– May wear helmets.  
– May use any weapon and shield (excluding large shield).  
– May not wear armor heavier than splint mail.  
– Gets one bonus combat style feat at levels 2, 10, 18 and 26.    
– Has Evasion passive ability.  
```
EVASION: this passive ability allows the target of an area attack to leap or twist out of the way. If subjected to an attack that allows a Savingthrow vs. Breath Weapon or vs. Wand for half damage, a character with evasion takes no damage on a successful save.
```
– May select one racial enemy at levels 1, 10, 20 and 30 which grants a +2 bonus on to hit and damage rolls against the selected enemy race. These bonuses increase by 1 at every 10th level.  
– May use the Charm Animal ability once per day. Gains one use at level 1 and an additional use every 2 levels thereafter.  
– May use the Hide In Shadows ability.  
– Can cast two spells per day less than trueclass clerics.  
– Can spontaneously convert memorized spells into healing ones.  
– May channel positive energy starting from level 2 number of times per day equal to 3 + 1 per 2 points of Charisma above 10. (1d6 damage/healing at level 2 plus 1d6 per 4 levels).  
– Eventually can cast low level druidic spells (same as trueclass ranger).  
– At 1st level chooses one domain that grants her access to additional spells and abilities, normally not available to Clerics of other domains.  
– May call for an animal companion who fights for her side.  
– Starting from level 21 may call for epic animal companion who in addition receives 20% magic and elemental damage résistance, immunity to all mind-effecting spells and attacks as if with +4 weapon.  
– Gets one bonus feat at level 28.  
– Alignment restricted to good.  
– Hit Die: d9  
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph, vs. Breath Weapon, vs. Wand and vs. Spell

### CLERIC/MAGE
CLASS FEATURES:  
– May not wear any armor or use shield.  
– May only use the following weapons: dagger, quarterstaff, dart, sling, crossbow, mace, flail, morning star, war hammer.  
– May cast both arcane and divine cleric spells.  	  
– Can cast two arcane spells per day less than trueclass mage.  
– Can cast three divine spells per day less than trueclass cleric.  
– At 1st level chooses one domain that grants her access to additional spells and abilities, normally not available to Clerics of other domains.  
– May channel positive (good and neutral clerics) or negative (evil clerics) energy starting from level 2 number of times per day equal to 3 + 1 per 2 points of Charisma above 10. (1d6 damage/healing at level 2 plus 1d6 per 4 levels).  
– May spontaneously convert memorized spells to healing ones (Good and Neutral Clerics) or harming ones (Evil Clerics).  
- Acquires 2 scrolls with any arcane spell up to maximum level she can cast at every level up starting from level 2.  
– Versatile Spellcasting: starting from level 7 can trade one first level cleric spell slot for a second level wizard spell slot, this exchange is reversible; every two levels thereafter can trade next level cleric spell slot for a wizard spell slot one level higher.  
– Gets one bonus feat at levels 22, 25 and 28.  
– Hit Die: d6  
– Low THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph and vs. Spell

NOTE: Gnomes can choose this hybrid class, but become Cleric/Illusionists by default. Gnomes are the only race that can combine a specialist Mage class in a hybrid class.  

### CLERIC/THIEF
CLASS FEATURES:  
– May wear helmets.  
– May not wear armor heavier than splint mail.  
– May not equip shields larger than bucklers.  
– May only use the following weapons: long sword, short sword, katana, scimitar, dagger, club, quarterstaff, crossbow, shortbow, dart, sling, mace, flail, morning star, war hammer.  	  
– Immune to sneak attack.    
– Has Evasion passive ability.  
```
EVASION: this passive ability allows the target of an area attack to leap or twist out of the way. If subjected to an attack that allows a Savingthrow vs. Breath Weapon or vs. Wand for half damage, a character with evasion takes no damage on a successful save.
```
– Can cast two spell per day less than trueclass clerics.  
– May distribute 10 skill points per level among thieving skills (20 points at level 1).  
– May Sneak attack for increased damage: 1d6 at level 3 + 1d6 every 4 levels thereafter.  
– May use the Set Snare ability once per day. Gains one use at levels 1, 5, 10, 15 and 20.  
– May channel positive (good and neutral clerics) or negative (evil clerics) energy starting from level 2 number of times per day equal to 3 + 1 per 2 points of Charisma above 10. (1d6 damage/healing at level 2 plus 1d6 per 4 levels).  
– May use Spontaneous Spell Channeling
```
SPONTANEOUS SPELL CHANNELING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into her weapon(s) to add number of 1d4 dice equal to level of sacrificed spell to her sneak attack damage for next 3 rounds.
```
– At 1st level chooses one domain that grants her access to additional spells and abilities, normally not available to Clerics of other domains.  
– Gets one bonus feat at levels 10, 20, 22, 25 and 28.  
– Hit Die: d7  
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph, vs. Breath Weapon, vs. Wand and vs. Spell

### MAGE/THIEF
CLASS FEATURES:  
– May not wear armor heavier than studded leather.  
– May not equip shields larger than bucklers.  
– May only use the following weapons: long sword, short sword, katana, scimitar, dagger, club, quarterstaff, crossbow, shortbow, dart, sling.   
– Can cast one arcane spell per day less than trueclass mage.   
– May distribute 10 skill points per level among thieving skills (20 points at level 1).  
– May Sneak attack for increased damage: 1d6 at level 3 + 1d6 every 4 levels thereafter.  
– Starting from level 8 can cast spells in complete silence (as being always under constant effect of Vocalize).
– May use the Set Snare ability once per day. Gains one use at levels 1, 5, 10, 15 and 20.  
- Acquires two scrolls with any arcane spell up to maximum level she can cast at every level up starting from level 2.  
– Gets one bonus feat at levels 10, 20, 22, 25 and 28.  
– Hit Die: d5  
– Low THAC0/APR progression, High Savingthrows vs. Breath Weapon, vs. Wand and vs. Spell  
NOTE: Gnomes can choose this hybrid class, but become Illusionist/Thieves by default. Gnomes are the only race that can combine a specialist Mage class in a hybrid class.

### FIGHTER/MAGE/THIEF
CLASS FEATURES:  
– May wear helmets.  
– May not wear armor heavier than splint mail.  
– May not equip shields larger than bucklers.  
– May use any weapon.   
– Immune to sneak attack.    
– Has Evasion passive ability.  
```
EVASION: this passive ability allows the target of an area attack to leap or twist out of the way. If subjected to an attack that allows a Savingthrow vs. Breath Weapon or vs. Wand for half damage, a character with evasion takes no damage on a successful save.
```
– May get up to Weapon Specialization (2 stars) in any weapon they can use.  
– Can cast one spell less per day than trueclass mage.  
– Cannot cast spells of 8th and 9th levels.  
– May distribute 10 skill points per level among thieving skills (20 points at level 1).  
– May Sneak attack for increased damage: 1d6 at level 3 + 1d6 every 4 levels thereafter.   
– May use the Set Snare ability once per day. Gains one use at levels 1, 5, 10, 15 and 20.  
– Acquires one scroll with any arcane spell up to maximum level she can cast at every level up starting from level 2.  
– May use Spontaneous Spell Channeling
```
SPONTANEOUS SPELL CHANNELING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into her weapon(s) to add number of 1d4 dice equal to level of sacrificed spell to her sneak attack damage for next 3 seconds.
```
– May use Spontaneous Battlecasting
```
SPONTANEOUS BATTLE CASTING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into her weapon(s) and armor to get +1 on to hit and damage rolls per 2 levels of sacrificed spell rounded up and +1 AC bonus per 2 levels of sacrificed spell rounded down for 3 rounds. Ability lasts for 1 round, or until the first spell is sacrificed.
```
– Gets one bonus feat at levels 8, 14, 20, 22, 25 and 28.  
– At 1st level gets Armored Arcana: Light Armor Casting passive feat which removes chance of spell failure while casting spells in light armor. At level 6 receives Armored Arcana: Chain Mail Casting, and finally at level 12 Armored Arcana: Splint Mail Casting.  
– Hit Die: d6  
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph vs. Breath Weapon, vs. Wand and vs. Spell  
NOTE: Gnomes can choose this class, but become Fighter/Illusionist/Thieves by default. Gnomes are the only race that can combine a specialist Mage class in a hybrid class.

### FIGHTER/MAGE/CLERIC
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon and shield (excluding large shield).  
– May get up to Weapon Specialization (2 stars) in any weapon they can use.  
– Can cast two arcane spells less per day than trueclass mage.  
– Cannot cast arcane spells of 8th and 9th levels.  
– Can cast three divine spells less per day than trueclass cleric.  
– Cannot cast divine spells of 6th and 7th levels.    
– Acquires one scroll with any arcane spell up to maximum level she can cast at every level up starting from level 2.  
– Versatile Spellcasting: starting from level 7 can trade one first level cleric spell slot for a second level wizard spell slot, this exchange is reversible; every three levels thereafter can trade next level cleric spell slot for a wizard spell slot one level higher.  
– Gets one bonus feat at levels 10, 20, 22, 25 and 28.  
– May channel positive (good and neutral clerics) or negative (evil clerics) energy starting from level 2 number of times per day equal to 3 + 1 per 2 points of Charisma above 10. (1d6 damage/healing at level 2 plus 1d6 per 4 levels thereafter).  
– At 1st level gets Armored Arcana: Light Armor Casting passive feat which removes chance of spell failure while casting arcane spells in light armor. At level 4 receives Armored Arcana: Chain Mail Casting, at level 8 Armored Arcana: Splint Mail Casting, at level 12 Armored Arcana: Plate Mail Casting and finally at level 16 Armored Arcana: Full Plate Mail Casting.  
– Can use Spontaneous Battlecasting.
```
SPONTANEOUS BATTLE CASTING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into her weapon(s) and armor to get +1 on to hit and damage rolls per 2 levels of sacrificed spell rounded up and +1 AC bonus per 2 levels of sacrificed spell rounded down for 3 rounds. Ability lasts for 1 round, or until the first spell is sacrificed.
```
– At 1st level chooses one domain that grants her access to additional spells and abilities, normally not available to Clerics of other domains.  
– Hit Die: d7  
– Medium THAC0/APR progression, High Savingthrows vs. Death, vs. Polymorph vs. Breath Weapon, vs. Wand and vs. Spell  
NOTE: Gnomes can choose this class, but become Fighter/Illusionist/Clerics by default. Gnomes are the only race that can combine a specialist Mage class in a hybrid class.

### Saving throw progression per level

Lvl| High | Low |
--- | --- | ---
1| 12 | 14
2| 11 | 14
3| 11 | 13
4| 10 | 13
5| 10 | 13
6|  9 | 12
7|  9 | 12
8|  8 | 12
9|  8 | 11
10| 7 | 11
11| 7 | 11
12| 6 | 10
13| 6 | 10
14| 5 | 10
15| 5 |  9
16| 4 |  9
17| 4 |  9
18| 3 |  8
19| 3 |  8
20| 2 |  8

### THACO/bonus APR progression per level

Lvl| High | Medium | Low |
--- | --- | --- | ---
1| 19 /+0  | 20 /+0  | 20 /+0
2| 18 /+0  | 19 /+0  | 19 /+0
3| 17 /+0  | 18 /+0  | 19 /+0
4| 16 /+0  | 17 /+0  | 18 /+0
5| 15 /+0  | 17 /+0  | 18 /+0
6| 14 /+0.5| 16 /+0  | 17 /+0
7| 13 /+0.5| 15 /+0  | 17 /+0
8| 12 /+0.5| 14 /+0.5| 16 /+0
9| 11 /+0.5| 14 /+0.5| 16 /+0
10|10 /+0.5| 13 /+0.5| 15 /+0
11| 9 /+1  | 12 /+0.5| 15 /+0
12| 8 /+1  | 11 /+0.5| 14 /+0.5
13| 7 /+1  | 11 /+0.5| 14 /+0.5
14| 6 /+1  | 10 /+0.5| 13 /+0.5
15| 5 /+1  |  9 /+1  | 13 /+0.5
16| 4 /+1.5|  8 /+1  | 12 /+0.5
17| 3 /+1.5|  8 /+1  | 12 /+0.5
18| 2 /+1.5|  7 /+1  | 11 /+0.5
19| 1 /+1.5|  6 /+1  | 11 /+0.5
20| 0 /+1.5|  5 /+1  | 10 /+0.5

### Sneak Attack Progression per level (number of d6 dices)

Lvl| Thief, Ninja | Assassin | Shadowdancer | Jester, Multiclass Thieves|
---| --- | --- | --- | ---
1  |  1  |  1  |  1  |  0
2  |  1  |  1  |  1  |  0
3  |  2  |  2  |  1  |  1
4  |  2  |  2  |  2  |  1
5  |  3  |  3  |  2  |  1
6  |  3  |  4  |  2  |  1
7  |  4  |  5  |  3  |  2
8  |  4  |  5  |  3  |  2
9  |  5  |  6  |  3  |  2
10 |  5  |  6  |  4  |  2
11 |  6  |  7  |  4  |  3
12 |  6  |  8  |  4  |  3
13 |  7  |  9  |  5  |  3
14 |  7  |  9  |  5  |  3
15 |  8  |  10 |  5  |  4
16 |  8  |  10 |  6  |  4
17 |  9  |  11 |  6  |  4
18 |  9  |  12 |  6  |  4
19 |  10 |  13 |  7  |  5
20 |  10 |  13 |  7  |  5
21 |  11 |  14 |  7  |  5
22 |  11 |  14 |  8  |  5
23 |  12 |  15 |  8  |  6
24 |  12 |  16 |  8  |  6
25 |  13 |  17 |  9  |  6
26 |  13 |  17 |  9  |  6
27 |  14 |  18 |  9  |  7
28 |  14 |  18 | 10  |  7
29 |  15 |  19 | 10  |  7
30 |  15 |  20 | 10  |  7



### Hexblade, Paladin, Ranger and Assassin spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 |
--- | --- | --- | --- |---
4| 1|0|0|0
5| 1|0|0|0
6| 1|0|0|0
7 |1|1|0|0
8 |2|1|0|0
9 |2|1|0|0
10|2|1|1|0
11|2|2|1|0
12|3|2|1|0
13|3|2|1|1
14|3|2|2|1
15|3|3|2|1
16|4|3|2|1
17|4|3|2|2
18|4|3|3|2
19|4|4|3|2
20|4|4|3|3

### Bard spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 |
--- | --- | --- | --- |--- |--- |---
1| 1|0|0|0|0|0
2| 2|0|0|0|0|0
3| 2|0|0|0|0|0
4| 3|1|0|0|0|0
5| 3|2|0|0|0|0
6| 3|2|0|0|0|0
7| 4|3|1|0|0|0
8| 4|3|2|0|0|0
9| 4|3|2|0|0|0
10|4|4|3|1|0|0
11|4|4|3|2|0|0
12|4|4|3|2|0|0
13|4|4|4|3|1|0
14|4|4|4|3|2|0
15|4|4|4|3|2|0
16|4|4|4|4|3|1
17|4|4|4|4|3|2
18|4|4|4|4|3|2
19|4|4|4|4|4|3
20|4|4|4|4|4|4



### Cleric and Druid spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
--- | --- | --- | --- |--- |--- |--- |---
1| 1|0|0|0|0|0|0
2| 2|0|0|0|0|0|0
3| 2|1|0|0|0|0|0
4| 3|2|0|0|0|0|0
5| 3|2|1|0|0|0|0
6| 3|3|2|0|0|0|0
7| 4|3|2|1|0|0|0
8| 4|3|3|2|0|0|0
9| 4|4|3|2|1|0|0
10|4|4|3|3|2|0|0
11|5|4|4|3|2|1|0
12|5|4|4|3|3|2|0
13|5|5|4|4|3|2|1
14|5|5|4|4|3|3|2
15|5|5|5|4|4|3|3
16|6|5|5|4|4|4|4
17|6|5|5|5|5|5|4
18|6|6|6|6|5|5|4
19|6|6|6|6|6|5|5
20|6|6|6|6|6|6|6

### Mage spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
1| 1|0|0|0|0|0|0|0|0
2| 2|0|0|0|0|0|0|0|0
3| 2|1|0|0|0|0|0|0|0
4| 3|2|0|0|0|0|0|0|0
5| 3|2|1|0|0|0|0|0|0
6| 3|3|2|0|0|0|0|0|0
7| 4|3|2|1|0|0|0|0|0
8| 4|3|3|2|0|0|0|0|0
9| 4|4|3|2|1|0|0|0|0
10|4|4|3|3|2|0|0|0|0
11|4|4|4|3|2|1|0|0|0
12|4|4|4|3|3|2|0|0|0
13|4|4|4|4|3|2|1|0|0
14|4|4|4|4|3|3|2|0|0
15|4|4|4|4|4|3|2|1|0
16|4|4|4|4|4|3|3|2|0
17|4|4|4|4|4|4|3|2|1
18|4|4|4|4|4|4|3|3|2
19|4|4|4|4|4|4|4|3|3
20|4|4|4|4|4|4|4|4|4

Note: Specialist Mages may cast one more spell per level per day

### Mage/Thief spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
1 |0|0|0|0|0|0|0|0|0
2 |1|0|0|0|0|0|0|0|0
3 |1|0|0|0|0|0|0|0|0
4 |2|1|0|0|0|0|0|0|0
5 |2|1|0|0|0|0|0|0|0
6 |2|2|1|0|0|0|0|0|0
7 |3|2|1|0|0|0|0|0|0
8 |3|2|2|1|0|0|0|0|0
9 |3|3|2|1|0|0|0|0|0
10|3|3|2|2|1|0|0|0|0
11|3|3|3|2|1|0|0|0|0
12|3|3|3|2|2|1|0|0|0
13|3|3|3|3|2|1|0|0|0
14|3|3|3|3|2|2|1|0|0
15|3|3|3|3|3|2|1|0|0
16|3|3|3|3|3|2|2|1|0
17|3|3|3|3|3|3|2|1|0
18|3|3|3|3|3|3|2|2|1
19|3|3|3|3|3|3|3|2|2
20|3|3|3|3|3|3|3|3|3

Note: Specialist Mages may cast one more spell per level per day

### Fighter/Cleric, Fighter/Druid, Cleric/Ranger, Cleric/Thief, Priest of Lathander, Priest of Tyr and Priest of Helm spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
--- | --- | --- | --- |--- |--- |--- |---
1| 0|0|0|0|0|0|0
2| 1|0|0|0|0|0|0
3| 1|0|0|0|0|0|0
4| 2|1|0|0|0|0|0
5| 2|1|0|0|0|0|0
6| 2|2|1|0|0|0|0
7| 2|2|1|0|0|0|0
8| 2|2|2|1|0|0|0
9| 2|2|2|1|0|0|0
10|2|2|2|2|1|0|0
11|3|2|2|2|1|0|0
12|3|2|2|2|2|1|0
13|3|3|2|2|2|1|0
14|3|3|2|2|2|2|1
15|3|3|3|2|2|2|2
16|4|3|3|2|2|2|2
17|4|3|3|3|3|3|2
18|4|4|4|4|3|3|2
19|4|4|4|4|4|3|3
20|4|4|4|4|4|4|4

### Fighter/Mage spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
--- | --- | --- | --- |--- |--- |--- |---
1| 1|0|0|0|0|0|0
2| 2|0|0|0|0|0|0
3| 2|0|0|0|0|0|0
4| 3|1|0|0|0|0|0
5| 3|2|0|0|0|0|0
6| 3|2|0|0|0|0|0
7| 4|3|1|0|0|0|0
8| 4|3|2|0|0|0|0
9| 4|3|2|0|0|0|0
10|4|4|3|1|0|0|0
11|4|4|3|2|0|0|0
12|4|4|3|2|0|0|0
13|4|4|4|3|1|0|0
14|4|4|4|3|2|0|0
15|4|4|4|3|2|0|0
16|4|4|4|4|3|1|0
17|4|4|4|4|3|2|0
18|4|4|4|4|3|2|0
19|4|4|4|4|4|3|1
20|4|4|4|4|4|4|2
21|4|4|4|4|4|4|2
22|4|4|4|4|4|4|3
23|4|4|4|4|4|4|4

Note: Specialist Mages can cast one spell more per level per day.

### Cleric/Mage (arcane, divine) spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
1 |0|0|0|0|0|0|0|0|0
2 |1, 1|0|0|0|0|0|0|0|0
3 |1, 1|0|0|0|0|0|0|0|0
4 |1, 1|1, 1|0|0|0|0|0|0|0
5 |1, 1|1, 1|0|0|0|0|0|0|0
6 |1, 1|1, 1|1, 1|0|0|0|0|0|0
7 |2, 2|1, 1|1, 1|0|0|0|0|0|0
8 |2, 2|1, 1|1, 1|1, 1|0|0|0|0|0
9 |2, 2|2, 2|1, 1|1, 1|0|0|0|0|0
10|2, 2|2, 2|1, 1|1, 1|1, 1|0|0|0|0
11|2, 2|2, 2|2, 2|1, 1|1, 1|0|0|0|0
12|2, 2|2, 2|2, 2|1, 1|1, 1|1, 1|0|0|0
13|2, 2|2, 2|2, 2|2, 2|1, 1|1, 1|0|0|0
14|2, 2|2, 2|2, 2|2, 2|1, 1|1, 1|1, 1|0|0
15|2, 2|2, 2|2, 2|2, 2|2, 2|1, 1|1, 1|0|0
16|2, 3|2, 2|2, 2|2, 2|2, 2|1, 1|1, 1|1|0
17|2, 3|2, 2|2, 2|2, 2|2, 2|2, 2|1, 1|1|0
18|2, 3|2, 3|2, 3|2, 3|2, 2|2, 2|1, 1|1|1
19|2, 3|2, 3|2, 3|2, 3|2, 3|2, 2|2, 2|1|2
20|2, 3|2, 3|2, 3|2, 3|2, 3|2, 3|2, 3|2|3

Note: Specialist Mages can cast one spell more per level per day.


### Fighter/Mage/Thief spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
--- | --- | --- | --- |--- |--- |--- |---
1 |0|0|0|0|0|0|0
2 |1|0|0|0|0|0|0
3 |1|0|0|0|0|0|0
4 |2|0|0|0|0|0|0
5 |2|1|0|0|0|0|0
6 |2|1|0|0|0|0|0
7 |3|2|0|0|0|0|0
8 |3|2|1|0|0|0|0
9 |3|2|1|0|0|0|0
10|3|3|2|0|0|0|0
11|3|3|2|1|0|0|0
12|3|3|2|1|0|0|0
13|3|3|3|2|0|0|0
14|3|3|3|2|1|0|0
15|3|3|3|2|1|0|0
16|3|3|3|3|2|0|0
17|3|3|3|3|2|1|0
18|3|3|3|3|2|1|0
19|3|3|3|3|3|2|0
20|3|3|3|3|3|3|1
21|3|3|3|3|3|3|1
22|3|3|3|3|3|3|2
23|3|3|3|3|3|3|3

Note: Specialist Mages can cast one spell more per level per day.

### Fighter/Mage/Cleric (arcane, divine) spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
--- | --- | --- | --- |--- |--- |--- |---
1 |0|0|0|0|0|0|0
2 |1, 1|0|0|0|0|0|0
3 |1, 1|0|0|0|0|0|0
4 |1, 1|0|0|0|0|0|0
5 |1, 1|1, 1|0|0|0|0|0
6 |1, 1|1, 1|0|0|0|0|0
7 |2, 2|1, 1|0|0|0|0|0
8 |2, 2|1, 1|1, 1|0|0|0|0
9 |2, 2|1, 1|1, 1|0|0|0|0
10|2, 2|2, 2|1, 1|0|0|0|0
11|2, 3|2, 2|1, 1|1, 1|0|0|0
12|2, 3|2, 2|1, 1|1, 1|0|0|0
13|2, 3|2, 3|2, 2|1, 1|0|0|0
14|2, 3|2, 3|2, 2|1, 1|1, 1|0|0
15|2, 3|2, 3|2, 2|1, 1|1, 1|0|0
16|2, 3|2, 3|2, 2|2, 2|1, 1|0|0
17|2, 3|2, 3|2, 3|2, 2|1, 1|1|0
18|2, 3|2, 3|2, 3|2, 2|1, 1|1|0
19|2, 3|2, 3|2, 3|2, 2|2, 2|1|0
20|2, 3|2, 3|2, 3|2, 3|2, 2|2|1
21|2, 3|2, 3|2, 3|2, 3|2, 2|2|1
22|2, 3|2, 3|2, 3|2, 3|2, 2|2|2
23|2, 3|2, 3|2, 3|2, 3|2, 3|2|3

Note: Specialist Mages can cast one spell more per level per day.



### Sorcerer spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
1| 3|0|0|0|0|0|0|0|0
2| 4|0|0|0|0|0|0|0|0
3| 5|0|0|0|0|0|0|0|0
4| 6|3|0|0|0|0|0|0|0
5| 6|4|0|0|0|0|0|0|0
6| 6|5|3|0|0|0|0|0|0
7| 6|6|4|0|0|0|0|0|0
8| 6|6|5|3|0|0|0|0|0
9| 6|6|6|4|0|0|0|0|0
10|6|6|6|5|3|0|0|0|0
11|6|6|6|6|4|0|0|0|0
12|6|6|6|6|5|3|0|0|0
13|6|6|6|6|6|4|0|0|0
14|6|6|6|6|6|5|3|0|0
15|6|6|6|6|6|6|4|0|0
16|6|6|6|6|6|6|5|3|0
17|6|6|6|6|6|6|6|4|0
18|6|6|6|6|6|6|6|5|3
19|6|6|6|6|6|6|6|6|4
20|6|6|6|6|6|6|6|6|6

Note: Battle Casters can cast one spell per day per level less.


### Sorcerer and Battle Caster spells known

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
1| 2|0|0|0|0|0|0|0|0
2| 2|0|0|0|0|0|0|0|0
3| 3|0|0|0|0|0|0|0|0
4| 3|1|0|0|0|0|0|0|0
5| 4|2|0|0|0|0|0|0|0
6| 4|2|1|0|0|0|0|0|0
7| 5|3|2|0|0|0|0|0|0
8| 5|3|2|1|0|0|0|0|0
9| 5|4|3|2|0|0|0|0|0
10|5|4|3|2|1|0|0|0|0
11|5|5|4|3|2|0|0|0|0
12|5|5|4|3|2|1|0|0|0
13|5|5|4|4|3|2|0|0|0
14|5|5|4|4|3|2|1|0|0
15|5|5|4|4|4|3|2|0|0
16|5|5|4|4|4|3|2|1|0
17|5|5|4|4|4|3|3|2|0
18|5|5|4|4|4|3|3|2|1
19|5|5|4|4|4|3|3|3|2
20|5|5|4|4|4|3|3|3|3


### Shaman spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
--- | --- | --- | --- |--- |--- |--- |---
1| 3|0|0|0|0|0|0
2| 4|0|0|0|0|0|0
3| 5|0|0|0|0|0|0
4| 6|3|0|0|0|0|0
5| 7|4|0|0|0|0|0
6| 8|5|3|0|0|0|0
7| 9|6|4|0|0|0|0
8| 9|7|5|3|0|0|0
9| 9|8|6|4|0|0|0
10|9|9|7|5|3|0|0
11|9|9|8|6|4|0|0
12|9|9|9|7|5|3|0
13|9|9|9|8|6|4|0
14|9|9|9|9|7|5|3
15|9|9|9|9|8|6|4
16|9|9|9|9|9|7|5
17|9|9|9|9|9|8|6
18|9|9|9|9|9|9|7
19|9|9|9|9|9|9|8
20|9|9|9|9|9|9|9


### Shaman spells known
Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
--- | --- | --- | --- |--- |--- |--- |---
1| 2|0|0|0|0|0|0
2| 2|0|0|0|0|0|0
3| 3|0|0|0|0|0|0
4| 3|1|0|0|0|0|0
5| 4|2|0|0|0|0|0
6| 4|2|1|0|0|0|0
7| 5|3|2|0|0|0|0
8| 5|3|2|1|0|0|0
9| 6|4|3|2|0|0|0
10|6|4|3|2|1|0|0
11|6|5|4|3|2|0|0
12|6|5|4|3|2|1|0
13|6|6|5|4|3|2|0
14|6|6|5|4|3|2|1
15|6|6|5|5|4|3|2
16|6|6|5|5|4|3|2
17|6|6|5|5|5|4|3
18|6|6|5|5|5|4|3
19|6|6|5|5|5|4|4
20|6|6|5|5|5|4|4


### Stat dependent bonus spells per day

Stat\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
11-12 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0
13-14 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0
15-16 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0
17-18 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0
19-20 | 2 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0
21-22 | 2 | 2 | 1 | 1 | 1 | 1 | 0 | 0 | 0
23-24 | 2 | 2 | 2 | 1 | 1 | 1 | 1 | 0 | 0
25    | 2 | 2 | 2 | 2 | 1 | 1(2) | 1(2) | 1 | 0

Note: Since priests can not cast 8th level spells, they receive another 6th and 7th level spell slots instead when corresponding stat is 25.


### Cleric domain spells

Domain           | Granted Spells                                                                      |Domain Ability
--- | ---| ---
Elemental (Air)  | Shocking Grasp (1), Lightning Bolt (3), Storm Shield (6)                            |50% lightning resistance
Animal           | Animal Summoning I (4), Animal Summoning II (5), Animal Summoning III (6)           |Charm animals, 10' Radius 1/day
Elemental (Cold) | Chill Touch (1), Fireshield (Blue) (4), Cone of Cold (5)                            |50% cold resistance
Death            | Horror (2), Hold Undead (3), Control Undead (7)                                     |Death Touch 1/day
Destruction      | Melf's Acid Arrow (2), Cloudkill (5), Disintegrate (6)                              |Destructive Smite 1/day
Elemental (Earth)| Conjure Lesser Earth Elemental (5), Stoneskin (6), Protection From The Elements (7) |50% acid resistance
Elemental (Fire) | Burning Hands (1), Fireball (3), Delayed Blast Fireball (7)                         |50% fire resistance
Glory            | Exaltation (3, Bg1, Bg2)/Emotion:Courage( 3, Iwd) , Boon of Diety (6), Mordenkainen's Sword (7)                         |Aura of Faith 1/day
Moon             | Blindness (1), Blur (2), Vampiric Touch (3)                                         |Immunity to blindness
Protection       | Shield (1), Minor Globe of Invulnerability (4), Protection From Magical Weapons (6) |+1 to all Savingthrows
Sun              | Fireshield (Red) (4), Sunfire (5), Prismatic Spray (7)                              |Divine Light 1/day
Time             | Slow (3), Haste (4), Hold Monster (5)                                               |Immunity to sneak attacks
Trickery         | Grease (1), Confusion (4), Shadow Door (5)                                          |Mirror Image 1/day, +5% bonus to all thieving skills
War              | Seeking Sword (3), Divine Favor (5), Tenser's Transformation (6)                    |Free weapon focus
Magic            | Minor Spell Turning (3), Spell Immunity (5), Limited Wish (7)                                  |Dispelling Touch 3/day
Plant            | Entangle (1), Barkskin (2), Poison (4, Bg1, Bg2), Mold Touch (3, Iwd)               |Poison Weapon 1/day

#### Charm Animal, 10' Radius
This spell affects all animals in 10-ft radius around the caster. The animals are allowed a Saving Throw vs. Spell to negate the effect with penalty equal to one fourth caster level rounded down.  
If the spell's recipient fails its Saving Throw, it regards the caster as a trusted friend and ally to be heeded and protected. The caster may give it orders, and the charmed animal will carry them out as quickly as possible.  
The effect lasts for 4 hours.
If the caster harms—or attempts to harm—the charmed animal by some overt action, or if a Dispel Magic spell is cast upon the charmed animal, the Charm spell is broken. If two or more Charms simultaneously affect a creature, the most recent Charm takes precedence. Note that the subject will be hostile when the Charm expires, regardless of its original attitude. Also note that you cannot have a charmed creature leave the area where it was charmed.

#### Death Touch
Touched creature dies if fails Savingthrow vs. Death with penalty equal to one fourth caster level rounded down.

#### Destructive Smite
For 10 seconds character receives +1 bonus to her attack roll per 2 points of Charisma above 10 and deals 1 extra point of damage per level with every hit.

#### Dispelling Touch
You remove magical effects from a creature by touching it with the probability equal to 60% + 2% per caster level.

#### Divine Light
The character emits a dazzling burst of light that strikes at all undead creatures within a 30-ft. radius. The spell does not automatically hit all targets, but makes a melee attack using the character's current THAC0 +3. Struck creatures suffer 1d6 points of fire damage per caster level.  


### Sorcerer bloodline spells

Bloodline       | Granted Spells
--- | ---
Arcane   | Identify (1), Invisibility (2), Dispel Magic (3), Secret Word (4), Breach (5), True Sight (6), Power Word, Stun (7), Simulacrum (8), Wish (9)
Celestial| Protection From Evil (1), Resist Fear (2), Hold Undead (3), Minor Globe of Invulnerability (4), Sunfire (5), Protection From Magic Energy (6), Mordenkainen's Sword (7), Power Word, Blind (8), Absolute Immunity (9)
Demon    | Spook (1), Strength (2), Protection From Fire (3), Stoneskin (4), Protection From Acid (5), Tenser's Transformation (6), Cacofiend (7), Summon Fiend (8), Gate (9)
Draconic | Armor (1), Resist Fear (2), Fireball (3), Fireshield (Red) (4), Lower Resistance (5), Protection From Magical Weapons (6), Protection From The Elements (7), Protection From Energy (8), Power Word, Kill (9)
Fey      | Sleep (1), Glitterdust (2), Dire Charm (3), Confusion (4), Domination (5), Mislead (6), Prismatic Spray (7), Maze (8), Shapechange (9)
Undead   | Larloch's Minor Drain (1), Ray of Enfeeblement (2), Vampiric Touch (3), Contagion (4), Cloudkill (5), Death Fog (6), Control Undead (7), Abi-Dalzim's Horrid Wilting (8), Wail of the Banshee (9)


### Druid shape stats

Shape | STR | DEX | CON | Base AC| APR |Damage | Special Abilities |
---   | --- | --- | --- | ---    | --- |---    | ---   
Black Bear       | 16  | 12  | 18  |  7 | 3      |1d4 + 1 (piercing)| strikes as +1 weapon
Brown Bear       | 18  | 12  | 16  |  7 | 3      |1d6 (piercing)    | strikes as +1 weapon
Wolf             | 15  | 18  | 14  |  6 | 2      |1d8 (piercing)    | strikes as +1 weapon, Cold Resistance 50%, Electrical Resistance 50%
Fire Salamander  | 18  | 19  | 15  |  2 |As Druid|1d6+1d8 (piercing)| strikes as +3 weapon, +1 THAC0, Fire Resistance 50%, Breathe Fireball three times per day (2d6 fire damage to target)
Baby Wyvern      | 16  | 17  | 16  |  3 | 1      |2d8 (crushing) + 1d6 (piercing)| strikes as +2 weapon,  on hit causes 1 poison damage/second for 6 seconds (Save vs. Poison to avoid), Immunity to hold, paralysis, slow, level drain, web, entangle, and grease            
Sword Spider     | 16  | 16  | 10  |  3 | 4      |1d4 (piercing)    | strikes as +1 weapon, Immunity to web
Polar Bear       | 20  | 10  | 19  |  4 | 3      |1d10 (piercing)    | strikes as +3 weapon, Cold Resistance: 75%, Fire Resistance: -25%
Boring Beetle    | 18  |  7  | 16  | -2 | 1      |5d4 (crushing)    | strikes as +3 weapon, Slashing Resistance: 50%, Piercing Resistance: 50%, Missile Resistance: 50%
Winter Wolf      | 18  | 13  | 18  |  2 | 2      |Melee: 1d6 (piercing) + 1d6(cold)   | strikes as +3 weapon, Cold Resistance: 75%, Fire Resistance -25%, Winter Wolf Breath three times per day (6d6 cold damage to target, save vs. Breath Weapon at -4 for half)  
Werewolf         | 19  | 16  | 15  |  3 | 2      |1d6 (piercing)  | strikes as +2 weapon, Magic Resistance: 20%
Werewolf (level 8+)        | 19  | 16  | 15  |  1 | 2      |1d10 (piercing) | strikes as +2 weapon, Magic Resistance: 20%
Greater Werewolf | 21  | 20  | 25  |  -4| 3      |2d8 (slashing)    | strikes as +4 weapon, Immune to all non magical weapons, Fire Resistance 50%, Cold Resistance 50%, Electricity Resistance 50%, Acid Resistance 50%, Magic Resistance 40%, Regenerates 1 Hit Point per second
Greater Werewolf (level 22+) | 21  | 20  | 25  |  -6| 3      |2d10 (slashing)    | strikes as +4 weapon, Immune to all non magical weapons, Fire Resistance 50%, Cold Resistance 50%, Electricity Resistance 50%, Acid Resistance 50%, Magic Resistance 40%, Regenerates 1 Hit Point per second
Greater Werewolf (level 29+) | 21  | 20  | 25  |  -8| 3      |2d12 (slashing)    | strikes as +4 weapon, Immune to all non magical weapons, Fire Resistance 50%, Cold Resistance 50%, Electricity Resistance 50%, Acid Resistance 50%, Magic Resistance 40%, Regenerates 1 Hit Point per second
Large Fire Elemental | 14 | 21 | 16 | 6 | 2 | 2d6 (crushing) + 2d6 (fire) | strikes as +4 weapon, Immunity to weapons below +3, Weapon Finesse, Fire Resistance: 100%, Cold Resistance: -50%, Physical Resistance: 25%
Large Earth Elemental | 21 | 8 | 19 | 0 | 2 | 2d10 (crushing)| strikes as +4 weapon, Immunity to weapons below +3, Physical Resistance: 50%
Large Water Elemental | 20 | 14 | 19 | 1 | 2 | 2d8 (crushing)| strikes as +4 weapon, Immunity to weapons below +3, Physical Resistance: 50%, Cold Resistance: -25%, Acid Resistance: 75%, Electrical Resistance -75%
Greater Fire Elemental | 18 | 25 | 18 | 6 | 2 | 2d8 (crushing) + 2d8 (fire) | strikes as +4 weapon, Immunity to weapons below +3, Weapon Finesse, Fire Resistance: 100%, Cold Resistance: -50%, Physical Resistance: 25%
Greater Earth Elemental | 25 | 8 | 21 | 0 | 2 | 2d12 (crushing)| strikes as +4 weapon, Immunity to weapons below +3, Physical Resistance: 50%
Greater Water Elemental | 24 | 18 | 21 | 1 | 2 | 2d10 (crushing)| strikes as +4 weapon, Immunity to weapons below +3, Physical Resistance: 50%, Cold Resistance: -25%, Acid Resistance: 75%, Electrical Resistance -75%



## 5. Equipment


### Armors

Like in DnD 3.5 it is now possible to cast arcane spells and use thieving skills in any armor, although depending on the armor, characters may receive a penalty
 to their thieving abilities (Hide In Shadows, Move Silently and Pick Pockets) and/or suffer a chance of spell casting failure. All armors also restrict a maximum dexterity bonus to AC.

Armor Type| Spell Casting Failure | Max Dex AC Bonus | Thieving skills
---   | --- | --- | ---
Leather Armor          | 10% | +5 | -   
Studded Leather Armor  | 15% | +4 | -10%
Hide Armor             | 20% | +3 | -20%
Chain Mail             | 20% | +3 | -30%
Splint Mail            | 30% | +2 | -40%
Plate Mail             | 40% | +1 | -50%
Full Plate Armor       | 50% | +0 | -60%
Elven Chain Mail       | 0%  | +4 | -10%
Mithral Chain Mail     | 0%  | +4 | -10%
Ankheg Plate Mail      | 20% | +3 | -30%


### Other Changes
 - Certain robes can now be worn by any class, even monks  
 - Strength requirements for Full Plate Mail were reduced to 14   
 - Strength requirements for Composite Longbows were reduced to 14, they also receive 0.5 damage bonus from strength  
 - Damage of Bastard Swords was changed to 1d10  
 - Damage of Two-Handed Swords was changed to 2d6  
 - Damage of Halberds and 2-handed axes was changed to 1d12  
 - Damage of Spears was changed to 1d8  
 - AC bonus of Medium Shields was increased to +2  
 - AC bonus of Large Shields was increased to +4, but they also now give -2 THAC0 penalty       
 - Initial number of attacks per round for all ranged weapons was set to 1, except for slings and crossbows for which it was set to 0.5; and darts for which it was set to 2; it increases at normal character APR progression and Rapid Shot feat also gives +1 APR with ranged weapons (except throwing axes and hammers)   
 - Moonblade type was changed to longsword (do not worry, Xan can still use it)  
 - Sling bullets damage was changed from missile to crushing  

## 6. Spells

The saving throws type for most of the spells were changed, now area effect spells are generally checked against Breath Weapon saving throws,
spells changing characters physical condition (death, poison, disease, blindness, polymorph etc) are checked against Death/Poison/Paralyze or Petrification/Polymorph saving throws, all the rest - against Spell saving throws.
For item abilities, area effect ones are generally checked against Breath Weapon saving throws, all the rest - against Rod/Staff/Wand saving throws.
Also the spells penalties to Savingthrows were made more uniform akin to DnD 3.5 and now Savingthrow penalty for every spell is equal to (1 + spell level)/2 rounded down (unless there are some specific bonuses/penalties stated in the spell description).

### Modified Spells

- Shield now gives +4 AC bonus which is cumulative with armor, but not with shields  
- Chill Touch now acts as close range spell (instead of weapon) and deals 1d8 points of cold damage and bestows -2 penalty to THAC0  
- Burning hands is now and area effect spell (15 ft cone)  
- The saving throw penalties against Spook now no longer increase with caster level  
- If creatures under effect of Sleep are being attacked, they wake up  
- Shocking Grasp now acts as close range spell (instead of weapon) dealing 1d6 electrical damage per level  
- Ghoul touch now acts as close range spell (instead of weapon)  
- Horror duration was reduced to 3 rounds  
- Dispel Magic and Remove Magic spells now  dispel with probability equal to 30% + 1% per level (twice for Inquisitors)  
- Animate Dead now summons two skeletons instead of one  
- Enchanted Weapon now gives + 1 enchantment bonus / 4 caster levels  and also provides corresponding bonuses to THAC0 and damage (depending on original weapon enchantment), clerics can also cast it   
- Tenser's Transformation now sets THAC0 to that of a fighter of equal level gives +1 APR, +2 To Hit and Damage bonus and doubles caster's HP  
- Magical Stone now creates one magical sling bullet per priest level (+1 THAC0, 1d6+1 damage or 2d6+2 against undead)  
- Bless is now a cleric only spell  
- Shillelagh duration was increased to 5 rounds/level, shillelagh damage was increased to 2d6  
- Barkskin now gives +3 bonus to AC (+4 at level 7, +5 at level 13) which is cumulative with everything else and +1 bonus to saving throws (except vs. Spell)    
- Flame Blade spell was removed, it is now replaced with druid only Flame Weapon spell which makes target deal +1d6 fire damage bonus on every attack for the duration of the spell  
- Goodberries now heal 3 HP each when eaten  
- Spiritual Hammer is now a throwing weapon with +1 enchantment, THAC0 and Damage bonus per 3 caster levels (up to +5 at lvl 15)    
- Draw Upon Holy Might now gives 1+1/per 5 caster level bonus to STR, DEX and CON (up to +5 at level 20)  
- Aid's +1 THACO bonus is now cumulative with bless, also bonus HP are increased to +5 +1/caster level (up to 15)  
- Seeking sword now gives only +1 APR (instead of 2) and is now 3rd level War Domain Spell  
- Cure Medium Wounds now heals 20 HP  
- Call Lightning can be now cast indoors and deals 1d6 points of electrical damage per caster level up to 10d6  
- Cloak of fear radius was increased to 5 ft  
- Holy Power now sets caster's THAC0 to that of a fighter of the same level, gives +1/2 APR and +2 bonus to strength  
- Cause Serious Wounds is now a close range spell dealing 26 points of damage  (with saveigthrow vs. Spell for half)  
- Cure Serious wounds now heals 28 HP  
- Slay Living now deals 2d6+9 damage to target if it succeeds on Save vs. Death  
- Flame Strike is now and AOE spell with 5 ft radius  
- Champion's Strength is now applied only to caster. It sets its THAC0 to that of a  fighter, gives + 1/2 APR and + 4 strength bonus, the duration is three times that of Holy Power  
- Righteous Magic now gives + 1 HP per level, +2 AC, and +1 STR and 5% physical damage resistance per 3 caster levels  
- Cause Critical Wounds is now a close range spell dealing 36 points of damage  (with savingthrow vs. Spell for half)  
- Cure Critical wounds now heals 36 HP  
- Heal now heals up to 150 HP  
- Divine favor now lasts 10 rounds (it is now a 5th level War Domain Spell)  
- Sol's Searing Orb is now a ranged spell in Bg1 and Bg2 (instead creating item)  and deals 6d12 damage (double to undead) with savingthrow vs Breath Weapon for half  
- Damage of Bolt of Glory against primes/elementals/undead/demons was increased to 4d12/3d8/8d12/10d12 respectively  
- Harm is now a close range spell instead of a weapon, dealing 150 damage (75 if Save vs. Spell), but always leaves target with at least 1 HP    
- Boon of Lathander was renamed to Boon of Deity (it is now a 6th level Glory Domain Spell)  
- Finger of Death now deals 6d8 points of damage to the target if it succeeds on a Saving Throw vs. Death  
- Damage of Chain Lightning is now fixed at 12d6  
- Regeneration now always lasts 10 rounds  
- Mantle, Improved Mantle and Absolute Immunity now last 1 round per caster level, Absolute Immunity now also protects against +6 weapons  
- Energy drain now gives 2d4 negative levels  
- All cure wounds spells (and Heal) now harm undead for corresponding amount of damage (with Savingthrow vs. Spell for 1/2) instead of healing them  
- All cause wounds spells (and Harm) now heal undead for corresponding amount of Hit Points (with Savingthrow vs. Spell for 1/2) instead of harming them    
- Effects of Holy/ Unholy word now depend on difference between caster and target level/HD (rather than raw target level/HD)  
- Project Image now has only 50% of caster level  
- Duration of Bless, Protection from Evil, Armor of Faith, Barkskin, Resist Fire/Cold, Ghost Armor and Spirit Armor was changed to 1 min/level  
- Duration of Blur and Aid was changed to 5 rounds/level  
- Duration of Luck was changed to 1 round/level
- Iwd Poison spell now deals 1 poison damage per 6 levels of the caster per second.

### New Spells

#### Magic Fang (Druid)
(Alteration)  

Level: 1  
Sphere: Combat  
Range: Touch  
Duration: 1 min/level  
Casting Time: 6   
Area of Effect: 1 creature  
Saving Throw: None   

This spell gives an animal a +1 enchantment bonus on attack and damage rolls.  

#### Lesser Animal Summoning I  (Druid)
(Conjuration/Summoning)  

Level: 1  
Sphere: Animal, Summoning   
Range: 30 ft.  
Duration: 3 turns  
Casting Time: 4   
Area of Effect: Special   
Saving Throw: None   

By means of this spell, the caster calls a war dog to fight along his side. It will remain under the caster's control until slain or the spell duration expires.

#### Camouflage (Druid)
(Illusion/Phantasm)  

Level: 1  
Sphere: Plant   
Range: Touch   
Duration: 1 Turn/level  
Casting Time: 2   
Area of Effect: 1 creature   
Saving Throw: None   

Target creature coloring changes to match the surrounding environment, granting it +20% bonus to Hide in Shadows and Move Silently Skills for the duration of the spell.

#### Cause Light Wounds (Cleric)
(Necromancy)  

Level: 1  
Sphere: Healing   
Range: Touch   
Duration: Permanent   
Casting Time: 3   
Area of Effect: 1 creature   
Saving Throw: 1/2   

This spell is the reverse of Cure Light Wounds. Instead of healing the creature touched, it causes damage. On a successful touch from the priest, the spell inflicts 8 points of damage upon the target. If target succeeds on a Savingthrow vs. Spell the damage is halved.
Since undead are powered by negative energy, this spell cures such a creature of a like amount of damage, rather than harming it.

#### Magic Weapon (Cleric)
(Enchantment/Charm)  

Level: 1  
Sphere: War  
Range: 0  
Duration:  5 rounds/level  
Casting Time: 4  
Area of Effect: 1 creature  
Saving Throw: None  

When this spell is cast on a creature it enchants any weapons that it currently wields. For the duration of the spell, those weapons are treated as having a +1 enchantment for the purposes of determining what they can hit as well as THAC0 and damage bonuses.  
NOTE: Projectiles are not enchanted, only launchers receive corresponding THAC0 bonuses.  

#### Lesser Animal Summoning II (Druid)
(Conjuration/Summoning)  

Level: 2  
Sphere: Animal, Summoning   
Range: 30 ft.  
Duration: 3 turns  
Casting Time: 5   
Area of Effect: Special   
Saving Throw: None   

By means of this spell, the caster calls a wolf to fight along his side. It will remain under the caster's control until slain or the spell duration expires.  

#### Cure Moderate Wounds (Cleric, Druid)
(Necromancy)  

Level: 2  
Sphere: Healing  
Range: Touch  
Duration: Permanent  
Casting Time: 5  
Area of Effect: 1 creature  
Saving Throw: 1/2  

By casting this spell and laying <PRO_HISHER> hand upon a creature, the priest causes 14 points of wound or other injury damage to the creature's body to be healed.
Curing is permanent only insofar as the creature does not sustain further damage; caused wounds will heal—or can be cured—just as any normal injury.
Since undead are powered by negative energy, this spell deals damage to them instead of curing their wounds. An undead creature can apply spell resistance, and can attempt a savingthrow vs. Spell to take half damage.

#### Cause Moderate Wounds (Cleric)
(Necromancy)  

Level: 2  
Sphere: Healing   
Range: Touch   
Duration: Permanent   
Casting Time: 3   
Area of Effect: 1 creature   
Saving Throw: 1/2   

This spell is the reverse of Cure Moderate Wounds. Instead of healing the creature touched, it causes damage. On a successful touch from the priest, the spell inflicts 14 points of damage upon the target. If target succeeds on a Savingthrow vs. Spell the damage is halved.
Since undead are powered by negative energy, this spell cures such a creature of a like amount of damage, rather than harming it.

#### Greater Magic Fang (Druid)
(Alteration)  

Level: 3  
Sphere: Combat  
Range: Touch  
Duration: 1 min/level  
Casting Time: 6   
Area of Effect: 1 creature  
Saving Throw: None   

This spell gives an animal a +1 enchantment bonus on attack and damage rolls on attack and damage rolls, which increases by +1 for every five caster levels.

#### Searing Light (Cleric)
(Evocation)  

Level: 3  
Sphere: Elemental (Fire)  
Range: 50 ft.  
Duration: instant  
Casting Time: 3  
Area of Effect: 1 creature   
Saving Throw: None  

Focusing divine power like a ray of the sun, priest projects a blast of light from open palm. A creature struck by this ray of light takes 1d8 points of fire damage per two caster levels (maximum 5d8). An undead creature takes 1d8 points of damage per caster level (maximum 10d8) instead.

#### Aid, 10' Radius (Cleric)
(Necromancy, Conjuration)  

Level: 3  
Sphere: Necromantic   
Range: 0   
Duration: 5 rounds/level   
Casting Time: 5   
Area of Effect: 30-ft. radius  
Saving Throw: None   

When this spell is cast, all creatures within a 30-ft. radius are affected individually by Aid spell.
The recipients gain +1 to attack rolls and Saving Throws and a special bonus of 5 +1/caster level to maximum Hit Points (up to 20) for the duration of the spell.  

#### Magic vestment  
(Enchantment/Charm)  

Level: 3  
Sphere: Protection  
Range: 0  
Duration:  5 rounds/level  
Casting Time: 4  
Area of Effect: 1 creature  
Saving Throw: None  

You imbue a suit of armor with an enhancement bonus of +1 per four caster levels (maximum +5 at 20th level).  
NOTE: An outfit of regular clothing counts as armor that grants no AC bonus for the purpose of this spell.  

#### Lesser Animal Summoning III (Druid)  
(Conjuration/Summoning)  

Level: 3  
Sphere: Animal, Summoning   
Range: 30 ft.  
Duration: 3 turns  
Casting Time: 6   
Area of Effect: Special   
Saving Throw: None   

By means of this spell, the caster calls between 1 and 2 animals that have 4 Hit Dice or less. The animals appearing are randomly determined. They will remain under the caster's control until slain or the spell duration expires.

#### Cause Medium Wounds (Cleric)
(Necromancy)  

Level: 3  
Sphere: Healing   
Range: Touch   
Duration: Permanent   
Casting Time: 3   
Area of Effect: 1 creature   
Saving Throw: 1/2   

This spell is the reverse of Cure Medium Wounds. Instead of healing the creature touched, it causes damage. On a successful touch from the priest, the spell inflicts 20 points of damage upon the target. If target succeeds on a Savingthrow vs. Spell the damage is halved.
Since undead are powered by negative energy, this spell cures such a creature of a like amount of damage, rather than harming it.

#### Mass Cause Light Wounds (Cleric)
(Necromancy)  

Level: 5  
Sphere: Healing  
Range: 0  
Duration: Instant  
Casting Time: 5  
Area of Effect: 30-ft. radius  
Saving Throw: 1/2  

By casting this spell, the priest deals 1d8 + 1/level points of damage to nearby enemies. A successful Save vs. Spell halves the damage.
Since undead are powered by negative energy, this spell also cures all allied undead creatures of a like amount of damage, rather than harming them.

#### Mass Cure Medium Wounds (Cleric)
(Necromancy)  

Level: 6  
Sphere: Healing  
Range: 0  
Duration: Permanent  
Casting Time: 5  
Area of Effect: 30-ft. radius  
Saving Throw: 1/2  

This is a more powerful version of Mass Cure. Upon completion, all party members within a 30-ft. radius of the caster are healed 3d8 + 1/level Hit Points. Curing is permanent only insofar as the creature does not sustain further damage; caused wounds will heal—or can be cured—just as any normal injury.
This spell also deals damage to all hostile undead instead of curing their wounds. An undead creature can apply spell resistance, and can attempt a savingthrow vs. Spell to take half damage.

#### Mass Cause Medium Wounds (Cleric)
(Necromancy)  

Level: 6  
Sphere: Healing  
Range: 0  
Duration: Instant  
Casting Time: 5  
Area of Effect: 30-ft. radius  
Saving Throw: 1/2  

By casting this spell, the priest deals 3d8 + 1/level points of damage to nearby enemies. A successful Save vs. Spell halves the damage.
Since undead are powered by negative energy, this spell also cures all allied undead creatures of a like amount of damage, rather than harming them.

#### Vigorous Cycle (Cleric, Druid)
(Necromancy)  

Level: 6  
Sphere: Healing  
Range: Caster  
Duration: 1 round/level  
Casting Time: 7  
Area of Effect: allied creatures in 30-ft radius  
Saving Throw: None  

The subjects of this spell are able to regenerate 3 Hit Points per round for the duration of the spell.  

#### Mass Cure Critical Wounds (Cleric)
(Necromancy)  

Level: 7  
Sphere: Healing  
Range: 0  
Duration: Permanent  
Casting Time: 5  
Area of Effect: 30-ft. radius  
Saving Throw: 1/2  

This is an even stronger version of Mass Cure. Upon completion, all party members within a 30-ft. radius of the caster are healed 5d8 + 1/level Hit Points. Curing is permanent only insofar as the creature does not sustain further damage; caused wounds will heal—or can be cured—just as any normal injury.
This spell also deals damage to all hostile undead instead of curing their wounds. An undead creature can apply spell resistance, and can attempt a savingthrow vs. Spell to take half damage.~

#### Mass Cause Critical Wounds (Cleric)
(Necromancy)

Level: 7  
Sphere: Healing  
Range: 0  
Duration: Instant  
Casting Time: 5  
Area of Effect: 30-ft. radius  
Saving Throw: 1/2  

By casting this spell, the priest deals 5d8 + 1/level points of damage to nearby enemies. A successful Save vs. Spell halves the damage.
Since undead are powered by negative energy, this spell also cures all allied undead creatures of a like amount of damage, rather than harming them.

#### Aura of Vitality (Druid)
(Alteration)  

Level: 7  
Sphere: Protection, Plant  
Range: 0  
Duration: 1 round/ level  
Casting Time: 3  
Area of Effect: 30-ft. radius  
Saving Throw: None  

All allies within the area of effect receive a +4 bonus to Strength, Constitution, and Dexterity.  

#### Nature's Avatar (Druid)
(Alteration)  

Level: Quest  
Sphere: Combat  
Range: Touch  
Duration: 1 min/level  
Casting Time: 6  
Area of Effect: 1 creature  
Saving Throw: None  

With a touch, druid gifts an animal ally with nature's strength, resilience, and speed.  
The affected animal gains a +10 bonus on attack and damage rolls and 4 temporary bonus hit points per caster level, plus one additional attack per round for the duration of the spell.


Additionally Druids gain access to the following spells: Burning Hands (as 1st level spell), Sleep (as 1st level spell),
 Flame Strike (as 4th level spell), Hold Monster (as 4th level spell), Ice Storm (as 4th level spell), Chain Lightning (as 6th level spell),
 False Dawn (as 6th level spell), Sunray (as 7th level spell), Regeneration (as 7th level spell).  

## 7. Racial Enemies
Now racial enemies can be chosen at level 1 and, depending on class) at every 5th or 10th level, the corresponding bonuses grow with level and also vary by class.   
Additionally following races were added to the selection: Humans, Elves, Half-elves, Gnomes, Dwarves, Halflings, Half-orcs.

## 8. NPC
All joinable NPC now have 0th level when they join. Upon joining they get appropriate number of experience points and thus you can level up them as you like.
Their classes and statistics were changed as follows (stats are given in the format STR/ DEX/ CON/ INT/ WIS/ CHA):

### BG 1

#### Ajantis - Paladin (15/ 10/ 14/ 9/ 13/ 16)
#### Alora - Thief (10 /20/ 10/ 14/ 9 / 9)
#### Baeloth - Battle Caster (14/ 18/ 12/ 10/ 10/ 18)
#### Branwen - Fighter/Cleric (15/ 14/ 14/ 10/ 15/ 10)
#### Coran - Fighter/Thief (14/ 18/ 12/ 14/ 10/ 10)
#### Dorn - Blackguard (18/ 10/ 13/ 8/ 13/ 15)
#### Dynaheir - Sorcerer (12/ 14/ 14/ 10/ 9/ 17)
#### Edwin - Conjurer (10/ 12/ 14/ 18/ 9 / 10)
#### Eldoth - Blade (14/ 14/ 14/ 13/ 9/ 15)
#### Faldorn - Avenger (14/ 14/ 14/ 10/ 16/ 10)
#### Garrick - Bard (12/ 16/ 12/ 13/ 9/ 15)
#### Imoen - Fighter/Mage/Thief (9/ 16/ 12/ 16/ 11/ 10)
#### Jaheira - Fighter/Druid (14/ 14/ 14/ 10/ 16/ 10) - as half-elf will receive +2 bonus to any ability score at level 1
#### Kagain - Dwarven Defender (16/ 10/ 19/ 10/ 11/ 8)
#### Khalid - Fighter (16/ 16/ 14/ 10/ 10/ 10) - as half-elf will receive +2 bonus to any ability score at level 1
#### Kivan - Archer (15/ 18/ 12/ 10/ 13/ 9)
#### Minsc - Barbarian (18/ 14/ 16/ 8/ 8/ 8)
#### Montaron - Assassin (10/ 18/ 14/ 16/ 9/ 9)
#### Neera - Wild Mage (9/ 16/ 12/ 17/ 9/ 11)  - as half-elf will receive +2 bonus to any ability score at level 1
#### Qualye - Cleric/Illusionist (8/ 10/ 16/ 16/ 16/ 10)
#### Rasaad - Sun Soul Monk (14/ 16/ 12/ 10/ 15/ 10)
#### Safana - Swashbuckler (11/ 16/ 14/ 16/ 9/ 10)
#### Shar-Teel - Hexblade (16/ 14/ 10/ 10/ 10/ 16)
#### Skie - Shadowdancer (10/ 18/ 10/ 16/ 8/ 10)
#### Tiax - Fighter/Illusionist/Cleric (12/ 10/ 16/ 16/ 14/ 10)
#### Viconia - Cleric/Thief (10/ 18/ 10/ 16/ 14/ 14)
#### Xan - Fighter/Mage (14/ 16/ 12/ 16/ 10/ 10)
#### Xzar - Necromancer (10/ 14/ 12/ 18/ 9/ 9)
#### Yeslick - Cleric (14/ 10/ 16/ 10/ 16/ 12)


### SOD

#### Baeloth - Battle Caster (14/ 18/ 12/ 10/ 10/ 18)
#### Dorn - Blackguard (18/ 10/ 13/ 8/ 13/ 15)
#### Dynaheir - Sorcerer (12/ 14/ 14/ 10/ 9/ 17)
#### Edwin - Conjurer (10/ 12/ 14/ 18/ 9 / 10)
#### Jaheira - Fighter/Druid (14/ 14/ 14/ 10/ 16/ 10) - as half-elf will receive +2 bonus to any ability score at level 1
#### Khalid - Fighter (16/ 16/ 14/ 10/ 10/ 10) - as half-elf will receive +2 bonus to any ability score at level 1
#### Minsc - Barbarian (18/ 14/ 16/ 8/ 8/ 8)
#### Neera - Wild Mage (9/ 16/ 12/ 17/ 9/ 11)  - as half-elf will receive +2 bonus to any ability score at level 1
#### Rasaad - Sun Soul Monk (14/ 16/ 12/ 10/ 15/ 10)
#### Safana - Swashbuckler (11/ 16/ 14/ 16/ 9/ 10)
#### Viconia - Cleric/Thief (10/ 18/ 10/ 16/ 14/ 14)
#### Corwin - Archer (15/ 16/ 14/ 10/ 13/ 9)
#### Voghiln - Skald (14/ 14/ 14/ 13/ 9/ 15)
#### M'Khiin - Shaman (10/ 18/ 14/ 10/ 10/ 16)
#### Glint - Cleric (12/ 10/ 16/ 10/ 16/ 14)

### BG 2

#### Minsc - Barbarian (18/ 14/ 16/ 8/ 8/ 8)
#### Jaheira - Fighter/Druid (14/ 14/ 14/ 10/ 16/ 10) - as half-elf will receive +2 bonus to any ability score at level 1
#### Edwin - Conjurer (10/ 12/ 14/ 18/ 9 / 10)
#### Viconia - Cleric/Thief (10/ 18/ 10/ 16/ 14/ 14)
#### Imoen - Fighter/Mage/Thief (9/ 16/ 12/ 16/ 11/ 10)  
#### Yoshimo - Thief (10/ 18/ 12/ 14/ 10/ 10)
#### Valygar - Stalker (16/ 16/ 12/ 10/ 13/ 9)
#### Nalia - Bard (12/ 15/ 12/ 13/ 9/ 16)
#### Mazzy - Kensai (12/ 18/ 14/ 10/ 14/ 10)
#### Keldorn - Inquisitor (16/ 10/ 14/ 10/ 10/ 16)
#### Korgan - Berserker (18/ 12/ 18/ 8/ 8/ 8)
#### Jan - Mage/Thief (10/ 16/ 16/ 16/ 9/ 9)
#### Haerdalis - Blade (14/ 16/ 12/ 14/ 10/ 14)
#### Cernd - Shapeshifter (10/ 14/ 12/ 10/ 18/ 10)
#### Aerie - Cleric/Mage (10/ 18/ 10/ 16/ 16/ 12)
#### Anomen - Fighter/Cleric (15/ 14/ 14/ 10/ 15/ 10)
#### Sarevok - Fighter (18/ 16/ 16/ 16/ 10/ 10)
#### Rasaad - Sun Soul Monk (14/ 16/ 12/ 10/ 15/ 10)
#### Dorn - Blackguard (18/ 10/ 13/ 8/ 13/ 15)
#### Neera - Wild Mage (9/ 16/ 12/ 17/ 9/ 11)  - as half-elf will receive +2 bonus to any ability score at level 1
#### Wilson - Grizzly Bear (18/ 10/ 18/ 8/ 8/ 8)
#### Hexxat - Shadowdancer (16/ 20/ 12/ 18/ 12/ 14)

Note: If you do not like class/stat choices for NPC you can generally easily change it by editing the following files:

3ed\Component13\NpcBg1.tps  for Baldur's Gate 1  
3ed\Component13\NpcBg2.tps  for Baldur's Gate 2  
3ed\Component13\NpcSod.tps  for SOD    

PRIOR to mod installation. It should be relatively straightforward but if you have questions do not hesitate to ask.
It is not advised to change NPC classes by editing savegame files with the help of NearInfinity or Shadow Keeper since it might break certain scripts.


## 9. Difficulty

To compensate for new character abilities most of the enemies were made stronger, they got bonuses to AC, savingthrows, THAC0 and APR.   
Certain scripts for spell casting enemies were also changed to make battles more challenging.  
Also killing greater basiliscs in BG1 now gives only 2800 experience points (instead of 7000).

Note: these changes only apply if Component [More powerful enemies] is installed.

## 10. Miscellaneous

Since giving class dependent abilities to characters on level up involves running big number of scripts the way the characters level up was slightly changed.
Now it is generally impossible to raise character level by more than one through level-up.
Once the character gets enough experience points for next level he kind of stops getting any more experience until he level ups (he still gains it, but it is not reflected on the character sheet),
once you level up, the character will get back all missing experience points within limit of next level and so on.

If you character suddenly receives a lot of XP points (through console for example) to raise for several levels the script might generally take few seconds to kick on and readjust XP points,
so please wait till it runs, and level up only after, otherwise you risk not to receive certain abilities.


Also different class or feat bonuses/penalties related to equipped weapons/armor generally do not take effect immediately on item equipment but approximately 1 second after.
