


















# Baldurs-gate-dnd-3.5
This is a WeiDu mod for BG:Enchanced edition that changes 2ed ADnD rules to DnD 3.5 with some elements taken from Pathfinder.  
It changes game mechanics (i.e classes, spells, abilities, etc...) to that of 3.5 edition (to the extent that game engine allows).
# Installation

Put all files to Game folder (the one which contains Baldur.exe) and run Setup-3ed.exe, choose to install ALL components.
in C:\Users\UserName\Documents\Baldur's Gate - Enhanced Edition folder find file Baldur.lua and add the string 
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
– Increases number of spells per day that can be cast by Mages and Assassins. 
>>>>>>> b9cb7fe077dc1c0651529119f3bc887f1b4a1bc7

INT\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
12-13 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
14-15 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
16-17 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 
18-19 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 
20-21 | 2 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 
22-23 | 2 | 2 | 1 | 1 | 1 | 1 | 0 | 0 | 0 
24-25 | 2 | 2 | 2 | 1 | 1 | 1 | 1 | 0 | 0 

– Increases Saving Throw penalties for Mage and Assassin spells (i.e. effective Saving Throws of spell targets are reduced by 1 per 2 points above 10).  
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
Note: This Feat does not effect Throwing Axes.

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
```
Study Opponent:
Character can spend one round studying enemy and getting insight about its weakneses and share them to the party. The target receives a -3 penalty to AC, saving throws and THAC0. 
This is an extraordinary ability and thus is not subject to magic resistance or savingthrows, neither can be dispelled.
```
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
(1 star) - Character's spells deal 6 % more damage.  
(2 stars) - Character's spells deal 14 % more damage.  
(3 stars) - Character's spells deal 24 % more damage.  
(4 stars) - Character's spells deal 36 % more damage.  
(5 stars) - Character's spells deal 50 % more damage.  

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


Generally character cun put up to 5 stars in any proficiency unless stated otherwise and as long as it makes sense (for example since Paladins can cast spells of maximum 4th level, they can only put up to 3 stars in Bonus Priest Spell feat).


## Races
### HUMANS
Humans have the following traits:  
– Receive one bonus feat at level 1.  
– +5% to all thieving skills.  

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


## Classes

All the classes we changed to better correspond to the DND 3.5 Edition countreparts (or Pathfinder ones), some of the kits were completely replaced or completely removed. Dual-classing was disabled (instead humans can now choose any multi-class) since with the feat system it becomes uterly unfair (dual-class characters would gain twice the number of feats). Triple multi-classes were also removed. The experience progression of double multi-classes were changed so that with same amount of experience they will have the same level as single classes (i.e. a for example with 160 000 experience a single class Fighter will reach level 9, same as Fighter/Mage will reach level 9/9), although the abilities they get we changed so that instead of being almost a direct sum of 2 single classes they now correspond more to Pathfinder  hybrid classes which gain a mix of certain traits of both parent classes as well receiving some unique abilities. 

### FIGHTER
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon.  
– May get five stars in any weapon category.  
– Gets one bonus feat at level 1 and at every even level.  
– At 1st level gets Armor Training with leather and studded leather armor passive feat that allows to ignore armor skill penalties and maximum dexterity AC bonus values. Gets Armor Training with hide armor and chainmails at level 4, splint mails at level 8, plate mails at level 12 and finally full plate mails at level 16.  
– Hit Die: d10  

### BERSERKER
Advantages:
– Hit Die: d12  
– Bonus Feats: at level 1 Berserker receives Warfare (1):Power Attack, at level 3 she receives Warfare (2):Cleave.  
– May use Rage ability once per day. Gains one use at level 1, additional uses at levels 4, 8, 12 and 16.  
```
RAGE: The enraged state lasts for 6 rounds. While enraged, a Berserker gains a bonus of +2 to <PRO_HISHER> attack and damage rolls as well as 10% physical damage reduction but suffers -2 penalty to <PRO_HISHER> Armor Class, and becomes immune to charm, confusion, fear, feeblemind, hold, imprisonment, level drain, maze, stun, and sleep.
At 8th the attack and damage rolls bonus increases to +3 and physical damage resistance bonus to 20%.
At 16th level the attack and damage rolls bonus increases to +5 and physical damage resistance bonus to 30%.
```
– 8th level: Endless Berserk: Berserker can prolong her rage if the combat lasts too long, while enraged she can spend an extra use of her Rage to prolong it for a new full duration, she does not feel the tiring effects until the end of this new Rage, she can continue to prolong the Rage as long as she has Rages.  
– 12th level: Improved Power Attack: Power attack damage bonus is increased to +5.  
– 16th level: Supreme Power Attack:  Power attack damage bonus is further increased to +6.  
– 18th level: Immortal Berserker: The hit points of enraged Berserker can not be reduced below 1, but at the end of Rage Berserker receives 1 point of damage which can kill her if she has only 1 hit point.   
Note: although her hit points can not be reduced below 1, Berserker can still be killed by spells like Slay Living, Desintegrate and others.
– 20th level: Last Berserk: Berserker gains one use per day of special form of Rage called Last Berserk. It has the same effect as normal Rage and Berserker also receives +10 damage bonus on damage rolls (to a total of +15). However it can not be prolonged and after it ends Berserker can no longer use Rage for next 8 hours.  

Disadvantages:  
– Becomes winded after berserking: -2 penalty to Armor Class, to-hit rolls, and damage rolls.  
– Can not use ranged weapons.  
– Does not get bonus feats like trueclass fighters do.  
– May only put one star in any weapon she can use.  
– May not wear armor heavier than splint mail.  
– Alignment restricted to any non-lawful.  

### WIZARD SLAYER
Advantages:  
– Each successful hit bestows a 25% cumulative chance of spell failure on the target.  
– Each successful hit has a 30% chance to remove spell protections from a mage (like Breach spell).  
– Magic Resistance: 25% +2% per level to a maximum of 85% at level 30.  

Disadvantages:  
– Does not get bonus feats like trueclass fighters do.  
– May only put one star in any weapon category she can use.  
– May use only light armor.  

### KENSAI
Advantages:  
– Gains +1 bonus to AC for every 2 points of Wisdom above 10.  
– +1 to hit and damage rolls every 4 levels.  
– -1 bonus to Speed Factor every 4 levels.  
– Signature Weapon Category: At level 1 Kensai chooses one weapon category which becomes his Signature Weapon Category. At level 1 Kensai gets for free Weapon Focus with this category, at level 4 - Weapon Specialization, at level 8 - Improved Weapon Focus, at level 12 - Improved Weapon Specialization.  
– May use the Kai ability once per day. Gains one use at level 1 then at level 5 and an additional use every 5 levels thereafter.  
```
KAI: All successful attacks within the next 10 seconds deal maximum damage.
```
Disadvantages:  
– May only wear light armor.  
– May not use missile weapons.  
– May not use shields.  
– Does not get bonus feats like trueclass fighters do.  
– May only put one star in any weapon category she can use.  
– Alignment restricted to any non-chaotic.  

### BARBARIAN
CLASS FEATURES:  
– May not wear armor heavier than splint mail.  
– May only get 1 star with any weapon class.  
– Moves 2 points faster than other characters.  
– Immune to sneak attack.  
– Gets one bonus feat at level 5 and every 5 levels thereafter.  
– May use the Rage ability once per day. Gains one use at level 1, then at level 4 and an additional use every 4 levels thereafter.  
```
RAGE: The enraged status lasts for 10 rounds and provides a +4 bonus to Strength and Constitution, a -2 penalty to Armor Class and a +2 bonus to Saving Throws vs. Spell, as well as immunity to all charm, hold, fear, maze, stun, sleep, confusion, and level drain spells.
At the end of the rage, the character loses the rage modifiers and becomes fatigued (-2 penalty to Strength, -2 penalty to Dexterity) for the duration of 5 rounds.
```
– 7th level: Gains 5% resistance to crushing, slashing, piercing, and missile damage. An additional 5% is gained every 3 levels thereafter.  
– 11th level: Greater Rage: Barbarian’s Rage bonuses to Strength and Constitution during his rage each increase to +6, and his morale bonus on saves  vs. Spell increases to +6. The penalty to AC remains at -2.  
– 17th level: Tireless Rage: Barbarian is no longer fatigued after the rage ends.  
– 20th level: Mighty Rage: Barbarian’s Rage bonuses to Strength and Constitution during his rage each increase to +8, and his morale bonus on saves  vs. Spell increases to +4. The penalty to AC remains at -2.   
– Hit Die: d12  

### DWARVEN DEFENDER
Advantages:  
– May use Defensive Stance once per day. Gains one use at level 1, one use at level 4, and an additional use every 4 levels thereafter.  
```
DEFENSIVE STANCE: For 1 turn, the Dwarven Defender gains +50% resistance to all forms of physical damage, a +2 bonus to Saving Throws, and a 50% movement rate penalty.
```
– Gains 5% resistance to crushing, slashing, piercing, and missile damage at level 3 and every 5 levels thereafter to a maximum of 20% at level 18.  
– Gets one bonus feat at level 5 and every 5 levels thereafter.  
– Hit Die: d12  

Disadvantages:  
– Race restricted to dwarf.  
– Does not get bonus feats like trueclass fighters do.  
– May only put one star in any weapon she can use.  

### PALADIN
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon.  
– May use Lay On Hands ability once per day for every 2 points of Charisma above 10 to heal a target for 2 Hit Points per level of the Paladin.  
– Starting from level 6 Lay On Hands ability also cures disease.  
– Starting from level 9 Lay On Hands ability also cures poison.  
– May cast Detect Evil once per day per level (starts at 1st level with 4 uses).  
– May channel positive energy starting from level 3 number of times per day equal to 1 per 2 points of Charisma above 10 as good clerics (4d4 damage/healing at level 3 plus 2d4 per 2 levels up to 20d4).  
```
CHANNEL POSITIVE ENERGY:  Priest creates a burst of positive energy that affects all creatures  in a 30-foot radius centered on her.
All allied living creatures are healed for 2d4 hit points per Channel Energy Level of the caster.
All hostile undead creatures suffer 2d4 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster level rounded down. In which case they receive only half damage.
```
– May cast priest spells starting at level 4.  
– May use Smite Evil ability. Gains one use per day at level 1, level 5 and every 5 levels thereafter.  
```
SMITE EVIL: For 10 seconds Paladin receives +1 bonus to her attack roll per 2 points of Charisma above 10 and deals 1 extra point of damage per paladin level against evil creatures.
```
– Receives a bonus to all saving throws for every 2 points of Charisma above 9 (i.e +1 at 11, +2 at 13, etc) and penalty for every 2 points below 10.  
– Alignment restricted to lawful good.  
– Hit Die: d10  

### CAVALIER
Advantages:  
– +3 bonus to hit and damage rolls against all fiendish and draconic creatures.  
– May cast Remove Fear once per day per level.  
– Immune to charm, fear, poison, and morale failure.  
– 20% resistance to fire and acid.  

Disadvantages:  
– May not use Smite Evil ability.  
– May not use missile weapons.  

### INQUISITOR
Advantages:  
– May cast Dispel Magic once per day. Gains one use at level 1 and an additional use every 4 levels thereafter. The spell is cast at Speed Factor 1 and acts at twice the Inquisitor's character level.   
– May cast True Sight once per day. Gains one use at level 1 and an additional use every 4 levels thereafter.
– Immune to hold and charm.  

Disadvantages:  
– May not channel positive energy.  
– May not use the Lay On Hands ability.   
– May not use Smite Evil ability.  
– May not cast priest spells.  

### UNDEAD HUNTER
Advantages:  
– +3 bonus to hit and damage rolls against undead creatures.  
– Immune to hold and level drain.  
– May use Smite Undead ability. Gains one use per day at level 1, level 5 and every 5 levels thereafter.  
```
SMITE UNDEAD: For 10 seconds Undead Hunter receives +1 bonus to <PRO_HISHER> attack roll per 2 points of Charisma above 10 and deals 1 extra point of damage per paladin level against undead creatures.
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
All allied undead creatures are healed for 2d4 hit points per Channel Energy Level of the caster.
All hostile living creatures suffer 2d4 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster rounded down. In which case they receive only half damage.
```
– May use the Absorb Health ability once per day per 2 points of Charisma above 10.  
```
ABSORB HEALTH:
Deals 2 points of damage per level to an enemy, healing the Blackguard the same number of Hit Points.
```
– May use the Poison Weapon ability once per day. Gains one use at level 1, one use at level 5, and an additional use every 5 levels thereafter.  
```
POISON WEAPON:
Each successful hit within the next 5 rounds will inject poison into the target. Each target can only be affected once per round. The amount of poison damage depends on the character's level:

1st - Target suffers 1 poison damage per second for 6 seconds (Save vs. Death at +1 negates)
4th - Target suffers 1 poison damage per second for 12 seconds (Save vs. Death negates), and also immediately suffers 2 poison damage (no save)
8th - Target suffers 1 poison damage per second for 18 seconds (Save vs. Death at -1 negates), and also immediately suffers 4 poison damage (no save)
12th - Target suffers 1 poison damage per second for 24 seconds (Save vs. Death at -2 negates), and also immediately suffers 6 poison damage (no save)
```
– 3rd level: May use the Aura of Despair ability once per day.  
```
AURA OF DESPAIR:
When this ability is activated, all enemies within 30 feet of the Blackguard suffer ill effects based on the Blackguard's level:
  3rd - All enemies suffer a -1 penalty to hit and damage rolls and a -2 penalty to Armor Class for 1 turn.
  6th - All enemies suffer a -2 penalty to hit and damage rolls and a -2 penalty to Armor Class for 1 turn.
  15th - All enemies suffer a -4 penalty to hit and damage rolls and a -4 penalty to Armor Class for 1 turn; enemies with 8 or fewer Hit Dice are panicked as well.
  20th - All enemies suffer a -4 penalty to hit and damage rolls and a -4 penalty to Armor Class for 1 turn; enemies with 18 or fewer Hit Dice are panicked as well.
```
Disadvantages:  
– Alignment restricted to evil.  
– May not cast Detect Evil.  
– May not use the Lay on Hands ability.  
– May not use Smite Evil ability.  

### RANGER
CLASS FEATURES:  
– May wear helmets.  
– May use any weapon.  
– May not wear armor heavier than splint mail.  
– Has Evasion passive ability.  
```
EVASION: this passive ability allows the target of an area attack to leap or twist out of the way. If subjected to an attack that allows a Savingthrow vs. Breath Weapon or vs. Wand for half damage, a character with evasion takes no damage on a successful save. 
```
– Bonus Feats: Ranger gets Style Focus in Two Weapon Fighting for free at level 1, Style Specialization at level 4, Greater Style Focus at level 8, Greater Style Specialziation at level 12 and Style Mastery at level 16.  
– May select one racial enemy at levels 1, 5, 10, 15, 20, which grants a +4 bonus on damage rolls against the selected enemy race.
– May use the Charm Animal ability once per day. Gains one use at level 1 and an additional use every 2 levels thereafter.
– May use the Hide In Shadows ability.  
– May call for an animal companion who fights for her side.  
– May cast druidic spells starting at level 4.  
– Alignment restricted to good.  
– Hit Die: d10  



### ARCHER
Advantages:
– Bonus Feats: Archer gets Style Focus in Archery for free at level 1, Style Specialization at level 4, Greater Style Focus at level 8, Greater Style Specialziation at level 12 and Style Mastery at level 16.  
– Once per day can create 40 arrows (starts with normal arrows at level 1, which become +1 at lvl 4, +2 at lvl 8, +3 at lvl 12, +4 at lvl 16 and +5 at lvl 20).  
– May use the Called Shot ability once per day. Gains one use at level 4 and an additional use every 2 levels thereafter.  
```
CALLED SHOT: All successful ranged attacks within the next 10 seconds have the following cumulative effects besides normal damage, according to the level of the Archer:
 4th level: -2 penalty to target's THAC0.
 8th level: -2 penalty to target's Saving Throws vs. Spell.
 12th level: -2 penalty to the target's Strength score.
 16th level: +4 bonus to damage roll.
```
Disadvantages:  
– Do not gain Bonus Feats in Two Weapon Fighting Style.  
– May only wear light armor.  
– May not use the Charm Animal ability.  

### BEAST MASTER
Advantages:
– +15% to Move Silently and Hide In Shadows.  
– Has a telepathic link with his animal companion which allows them to fight as one. When fighting close to each other Beast master and his animal companion get +1 To Hit, Damage, AC and Saving Throws. This bonuses increase to +2 at level 7,  +3 at level 14 and +4 at level 20.  
– Hit Die: d12.  

Disadvantages:
– Does not gain Bonus Feats in Two Weapon Fighting Style.  
– May use only weapons available to druids as well as axes, longbows and shortbows.  
– May only wear armor a druid can.  

### STALKER
Advantages:  
– +20% to Move Silently and Hide In Shadows.  
– May Sneak attack for increased damage: 1d6 at level 3 + 1d6 every 5 levels thereafter.  
– Racial Enemy is replaced with Improved Racial Enemy which gives Stalkers +4 bonus on to hit and damage rolls and +2 bonus to AC and savingthrows vs selected races.  
– May be of any alignment.  

Disadvantages:
– Do not gain Bonus Feats in Two Weapon Fighting Style.
– May only wear light armor.
– May not use the Charm Animal ability.

### CLERIC
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor.  
– May only use non-bladed, non-piercing weapons (war hammer, club, flail, mace, quarterstaff, sling).  
– May only become Proficient (one star) in any weapon class.  
– May channel positive (good and neutral clerics) or negative (evil clerics) energy starting from level 1 number of times per day equal to 1 + 1 per 2 points of Charisma above 10. (2d4 damage/healing at level 1 plus 2d4 per 2 levels up to 20d4).  
```
CHANNEL POSITIVE ENERGY:  Priest creates a burst of positive energy that affects all creatures  in a 30-foot radius centered on her.
All allied living creatures are healed for 2d4 hit points per Channel Energy Level of the caster.
All hostile undead creatures suffer 2d4 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster level rounded down. In which case they receive only half damage.
```
```
CHANNEL NEGATIVE ENERGY:  Priest creates a burst of negative energy that affects all creatures  in a 30-foot radius centered on her.
All allied undead creatures are healed for 2d4 hit points per Channel Energy Level of the caster.
All hostile living creatures suffer 2d4 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster level rounded down. In which case they receive only half damage.
```
– May cast priest spells.  
– May spontaneously convert memorized spells to healing ones (Good and Neutral Clerics) or harming ones (Evil Clerics).  
– At 1st level chooses a domain that grants <PRO_HIMHER> access to additional spells, normally not available to Clerics of other domains.
– Hit Die: d8  

### FIGHTER/THIEF
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon.  
– May get up to Greater Weapon Specialization (4 stars) in any weapon they can use.  
– Have THAC0 and APR progression of a thief.  
– May distribute 16 skill points per level among thieving skills (24 points at level 1).  
– Gets one bonus feat at level 1 and every 3 levels thereafter.  
– May Sneak attack for increased damage: 1d6 at level 3 + 1d6 every 5 levels thereafter.  
– At 1st level gets Armor Training with leather and studded leather armor passive feat that allows to ignore armor skill and AC penalties.  
Gets Armor Training with hide armor and chainmails at level 4, splint mails at level 8, plate mails at level 12 and finally full plate mails at level 16.  
– Hit Die: d8  

### FIGHTER/CLERIC
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon.  
– May get up to Greater Weapon Specialization (4 stars) in any weapon they can use.  
– Have THAC0 and APR progression of a cleric.  
– Can cast two spell per day less than trueclass cleric.  
– Gets one bonus feat at level 1 and at every 4th level.  
– May channel positive (good and neutral clerics) or negative (evil clerics) energy starting from level 2 number of times per day equal to 1 + 1 per 2 points of Charisma above 10. (2d4 damage/healing at level 2 plus 2d4 per 4 levels up to 10d4).  
– Can use Spontaneous Battlecasting.  
```
SPONTANEOUS BATTLE CASTING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into her weapon(s) to get +1 on to hit and damage rolls per level of sacrificed spell for 10 seconds. 
```
– At 1st level chooses a domain that grants <PRO_HIMHER> access to additional spells, normally not available to Clerics of other domains.  
– Hit Die: d9  
	
### FIGHTER/MAGE
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon.  
– May get up to Greater Weapon Focus (3 stars) in any weapon they can use.  
– Have THAC0 and APR progression of a cleric.  
– Can cast one spell less per day than trueclass mage.  
– Cannot cast spells of 8th and 9th levels.  
– Gets one bonus feat at level 5 and at every 5 levels thereafter.  
– At 1st level receives for free Armored Arcana(1): Light Armor Casting. At level 4 receives Armored Arcana(2): Chain Mail Casting, at level 8 Armored Arcana(3): Splint Mail Casting, at level 12 Armored Arcana(4): Plate Mail Casting and finally at level 16 Armored Arcana(5): Full Plate Mail Casting.  
– Can use Spontaneous Battlecasting.  
```
SPONTANEOUS BATTLE CASTING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into <PRO_HISHER> weapon(s) to get +1 on to hit and damage rolls per level of sacrificed spell for 10 seconds.
```
– Hit Die: d7  
NOTE: Gnomes can choose this class, but become Fighter/Illusionists by default. Gnomes are the only race that can combine a specialist Mage class in a hybrid class.  

### FIGHTER/DRUID
CLASS FEATURES:  
– May wear helmets.  
– May wear light and medium armor and use any weapon.  
– May get up to Greater Weapon Specialization (4 stars) in any weapon they can use.  
– Have THAC0 and APR progression of a druid.  
– Can cast two spell per day less than trueclass druid.  
– Bonus Feats: Fighter/Druid gets Style Focus in Archery for free at level 1, Style Specialization at level 4, Greater Style Focus at level 8, Greater Style Specialziation at level 12 and Style Mastery at level 16.  
– May spontaneously convert memorized spells to summoning ones.  
– May select one racial enemy at levels 1, 5, 10, 15, 20, which grants a +4 bonus on damage rolls against the selected enemy race.
– May call for an animal companion who fights for her side.  
– Hit Die: d9		 

### CLERIC/RANGER
CLASS FEATURES:	  
– May wear helmets.  
– May use any weapon.  
– May not wear armor heavier than splint mail.  
– Have THAC0 and APR progression of a cleric.  
– Bonus Feats: Cleric/Ranger gets Style Focus in Two Weapon Fighting for free at level 1, Style Specialization at level 4, Greater Style Focus at level 8, Greater Style Specialziation at level 12 and Style Mastery at level 16.  
– May select one racial enemy at levels 1, 5, 10, 15, 20, which grants a +4 bonus on damage rolls against the selected enemy race.  
– May use the Charm Animal ability once per day. Gains one use at level 1 and an additional use every 2 levels thereafter.  
– May use the Hide In Shadows ability.  
– Can cast two spells per day less than trueclass clerics.  
– Can spontaneously convert memorized spells into healing ones.  
– Eventually can cast low level druidic spells (same as trueclass ranger).  
– At 1st level chooses a domain that grants her access to additional spells, normally not available to Clerics of other domains.
– Alignment restricted to good.  
– Hit Die: d9  

### CLERIC/MAGE: This is a hybrid class that can use the abilities of a Cleric and a Mage.	
CLASS FEATURES:  
– May not wear any armor.  
– May only use the following weapons: dagger, quarterstaff, dart, sling, crossbow, mace, flail, morning star, war hammer.  
– May cast both arcane and divine cleric spells.  	  
– Can cast two arcane spells per day less than trueclass mage.  
– Can cast three divine spells per day less than trueclass cleric.  
– At 1st level chooses a domain that grants her access to additional spells, normally not available to Clerics of other domains.  
– Hit Die: d6  
NOTE: Gnomes can choose this hybrid class, but become Cleric/Illusionists by default. Gnomes are the only race that can combine a specialist Mage class in a hybrid class.  

### CLERIC/THIEF: This is a hybrid class that can use the abilities of a Cleric and a Thief.	
CLASS FEATURES:  
– May not wear armor heavier than studded leather.  
– May not equip shields larger than bucklers.  
– May only use the following weapons: long sword, short sword, katana, scimitar, dagger, club, quarterstaff, crossbow, shortbow, dart, sling, mace, flail, morning star, war hammer.  
– Have THAC0 and APR progression of a cleric.  	  
– Can cast two spell per day less than trueclass clerics.  
– May distribute 16 skill points per level among thieving skills (24 points at level 1).  
– May Sneak attack for increased damage: 1d6 at level 3 + 1d6 every 5 levels thereafter.  
– May use the Set Snare ability once per day. Gains one use at levels 1, 5, 10, 15 and 20.  
– May channel positive (good and neutral clerics) or negative (evil clerics) energy starting from level 2 number of times per day equal to 1 + 1 per 2 points of Charisma above 10. (2d4 damage/healing at level 2 plus 2d4 per 4 levels up to 10d4).  

– May use Spontaneous Spell Channeling
```
SPONTANEOUS SPELL CHANNELING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into <PRO_HISHER> weapon(s) to add number of 1d4 dice equal to level of sacrificed spell to <PRO_HISHER> sneak attack damage for next 10 seconds. Ability lasts for 3 rounds, or until the first spell is sacrificed.
```
– At 1st level chooses a domain that grants <PRO_HIMHER> access to additional spells, normally not available to Clerics of other domains.  
– Hit Die: d7  

