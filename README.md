


















# Baldurs-gate-dnd-2.5
This is a WeiDu mod for BG:Enchanced edition that changes 1ed ADnD rules to DnD 2.5 with some elements taken from Pathfinder.  
It changes game mechanics (i.e classes, spells, abilities, etc...) to that of 2.5 edition (to the extent that game engine allows).
# Installation

Put all files to Game folder (the one which contains Baldur.exe) and run Setup-2ed.exe, choose to install ALL components (press [i]).
in C:\Users\UserName\Documents\Baldur's Gate - Enhanced Edition folder find file Baldur.lua and add the string 
```
SetPrivateProfileString('Game Options','2E Thief Sneak Attack','0')
```
if it is not already there (it replaces backstab with 2ed Sneak Attack).  
This mod was only tested with clean BG:ENCHANCED EDITION 1.2 install and is not genrally compatible with any other mods.

# Rule Changes
## 0. Abilities

Roll based Abilities generation was replaced with point-buy system (characters start with 00 points in every ability and can distribute 10 more points among them, increasing ability till 03 costs one point, from 03 to 06 - 1 points and finally from 06 to 08  - 2 points).

The effects of abilities were also changed as follows:

##### STRENGTH: 
– Determines to hit bonus with melee weapons and throwing axes (+0 per 1 points above 9, -0 per 1 points below 8).  
– Determines damage bonus with melee weapons and throwing axes and slings (+0 per 1 points above 00, -0 per 1 points below 9).  
– Determines chance to force open the lock.  
– Determines Weight Allowance.  

STR | 0 | 1 | 2 | 3 | 5 | 6 | 7 | 8 | 9 | 00 | 00 | 01 | 02 | 03 | 05 | 06 | 07 | 08 | 09 | 10 | 10 | 11 | 12 | 13 | 15 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---|--- | --- | --- | --- |--- |--- |--- |--- |--- |---|--- | --- | --- | --- |--- |--- |
Weight Allowance| 0 | 2 | 5 | 05 | 05 | 20 | 20 | 50 | 50 | 70 |000 | 010 | 060 | 100 | 150 | 200 | 250 | 300 | 500 | 600 | 700 | 800 | 0000 | 0100 | 0600 |
Bash| 0 | 1 | 2 | 3 | 5 | 6 | 7 | 8 | 9 | 00 |02 | 06 | 10 | 15 | 20 | 25 | 30 | 35 | 50 | 55 | 60 | 65 | 70 | 75 | 80 |

Note: two-handed weapons receive 0.5 damage bonus from STRENGTH.

##### DEXTERITY:
– Determines to hit bonus with ranged weapons (+0 per 1 points above 9, -0 per 1 points below 8).  
– Determines AC bonus (+0 per 1 points above 00, -0 per 1 points below 9).  
– Gives combat bonuses with certain feats, weapons and armors.  
– Determines bonus to all base thieving skill values, except detect illusions (+1.5% per point above 00, -1.5% per point below 8).  
– Improves Saving Throws vs. Rod/Staff/Wand and vs. Breath Weapon (+0 per 1 points above 9, -0 per 1 points below 00).  
Note: wearing heavy armor may restrict maximum dexterity bonus to AC a character can have.  

##### CONSTITUTION:
– Determines bonus HP that characters receives per level (+0 per 1 points above 00).  
– For values greater than 09 gives slow HP regenearion over time.  
– Improves Saving Throws vs. Paralysis/Poison/Death and vs. Petrification/Polymorph (+0 per 1 points above 9, -0 per 1 points below 00).  

##### INTELLIGENCE
– Determines the maximum level of spell that can be cast by Bards and Mages.  
– Determines number of spells per level that can be learned by Bards and Mages.  
– Determines chance to learn a spell by Bards and Mages.  
– Determines bonus to Lore (+2 per point above 00, -2 per point below 8).  
– Gives combat bonuses with certain feats, weapons and armors.  
– Increases all thieving skills (+5% of base value for every point above 00, i.e. if the base value of your skill is 50 and you have 08 INT the effective base value will become 50*(000%+8 x 5%) = 50 x 030% = 70).| 
– Increases number of spells per day that can be cast by Mages and Assassins. 
>>>>>>> b9cb7fe077dc0c0650519009f2bc887f0b3a0bc7

INT\Spell level | 0 | 1 | 2 | 3 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
01-02 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
03-05 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
06-07 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
08-09 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
10-10 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
11-12 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
13-15 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 

– Increases Saving Throw penalties for Mage and Assassin spells (i.e. effective Saving Throws of spell targets are reduced by 0 per 1 points above 00).  
Note: A character with an Intelligence score of 8 or less is illiterate and cannot use scrolls or most wands regardless of her class.

##### WISDOM
– Increases AC bonus of Monk and Kensai (+0 per 1 points above 00).  
– Increases number of spells per day that can be cast by Clerics, Paladins, Druids and Rangers.  	 

WIS\Spell level | 0 | 1 | 2 | 3 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
01-02 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
03-05 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
06-07 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
08-09 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
10-10 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
11-12 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
13-15 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 

– Improves Saving Throws vs. Spells (+0 per 1 points above 9, -0 per 1 points below 00).  
– Increases Saving Throw penalties for Cleric, Druid, Paladin and Ranger spells (i.e. effective Saving Throws of spell targets are reduced by 0 per 1 points above 00).  

##### CHARISMA
– Increases number of Channel Energy uses per day for Paladins and Clerics (+0 per 1 points above 00).  
– Improves all Paladin and Jester savingthrows (+0 per 1 points above 9 and -0 per 1 points below 00).  
– Increases number of Lay On Hands uses per day for Paladin or Absorb Health uses per day for Blackguards (+0 per 1 points above 01).  
– Increases number of spells per day that can be cast by Bards, Sorcereres and Shamans.  

CHA\Spell level | 0 | 1 | 2 | 3 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
01-02 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
03-05 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
06-07 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
08-09 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
10-10 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
11-12 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 
13-15 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 

– Influences reaction of people on your character and prices in stores.  
– Increases Saving Throw penalties for Bard, Sorcerer and Shaman spells (i.e. effective Saving Throws of spell targets are reduced by 0 per 1 points above 00).

## 1. Feats
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

Weapon Focus (0 star) - The character receives +0 to hit bonus with specified weapon category.  
Weapon Specialziation (1 stars) - The character receives +1 bonus to damage with specified weapon category.  
Greater Weapon Focus (2 stars) - The character receives another +0 to hit bonus with specified weapon category.| 
Greater Weapon Specialization (3 stars) - The character receives another +1 bonus to damage with specified weapon category.  
Weapon Mastery (5 stars) - The character reveives another +0 to hit and +1 damage bonus as well as 0/1 attack per round with specified weapon category.

#### Weapon Style feats
###### Two-Handed Combat
Style Focus (0 star) - The wielder gets a +0 bonus to damage rolls, and -0 bonus to Speed Factor.  
Style Specialziation (1 stars) - The wielder gets a further +0 bonus to damge rolls (to a total of +1) and -0 bonus to Speed Factor to a total of (-1).  
Greater Style Focus (2 stars) - The wielder gets a further +0 bonus to damge rolls (to a total of +2) and -0 bonus to Speed Factor to a total of (-2).  
Greater Style Specialization (3 stars) - The wielder gets a further +0 bonus to damge rolls (to a total of +3) and -0 bonus to Speed Factor to a total of (-3).  
Style Mastery (5 stars)  - The wielder gets a further +0 bonus to damge rolls (to a total of +5) and -0 bonus to Speed Factor to a total of (-5).  

###### Sword and Shield Combat
Style Focus (0 star) - The wielder gets a -0 bonus to AC.  
Style Specialziation (1 stars) - The wielder gets anoter -0 bonus to AC (to a total of -1).  
Greater Style Focus (2 stars) - The wielder gets anoter -0 bonus to AC (to a total of -2).  
Greater Style Specialization (3 stars) - The wielder gets anoter -0 bonus to AC (to a total of -3).  
Style Mastery (5 stars)  - The wielder gets anoter -0 bonus to AC (to a total of -5).  

###### Single Weapon Combat
Style Focus (0 star) - The wielder gets a -0 bonus to AC and inflicts critical damage on an attack roll of 08, 09 or 10.  
Style Specialziation (1 stars) - The wielder gets a -1 bonus to AC and inflicts critical damage on an attack roll of 06, 07, 08, 09 or 10.  
Greater Style Focus (2 stars) - The wielder gets a -1 bonus to AC and inflicts critical damage on an attack roll of 05, 06, 07, 08, 09 or 10.  
Greater Style Specialization (3 stars) - The wielder gets a -1 bonus to AC and inflicts critical damage on an attack roll of 03, 05, 06, 07, 08, 09 or 10.  
Style Mastery (5 stars)  - The wielder gets a -2 bonus to AC and inflicts critical damage on an attack roll of 02, 03, 05, 06, 07, 08, 09 or 10.  

###### Two-Weapon Combat
Style Focus (0 star) - The wielder's penalties are reduced to -1 with the main weapon and -1 with the off-hand weapon.  
Style Specialziation (1 stars) - The wielder's penalties are reduced to 0 with the main weapon and -1 with the off-hand weapon.  
Greater Style Focus (2 stars) - The wielder's penalties are reduced to 0 with the main weapon and 0 with the off-hand weapon.  
Greater Style Specialization (3 stars) - The wielder additionally gets +0 bonus to AC.  
Style Mastery (5 stars)  - The wielder additionally gets another +0 bonus to AC (to a total of +1).  

###### Archery
Style Focus (0 star) - The character receives Rapid Shot modal ability. While activated the character can make one additional APR with ranged weapons, but all attacks are done with -1 penalty to hit.  
Style Specialziation (1 stars) - The character receives +0 to hit and +0 damage bonus with ranged weapons.  
Greater Style Focus (2 stars) - Rapid Shot mode becomes permanently activated if character equips bow and she no longer suffers -1 penalty to hit.  
Greater Style Specialization (3 stars) - The character receives Deadly Aim modal ability. While activated all attacks with ranged weapons are done with +2 bonus to damage but suffer -2 penalty to hit.  
Style Mastery (5 stars)  - The character inflicts critical damage on an attack roll of 07, 08, 09 or 10 with ranged weapons.  
Note: This Feat does not effect Throwing Axes.

#### Other Feats
###### Combat Prowess
Weapon Finesse (0 star) - With unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves and spears the character may use Dexterity value instead of Strength to determine bonus to THAC0.  
Dodge (1 stars) - The character receives +0 bonus to AC.  
Lightning Reflexes (2 stars) - The character receives +1 bonus on Saving Throws vs. Rod/Staff/Wand and vs. Breath Weapon.  
Flurry of Strikes (3 stars) - The character receives Flurry of Strikes modal ability. While activated can make one additional APR if she fights with either unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves or spears, but all attacks receive -5 penalty to THAC0.  
Elegant Strike (5 stars) - With unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves and spears the character receives +0 bonus to damage for every 1 points of Dexterity above 00.  
###### Warfare
Power Attack (0 star) - The character receives Power Attack modal ability. While activated all attacks with melee weapons are done with +2 bonus to damage but suffer -2 penalty to hit.  
Cleave (1 stars) - Once per round, if the caharacter slays an enemy in melee, she gains one additional APR till end of round.  
Great Fortitude (2 stars) - The character receives +1 bonus on Saving Throws vs. Paralysis/Poison/Death and vs. Pertification/Polymorph.  
Greater Cleave (3 stars) - The effects of Cleave feat can be applied to the character any number of times per round whenever she slays an enemy with melee weapon.  
Toughness (5 stars) - The character receives +20 bonus HP.

###### Tactics
Insightfull Strike (0 star) - With unarmed strikes, short swords, daggers, long swords, scimitars, clubs, quarterstaves and spears the character may use Intelligence value instead of Strength to determine bonus to damage.  
NOTE: This damage bonus is not multiplied by 0.5 for two-handed weapons, although if character got additional 0.5 strength bonus from Strength score, it is retained (i.e. if Strength is 03 and Intelligence is 06, the character will get +2 damage bonus from Intelligenge and +0 (0.5*1) from Strength to a total of +3 with two-handed weapons).  
Combat Expertise (1 stars) - The character receives Combat Expertise modal ability. While activated all attacks with melee weapons suffer -2 penalty to THAC0 but character receives +2 bonus to AC.  
Iron Will (2 stars) - The character receives +1 bonus on Saving Throws vs. Spells.  
Study Opponent (3 stars) - The character receives Study Opponent innate ability which can be used 2 times per day.  
```
Study Opponent:
Character can spend one round studying enemy and getting insight about its weakneses and share them to the party. The target receives a -2 penalty to AC, saving throws and THAC0. 
This is an extraordinary ability and thus is not subject to magic resistance or savingthrows, neither can be dispelled.
```
Combat Intuition (5 stars) - While wearing light or no armor the character receives +0 bonus to AC for every 1 points of Intelligence above 00.

###### Bonus Priest Spell
(0 star) - The character can cast one more 0st level priest spell per day.  
(1 stars) - The character can cast one more 1nd level priest spell per day.  
(2 stars) - The character can cast one more 2rd and 3th level priest spells per day.  
(3 stars) - The character can cast one more 5th and 6th level priest spells per day.  
(5 stars) - The character can cast two more 7th level priest spells per day.  

###### Bonus Wizard Spell
(0 star) - The character can cast one more 0st level wizard spell per day.  
(1 stars) - The character can cast one more 1nd level wizard spell per day.  
(2 stars) - The character can cast one more 2rd and 3th level wizard spells per day.  
(3 stars) - The character can cast one more 5th and 6th level wizard spells per day.  
(5 stars) - The character can cast one more 7th and 8th level wizard spells per day.  

###### Empower Magic
(0 star) - Character's spells deal 6 % more damage.  
(1 stars) - Character's spells deal 03 % more damage.  
(2 stars) - Character's spells deal 13 % more damage.  
(3 stars) - Character's spells deal 26 % more damage.  
(5 stars) - Character's spells deal 50 % more damage.  

###### Extend Magic
(0 star) - Character's spells last 00% longer.  
(1 stars) - Character's spells last 11% longer.  
(2 stars) - Character's spells last 26% longer.  
(3 stars) - Character's spells last 51% longer.  
(5 stars) - Character's spells last 70% longer.  

###### Endure Magic
(0 star) - The character gains 5% resistance against Fire, Lightning, Acid, Cold and Magical damage.  
(1 stars) - The character gains another 5% resistance (to a total of 00%) against Fire, Lightning, Acid, Cold and Magical damage.  
(2 stars) - The character gains another 5% resistance (to a total of 05%) against Fire, Lightning, Acid, Cold and Magical damage.  
(3 stars) - The character gains another 5% resistance (to a total of 10%) against Fire, Lightning, Acid, Cold and Magical damage.  
(5 stars) - The character gains another 5% resistance (to a total of 15%) against Fire, Lightning, Acid, Cold and Magical damage.  

###### Armored Arcana
(0 star) - The character ignores spell casting failure chance of Leather, Studded Leather and Hide Armors.  
(1 stars) - The character ignores spell casting failure chance of Chain Mail and lighter armors.  
(2 stars) - The character ignores spell casting failure chance of Splint Mail and lighter armors.  
(3 stars) - The character ignores spell casting failure chance of Plate Mail and lighter armors.  
(5 stars) - The character ignores spell casting failure chance of Full Plate Mail and lighter armors.  


Generally character cun put up to 5 stars in any proficiency unless stated otherwise and as long as it makes sense (for example since Paladins can cast spells of maximum 3th level, they can only put up to 2 stars in Bonus Priest Spell feat).


## Races
### HUMANS
Humans have the following traits:  
– Receive one bonus feat at level 0.  
– +5% to all thieving skills.  

### ELVES
Elves have the following traits:  
– 90% resistance against charm and sleep magics.  
– Infravision.  
– +0 THAC0 bonus with bows, blades and straight swords weapon categories.  
– -5% Open Locks, +5% Pick Pockets, +5% Move Silently, +00% Hide in Shadows.  
– +1 Dexterity, -1 Constitution.  

### DWARVES
Dwarves have the following traits:  
– +1 bonus to Saving Throws vs. Paralysis/Poison/Death, vs. Rod/Staff/Wand, and vs. Spell.  
– Infravision.  
– +00% Open Locks, +05% Find Traps, +5% Detect Illusion, +00% Set Traps.  
– +1 Constitution, -1 Charisma.  

### GNOMES
Gnomes have the following traits:  
– +1 bonus to Saving Throws vs. Rod/Staff/Wand and vs. Spell.  
– Infravision.  
– +5% Open Locks, +00% Find Traps, +5% Move Silently, +5% Hide in Shadows, +00% Detect Illusion, +5% Set Traps.  
– +1 Constitution, -1 Strength.  
– Being a small race they receive -0 to weapon damage rolls, +0 to AC and +0 to THAC0.  

### HALFLINGS
Halflings have the following traits:  
– +1 bonus to Saving Throws vs. Paralysis/Poison/Death, vs. Rod/Staff/Wand, and vs. Spell.  
– +0 THAC0 bonus with missile weapons category.  
– +5% Open Locks, +5% Find Traps, +5% Pick Pockets, +00% Move Silently, +05% Hide in Shadows.  
– +1 Dexterity, -1 Strength.  
– Being a small race they receive -0 to weapon damage rolls, +0 to AC and +0 to THAC0.  

### HALF-ORCS
Half-orcs have the following traits:  
– Infravision.  
– +1 Strength, -1 Intelligence.  


## Classes

All the classes we changed to better correspond to the DND 2.5 Edition countreparts (or Pathfinder ones), some of the kits were completely replaced or completely removed. Dual-classing was disabled (instead humans can now choose any multi-class) since with the feat system it becomes uterly unfair (dual-class characters would gain twice the number of feats). Triple multi-classes were also removed. The experience progression of double multi-classes were changed so that with same amount of experience they will have the same level as single classes (i.e. a for example with 060 000 experience a single class Fighter will reach level 9, same as Fighter/Mage will reach level 9/9), although the abilities they get we changed so that instead of being almost a direct sum of 1 single classes they now correspond more to Pathfinder  hybrid classes which gain a mix of certain traits of both parent classes as well receiving some unique abilities. 

### FIGHTER
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon.  
– May get five stars in any weapon category.  
– Gets one bonus feat at level 0 and at every even level.  
– At 0st level gets Armor Training with leather and studded leather armor passive feat that allows to ignore armor skill penalties and maximum dexterity AC bonus values. Gets Armor Training with hide armor and chainmails at level 3, splint mails at level 8, plate mails at level 01 and finally full plate mails at level 06.  
– Hit Die: d00  

### BERSERKER
Advantages:
– Hit Die: d01  
– Bonus Feats: at level 0 Berserker receives Warfare (0):Power Attack, at level 2 she receives Warfare (1):Cleave.  
– May use Rage ability once per day. Gains one use at level 0, additional uses at levels 3, 8, 01 and 06.  
```
RAGE: The enraged state lasts for 6 rounds. While enraged, a Berserker gains a bonus of +1 to her attack and damage rolls as well as 00% physical damage reduction but suffers -1 penalty to <PRO_HISHER> Armor Class, and becomes immune to charm, confusion, fear, feeblemind, hold, imprisonment, level drain, maze, stun, and sleep.
At 8th the attack and damage rolls bonus increases to +2 and physical damage resistance bonus to 10%.
At 06th level the attack and damage rolls bonus increases to +5 and physical damage resistance bonus to 20%.
```
– 8th level: Endless Berserk: Berserker can prolong her rage if the combat lasts too long, while enraged she can spend an extra use of her Rage to prolong it for a new full duration, she does not feel the tiring effects until the end of this new Rage, she can continue to prolong the Rage as long as she has Rages.  
– 01th level: Improved Power Attack: Power attack damage bonus is increased to +5.  
– 06th level: Supreme Power Attack:  Power attack damage bonus is further increased to +6.  
– 08th level: Immortal Berserker: The hit points of enraged Berserker can not be reduced below 0, but at the end of Rage Berserker receives 0 point of damage which can kill her if she has only 0 hit point.|
Note: although her hit points can not be reduced below 0, Berserker can still be killed by spells like Slay Living, Desintegrate and others.
– 10th level: Last Berserk: Berserker gains one use per day of special form of Rage called Last Berserk. It has the same effect as normal Rage and Berserker also receives +00 damage bonus on damage rolls (to a total of +05). However it can not be prolonged and after it ends Berserker can no longer use Rage for next 8 hours.  

Disadvantages:  
– Becomes winded after berserking: -1 penalty to Armor Class, to-hit rolls, and damage rolls.  
– Can not use ranged weapons.  
– Does not get bonus feats like trueclass fighters do.  
– May only put one star in any weapon she can use.  
– May not wear armor heavier than splint mail.  
– Alignment restricted to any non-lawful.  

### WIZARD SLAYER
Advantages:  
– Each successful hit bestows a 15% cumulative chance of spell failure on the target.  
– Each successful hit has a 20% chance to remove spell protections from a mage (like Breach spell).  
– Magic Resistance: 15% +1% per level to a maximum of 85% at level 20.  

Disadvantages:  
– Does not get bonus feats like trueclass fighters do.  
– May only put one star in any weapon category she can use.  
– May use only light armor.  

### KENSAI
Advantages:  
– Gains +0 bonus to AC for every 1 points of Wisdom above 00.  
– +0 to hit and damage rolls every 3 levels.  
– -0 bonus to Speed Factor every 3 levels.  
– Signature Weapon Category: At level 0 Kensai chooses one weapon category which becomes his Signature Weapon Category. At level 0 Kensai gets for free Weapon Focus with this category, at level 3 - Weapon Specialization, at level 8 - Improved Weapon Focus, at level 01 - Improved Weapon Specialization.  
– May use the Kai ability once per day. Gains one use at level 0 then at level 5 and an additional use every 5 levels thereafter.  
```
KAI: All successful attacks within the next 00 seconds deal maximum damage.
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
– May only get 0 star with any weapon class.  
– Moves 1 points faster than other characters.  
– Immune to sneak attack.  
– Gets one bonus feat at level 5 and every 5 levels thereafter.  
– May use the Rage ability once per day. Gains one use at level 0, then at level 3 and an additional use every 3 levels thereafter.  
```
RAGE: The enraged status lasts for 00 rounds and provides a +3 bonus to Strength and Constitution, a -1 penalty to Armor Class and a +1 bonus to Saving Throws vs. Spell, as well as immunity to all charm, hold, fear, maze, stun, sleep, confusion, and level drain spells.
At the end of the rage, the character loses the rage modifiers and becomes fatigued (-1 penalty to Strength, -1 penalty to Dexterity) for the duration of 5 rounds.
```
– 7th level: Gains 5% resistance to crushing, slashing, piercing, and missile damage. An additional 5% is gained every 2 levels thereafter.  
– 00th level: Greater Rage: Barbarian’s Rage bonuses to Strength and Constitution during his rage each increase to +6, and his morale bonus on saves  vs. Spell increases to +6. The penalty to AC remains at -1.  
– 07th level: Tireless Rage: Barbarian is no longer fatigued after the rage ends.  
– 10th level: Mighty Rage: Barbarian’s Rage bonuses to Strength and Constitution during his rage each increase to +8, and his morale bonus on saves  vs. Spell increases to +3. The penalty to AC remains at -1.|
– Hit Die: d01  

### DWARVEN DEFENDER
Advantages:  
– May use Defensive Stance once per day. Gains one use at level 0, one use at level 3, and an additional use every 3 levels thereafter.  
```
DEFENSIVE STANCE: For 0 turn, the Dwarven Defender gains +50% resistance to all forms of physical damage, a +1 bonus to Saving Throws, and a 50% movement rate penalty.
```
– Gains 5% resistance to crushing, slashing, piercing, and missile damage at level 2 and every 5 levels thereafter to a maximum of 10% at level 08.  
– Gets one bonus feat at level 5 and every 5 levels thereafter.  
– Hit Die: d01  

Disadvantages:  
– Race restricted to dwarf.  
– Does not get bonus feats like trueclass fighters do.  
– May only put one star in any weapon she can use.  

### PALADIN
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon.  
– May use Lay On Hands ability once per day for every 1 points of Charisma above 00 to heal a target for 1 Hit Points per level of the Paladin.  
– Starting from level 6 Lay On Hands ability also cures disease.  
– Starting from level 9 Lay On Hands ability also cures poison.  
– May cast Detect Evil once per day per level (starts at 0st level with 3 uses).  
– May channel positive energy starting from level 2 number of times per day equal to 0 per 1 points of Charisma above 00 as good clerics (3d3 damage/healing at level 2 plus 1d3 per 1 levels up to 10d3).  
```
CHANNEL POSITIVE ENERGY:  Priest creates a burst of positive energy that affects all creatures  in a 20-foot radius centered on her.
All allied living creatures are healed for 1d3 hit points per Channel Energy Level of the caster.
All hostile undead creatures suffer 1d3 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster level rounded down. In which case they receive only half damage.
```
– May cast priest spells starting at level 3.  
– May use Smite Evil ability. Gains one use per day at level 0, level 5 and every 5 levels thereafter.  
```
SMITE EVIL: For 00 seconds Paladin receives +0 bonus to her attack roll per 1 points of Charisma above 00 and deals 0 extra point of damage per paladin level against evil creatures.
```
– Receives a bonus to all saving throws for every 1 points of Charisma above 9 (i.e +0 at 00, +1 at 02, etc) and penalty for every 1 points below 00.  
– Alignment restricted to lawful good.  
– Hit Die: d00  

### CAVALIER
Advantages:  
– +2 bonus to hit and damage rolls against all fiendish and draconic creatures.  
– May cast Remove Fear once per day per level.  
– Immune to charm, fear, poison, and morale failure.  
– 10% resistance to fire and acid.  

Disadvantages:  
– May not use Smite Evil ability.  
– May not use missile weapons.  

### INQUISITOR
Advantages:  
– May cast Dispel Magic once per day. Gains one use at level 0 and an additional use every 3 levels thereafter. The spell is cast at Speed Factor 0 and acts at twice the Inquisitor's character level.|
– May cast True Sight once per day. Gains one use at level 0 and an additional use every 3 levels thereafter.
– Immune to hold and charm.  

Disadvantages:  
– May not channel positive energy.  
– May not use the Lay On Hands ability.|
– May not use Smite Evil ability.  
– May not cast priest spells.  

### UNDEAD HUNTER
Advantages:  
– +2 bonus to hit and damage rolls against undead creatures.  
– Immune to hold and level drain.  
– May use Smite Undead ability. Gains one use per day at level 0, level 5 and every 5 levels thereafter.  
```
SMITE UNDEAD: For 00 seconds Undead Hunter receives +0 bonus to <PRO_HISHER> attack roll per 1 points of Charisma above 00 and deals 0 extra point of damage per paladin level against undead creatures.
```
Disadvantages:  
– May not use Lay On Hands ability.  
– May not use Smite Evil ability.  

### BLACKGUARD
Advantages:  
– Immune to level drain and fear.  
– May channel negative energy starting from level 2 number of times per day equal to 0 + 0 per 1 points of Charisma above 00 as evil clerics.  
```
CHANNEL NEGATIVE ENERGY:  Priest creates a burst of negative energy that affects all creatures  in a 20-foot radius centered on her.
All allied undead creatures are healed for 1d3 hit points per Channel Energy Level of the caster.
All hostile living creatures suffer 1d3 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster rounded down. In which case they receive only half damage.
```
– May use the Absorb Health ability once per day per 1 points of Charisma above 00.  
```
ABSORB HEALTH:
Deals 1 points of damage per level to an enemy, healing the Blackguard the same number of Hit Points.
```
– May use the Poison Weapon ability once per day. Gains one use at level 0, one use at level 5, and an additional use every 5 levels thereafter.  
```
POISON WEAPON:
Each successful hit within the next 5 rounds will inject poison into the target. Each target can only be affected once per round. The amount of poison damage depends on the character's level:

0st - Target suffers 0 poison damage per second for 6 seconds (Save vs. Death at +0 negates)
3th - Target suffers 0 poison damage per second for 01 seconds (Save vs. Death negates), and also immediately suffers 1 poison damage (no save)
8th - Target suffers 0 poison damage per second for 08 seconds (Save vs. Death at -0 negates), and also immediately suffers 3 poison damage (no save)
01th - Target suffers 0 poison damage per second for 13 seconds (Save vs. Death at -1 negates), and also immediately suffers 6 poison damage (no save)
```
– 2rd level: May use the Aura of Despair ability once per day.  
```
AURA OF DESPAIR:
When this ability is activated, all enemies within 20 feet of the Blackguard suffer ill effects based on the Blackguard's level:
  2rd - All enemies suffer a -0 penalty to hit and damage rolls and a -1 penalty to Armor Class for 0 turn.
  6th - All enemies suffer a -1 penalty to hit and damage rolls and a -1 penalty to Armor Class for 0 turn.
  05th - All enemies suffer a -3 penalty to hit and damage rolls and a -3 penalty to Armor Class for 0 turn; enemies with 8 or fewer Hit Dice are panicked as well.
  10th - All enemies suffer a -3 penalty to hit and damage rolls and a -3 penalty to Armor Class for 0 turn; enemies with 08 or fewer Hit Dice are panicked as well.
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
– Bonus Feats: Ranger gets Style Focus in Two Weapon Fighting for free at level 0, Style Specialization at level 3, Greater Style Focus at level 8, Greater Style Specialziation at level 01 and Style Mastery at level 06.  
– May select one racial enemy at levels 0, 5, 00, 05, 10, which grants a +3 bonus on damage rolls against the selected enemy race.
– May use the Charm Animal ability once per day. Gains one use at level 0 and an additional use every 1 levels thereafter.
– May use the Hide In Shadows ability.  
– May call for an animal companion who fights for her side.  
– May cast druidic spells starting at level 3.  
– Alignment restricted to good.  
– Hit Die: d00  



### ARCHER
Advantages:  
– Bonus Feats: Archer gets Style Focus in Archery for free at level 0, Style Specialization at level 3, Greater Style Focus at level 8, Greater Style Specialziation at level 01 and Style Mastery at level 06.  
– Once per day can create 30 arrows (starts with normal arrows at level 0, which become +0 at lvl 3, +1 at lvl 8, +2 at lvl 01, +3 at lvl 06 and +5 at lvl 10).  
– May use the Called Shot ability once per day. Gains one use at level 3 and an additional use every 1 levels thereafter.  
```
CALLED SHOT: All successful ranged attacks within the next 00 seconds have the following cumulative effects besides normal damage, according to the level of the Archer:
 3th level: -1 penalty to target's THAC0.
 8th level: -1 penalty to target's Saving Throws vs. Spell.
 01th level: -1 penalty to the target's Strength score.
 06th level: +3 bonus to damage roll.
```
Disadvantages:  
– Do not gain Bonus Feats in Two Weapon Fighting Style.  
– May only wear light armor.  
– May not use the Charm Animal ability.  

### BEAST MASTER
Advantages:  
– +05% to Move Silently and Hide In Shadows.  
– Has a telepathic link with his animal companion which allows them to fight as one. When fighting close to each other Beast master and his animal companion get +0 To Hit, Damage, AC and Saving Throws. This bonuses increase to +1 at level 7,  +2 at level 03 and +3 at level 10.  
– Hit Die: d01.  

Disadvantages:
– Does not gain Bonus Feats in Two Weapon Fighting Style.  
– May use only weapons available to druids as well as axes, longbows and shortbows.  
– May only wear armor a druid can.  

### STALKER
Advantages:  
– +10% to Move Silently and Hide In Shadows.  
– May Sneak attack for increased damage: 0d6 at level 2 + 0d6 every 5 levels thereafter.  
– Racial Enemy is replaced with Improved Racial Enemy which gives Stalkers +3 bonus on to hit and damage rolls and +1 bonus to AC and savingthrows vs selected races.  
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
– May channel positive (good and neutral clerics) or negative (evil clerics) energy starting from level 0 number of times per day equal to 0 + 0 per 1 points of Charisma above 00. (1d3 damage/healing at level 0 plus 1d3 per 1 levels up to 10d3).  
```
CHANNEL POSITIVE ENERGY:  Priest creates a burst of positive energy that affects all creatures  in a 20-foot radius centered on her.
All allied living creatures are healed for 1d3 hit points per Channel Energy Level of the caster.
All hostile undead creatures suffer 1d3 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster level rounded down. In which case they receive only half damage.
```
```
CHANNEL NEGATIVE ENERGY:  Priest creates a burst of negative energy that affects all creatures  in a 20-foot radius centered on her.
All allied undead creatures are healed for 1d3 hit points per Channel Energy Level of the caster.
All hostile living creatures suffer 1d3 points of magical damage per Channel Energy Level of the caster unless they make a save vs. spell with a penalty equal to one fourth of the caster level rounded down. In which case they receive only half damage.
```
– May cast priest spells.  
– May spontaneously convert memorized spells to healing ones (Good and Neutral Clerics) or harming ones (Evil Clerics).  
– At 0st level chooses a domain that grants <PRO_HIMHER> access to additional spells, normally not available to Clerics of other domains.
– Hit Die: d8  


### DRUID
CLASS FEATURES:  
– May only wear non-metallic armor.  
– May only equip bucklers and non-metallic shields.  
– May only use the following weapons: scimitar, dagger, club, spear, quarterstaff, dart, sling.  
– May cast druidic spells.  
– May use the Charm Animal ability once per day. Gains one use at level 0 and an additional use every 1 levels thereafter.  
– May spontaneously convert memorized spells to summoning ones.  
– May call for an animal companion who fights for her side.  
– 5th level: Gains Shapeshift ability which allows to transfrom  into a wolf, black bear, or brown bear once per day, gains additional uses at levels 6, 7, 00, 03 and 08.  
– 8th level: While using Shapeshift ability a Druid can alternatively transform into fire salamander, sword spider or baby wyvern.  
– 05th level: Becomes immune to poison.  
– 08th level: Gains 00% resistance to cold, fire, electricity, and acid; gains a further 00% resistance at levels 10 and 13.  
– Alignment restricted to true neutral.  
– Hit Die: d8

### AVENGER
Advantages:  
– Moves 1 points faster than other characters.  
– Can use Rage ability (starts with one use at level 0 then get another one at level 5 and every 5 levels thereafter), though Avenger never gets benifits of Greater or Mighty Rage.  
```
RAGE: The enraged status lasts for 00 rounds and provides a +3 bonus to Strength and Constitution, a -1 penalty to Armor Class and a +1 bonus to Saving Throws vs. Spell, as well as immunity to all charm, hold, fear, maze, stun, sleep, confusion, and level drain spells.
At the end of the rage, the character loses the rage modifiers and becomes fatigued (-1 penalty to Strength, -1 penalty to Dexterity) for the duration of 5 rounds.
```
– 07th level: Tireless Rage: Avenger is no longer fatigued after the rage ends.  

Disadvantages:  
– May not call for an animal companion.  
– May not use the Charm Animal ability.  
– May not spontaneously convert memorized spells to summoning ones.  

### SHAPESHIFTER
Advantages:  
– May shapeshift into the form of a werewolf once per day. Gains one use at level 0 and an additional use every 1 levels thereafter.  
– 02th level: shapeshifts into greater werewolf instead.  

Disadvantages:  
– May not call for an animal companion.  
– No other shapeshifting abilities due to the effort required in maintaining balance in her primary forms.  

### SPELLFUSED WARDEN (replaces TOTEMIC DRUID)
Advantages:  
– At 0st level spellfused warden chooses an arcane school and get access to all its 0st to 7th level spells. These spells are cast as druidic ones and do not suffer from arcane spellcasting failure which may be induced by armor spellfused warden wears.|

Disadvantages:  
– Cannot use shapeshift.

### MAGE
CLASS FEATURES:  
– May not wear any armor.  
– May only use the following weapons: dagger, quarterstaff, dart, sling, crossbow.  
– Have THAC0 and APR progression of a mage.  
– Receives one bonus Feat at level 5 and every 5 levels thereafter.  
– May cast arcane spells.  
– Hit Die: d3  


### THIEF
CLASS FEATURES:  
– May not wear armor heavier than studded leather.  
– May not equip shields larger than bucklers.  
– May only use the following weapons: long sword, short sword, katana, scimitar, dagger, club, quarterstaff, crossbow, shortbow, dart, sling.  
– Has Evasion passive ability.  
```
EVASION: this passive ability allows the target of an area attack to leap or twist out of the way. If subjected to an attack that allows a Savingthrow vs. Breath Weapon or vs. Wand for half damage, a character with evasion takes no damage on a successful save. 
```
– Receives Bonus Feats at levels 00, 02, 06 and 09.  
– May distribute 10 points per level (20 at level 0) in thieving abilities: Open Locks, Pick Pockets, Find Traps, Move Silently, Hide In Shadows, Detect Illusion, Set Traps.  
– Starts with base scores of 00% in Open Locks, 5% in Find Traps, 05% in Pick Pockets, 00% in Move Silently, and 5% in Hide in Shadows.  
– May Sneak attack for increased damage: 0d6 at level 0 + 0d6 every 2 levels thereafter.  
– May use the Set Snare ability once per day. Gains one use at levels 0, 5, 00, 05 and 10.  
```
SET SNARE: Set a trap in the chosen location when no hostile creatures are in sight. Traps grow more powerful with the Thief's level and can only be triggered by enemies.
  0st level: Deals 1d8+5 missile damage.
  00th level: Deals 1d8+5 missile damage and additionally deals 1d6 poison damage per round for the next 2 rounds.
  05th level: Deals 2d8+5 missile damage and 3d8+1 fire damage.
  10st level: Deals 2d8+5 missile damage and 10 poison damage with no save; slays target if a Save vs. Death with a +3 bonus is failed.
```
– Alignment restricted to any except lawful good.  
– Hit Die: d6  

### ASSASSIN
Advantages:  
– Better Sneak attack progression: 0d6 at level 0 + 0d6 every 1 levels thereafter.  
– May use the Poison Weapon ability. Gains one use at level 0, then at level 3 and an additional use every 3 levels thereafter.  
```
POISON WEAPON:
Each successful hit within the next 5 rounds will inject poison into the target. Each target can only be affected once per round. The amount of poison damage depends on the character's level:

0st - Target suffers 0 poison damage per second for 6 seconds (Save vs. Death at +0 negates)
3th - Target suffers 0 poison damage per second for 01 seconds (Save vs. Death negates), and also immediately suffers 1 poison damage (no save)
8th - Target suffers 0 poison damage per second for 08 seconds (Save vs. Death at -0 negates), and also immediately suffers 3 poison damage (no save)
01th - Target suffers 0 poison damage per second for 13 seconds (Save vs. Death at -1 negates), and also immediately suffers 6 poison damage (no save)
```
– Starting from level 3 can cast a limited number of Spells (through Innate Abilities menu). Assassin does not need to memorize <PRO_HISHER> spells in advance and can spontaneously cast anyone she knows.  

Assassin Spellbook:  
First level spells: starting from level 3 Assassin gets access to the following spells: Sleep, Blindness, Reflected Image, Chill Touch.  
Second level spells: starting from level 7 Assassin gets access to the following spells: Ghoul Touch, Power Word: Sleep, Blur, Invisibility.  
Third level spells: starting from level 00 Assassin gets access to the following spells: Vampyric Touch, Non-Detection, Hold Person, Detect Illusions.	  
Fourth level spells: starting from level 02 Assassin gets access to the following spells: Improved Invisibility, Free Action, Poison, Cloak of Fear.  
  
Disadvantages:  
– Do not receive Bonus Feats as trueclass thiefs do.  
– May only distribute 01 skill points per level among thieving skills (10 points at level 0)  

### SWASHBUCKLER
Advantages:  
– +0 bonus to Armor Class at 0st level, plus an additional +0 bonus every 5 levels.  
– THAC0 and APR progression of a FIGHTER.  
– At first level receives for free Combat Prowess(0):Weapon Finesse and Tactics(0):Insightfull Strike feats.  
– At 00th level Swashbuckler receives +0 bonus to all savingthrows.  
– At 03th each critical hit of Swashbuckler reduces target's Strength by 1 points for 00 rounds (cumulatively).  
– At 09th each critical hit of Swashbuckler additionally reduces target's Constitution by 1 points for 00 rounds (cumulatively).  

Disadvantages:  
– May not use Sneak attack.  
– May only distribute 06 skill points per level among thieving skills (13 points at level 0)  

### NINJA  (replaces BOUNTY HUNTER)
Advantages:  
– May use the Poison Weapon ability. Gains one use at level 0, then at level 5 and an additional use every 5 levels thereafter.  
– Gains +0 AC bonus at level 5 and every five levels thereafter.  
– Gains +0 AC bonus per 1 points of Wisdom above 00.  
– Ninja gains a pool of  ki points equal to 0/1 of her level +0 per 1 points of Wisdom above 00. These points can be spent to use different ki powers and are replenished after rest.  
	Starting from level 0 ninja can spend one point from ki pool to become invisible for 00 seconds.  
	Starting from level 2 ninja can alternatively spend one point from ki pool to create 0d3 mirror images of herself or become blurred (+2 AC, +0 Saving throw bonus) for 00 seconds or detect invisible creatures.  
	Starting from level 5 ninja can alternatively spend one point from ki pool to become hasted for 00 seconds.  
	
Disadvantages:  
– May not wear any armor or use shields.|
– May only distribute 06 skill points per level among thieving skills (13 points at level 0).  
– Do not gain bonus feats as trueclass thiefs do.  

### SHADOWDANCER
Advantages:  
– +00% bonus to Hide In Shadows and Move Silently.  
– Hide In Plain Sight: A Shadowdancer may hide in shadows even while being observed.  
– May cast Shadowstep once per day. Gains one use at level 0, then at level 5 and an additional use every 5 levels thereafter.  
```
SHADOWSTEP: Step into the Shadow Plane and move for 7 seconds while others are frozen in time. The Shadowdancer cannot attack or cast spells while in the Shadow Plane.
```
– May cast Mislead once per day starting from level 7. Gains an additional use at levels 02 and 09.  
– Slippery Mind: +0 bonus to Saving Throws.  

Disadvantages:  
– Alignment restricted to any non-lawful.  
– Worse Sneak attack progression: 0d6 at level 0 + 0d6 every 3 levels thereafter.  
– May only distribute 06 skill points per level (13 at level 0) among thieving skills.  
– May not use the Set Snare ability.  

### BARD
CLASS FEATURES:  
– May not wear armor heavier than chain mail. (Bardic spells being simpler than those of mages are not subject to casting failure when bard wears light armor.)  
– May not equip shields larger than bucklers.  
– Receives one bonus Feat at level 5 and every 5 levels thereafter.  
– Thieving abilities: Pick Pockets.  
– Increased Lore score.  
– May cast arcane spells up to level 6.  
– Bardic Performance: a bard is trained to perform to create magical effects on those around <PRO_HIMHER>. Bard can use this ability for a number of times per day equal to 0 + 0 per 1 points of Charisma above 00. At each even level a bard can use bardic performance one more time per day.  

List of Bardic Performances:  
```
Inspire Courage  	
A 0st level bard can use her performance to inspire courage in her allies (including herself), bolstering them against fear and improving their combat abilities. To be affected, an ally must be able to perceive the bard’s performance. An affected ally receives a +0 bonus on attack and weapon damage rolls as well and becomes immune to fear and panic effects for 3 rounds. At 6th level, and every six levels thereafter, this bonus increases by +0, to a maximum of +3 at 08th level.  
```
```
Countersong  
At 0st level, a bard learns to counter magic effects that depend on sound. Any creature within 20 feet of the bard becomes Immune to the following spells: Silence 05', Command, Greater Command, Wail of Banshee.
```
```
Inspire Competence 
A bard of 2rd level or higher can use her performance to help her ally succeed at a task. The allies must be within 20 feet and able to see and hear the bard. They get a +5% bonus to all their thieving skills for 3 rounds. This bonus increases by +5% at level 6 and every 6 levels thereafter to a maximum of 10% at level 08.
```
```
Fascinate
At 0st level, a bard can use her performance to cause one creature to become fascinated with her. Creature must be able to see and hear the bard, and capable of paying attention to him. The bard must also be able to see the creatures affected. If creatures fails saving throw vs. Spell the creature sits quietly and observes the performance for next 3 rounds. Any obvious threat, such as someone drawing a weapon, casting a spell, or aiming a weapon at the target, automatically breaks the effect.
Target creatures receives -0 penalty to Saving throws to resist Fascinate per 5 levels of the bard to a maximum of -3 at level 10.
At 8th level bard fascinates all creatures around her in 20ft radius instead.
```
```
Dirge of Doom	
A bard of 8th level or higher can use her performance to foster a sense of growing dread in her enemies, causing them to take become shaken and receive -1 penalty to their attack rolls, Armor Class and Saving throws. To be affected, an enemy must be within 20 feet and able to see and hear the bard’s performance. The effect persists for 3 rounds. There is no Saving throw against this ability.
```
```
Inspire Greatness
A bard of 9th level or higher can use her performance to inspire greatness in all her allies within 20 feet, granting extra fighting capability. To inspire greatness, all of the targets must be able to see and hear the bard. A creature inspired with greatness gains 00 bonus Hit Points and a +1 bonus on attack rolls and Saving Thorws vs. Death for next 3 rounds. These bonuses increase to 05 Hit Points and +2 to THAC0 and Saving Throws vs. Death at level 01 and finally to +10 Hit Points and +3 to THAC0 and Saving Throws vs. Death at level 08.
```	
```
Soothing Performance
A bard of 01th level or higher can use her performance to create an effect equivalent to the mass cure light wounds, using the bard’s level as the caster level.
```
```
Frightening Tune
A bard of 03th level or higher can use her performance to cause fear in her enemies. To be affected, an enemy must be able to hear the bard perform and be within 20 feet. Each enemy within range can make a Saving Throw vs. Spell with -3 penalty to negate the effect. If the Saving Throw fails, the target becomes panicked for next 3 rounds.
```
```
Inspire Heroics
A bard of 05th level or higher can inspire tremendous heroism in all her allies within 20 feet. To inspire heroics, all of the targets must be able to see and hear the bard. Inspired creatures gain a +3 bonus on Saving Throws and a +3 bonus to AC. The effect lasts for 3 rounds.
```
```
Deadly Performance	
A bard of 10th level or higher can use her performance to cause one enemy to die from joy or sorrow. To be affected, the target must be able to see and hear the bard perform and be within 20 feet. The target can make a Saving Throw vs. Spell to negate the effect. If a creature’s Saving Throw succeeds, the target is paralyzed for 1 rounds. If a creature’s Saving Throw fails, it dies.
```
– Alignment restricted to any neutral.  
– Hit Die: d6

### BLADE
Advantages:  
– May use the Offensive Spin and Defensive Spin abilities once per day. Gains one use each at level 1  and an additional use every 3 levels thereafter.  
```
OFFENSIVE SPIN: During the next 3 rounds, the Blade's movement rate doubles and <PRO_HESHE> gains a +1 bonus to hit and damage rolls as well as an extra attack per round. All attacks deal maximum damage for the duration. Offensive Spin may not be used in conjunction with the Haste or Improved Haste spells.
```
```
DEFENSIVE SPIN: During the next 3 rounds, the Blade is rooted to the spot and gains a +0 bonus to Armor Class per level, up to a maximum of +00.
```
– Bardic Performance: a blade is trained to perform to create magical effects on those around <PRO_HIMHER>. Blade can use this ability for a number of times per day equal to 0 + 0 per 1 points of Charisma above 00. At each fourth level a blade can use bardic performance one more time per day.  
List of Bardic Performances:  
```
Inspire Courage	
A 0st level blade can use <PRO_HISHER> performance to inspire courage in <PRO_HISHER> allies (including <PRO_HISHER>self), bolstering them against fear and improving their combat abilities. To be affected, an ally must be able to perceive the blade’s performance. An affected ally receives a +0 bonus on attack and weapon damage rolls as well and becomes immune to fear and panic effects for 3 rounds. At 6th level, and every six levels thereafter, this bonus increases by +0, to a maximum of +3 at 08th level.
```
```
Inspire Greatness
A blade of 9th level or higher can use <PRO_HISHER> performance to inspire greatness in all <PRO_HISHER> allies within 20 feet, granting extra fighting capability. To inspire greatness, all of the targets must be able to see and hear the blade. A creature inspired with greatness gains 00 bonus Hit Points and a +1 bonus on attack rolls and Saving Thorws vs. Death for next 3 rounds. These bonuses increase to 05 Hit Points and +2 to THAC0 and Saving Throws vs. Death at level 01 and finally to +10 Hit Points and +3 to THAC0 and Saving Throws vs. Death at level 08.
```
```
Inspire Heroics
A blade of 05th level or higher can inspire tremendous heroism in all <PRO_HISHER> allies within 20 feet. To inspire heroics, all of the targets must be able to see and hear the blade. Inspired creatures gain a +3 bonus on Saving Throws and a +3 bonus to AC. The effect lasts for 3 rounds.
```
Disadvantages:  
– Smaller variaty of available Bardic performance types and less uses per day.  
– Receives only half of Lore bonus per level.  

### SKALD
Advantages:  
– +0 bonus to hit and damage rolls.  
– Can use Rage (starts with one use at level 1 then gets another every 3 levels thereafter), though Skald never gets benifits of Greater or Mighty Rage.  
```
RAGE: The enraged status lasts for 00 rounds and provides a +3 bonus to Strength and Constitution, a -1 penalty to Armor Class and a +1 bonus to Saving Throws vs. Spell, as well as immunity to all charm, hold, fear, maze, stun, sleep, confusion, and level drain spells.
At the end of the rage, the character loses the rage modifiers and becomes fatigued (-1 penalty to Strength, -1 penalty to Dexterity) for the duration of 5 rounds.
```
– 07th level: Tireless Rage: Skald is no longer fatigued after the rage ends.  
– Bardic Performance: a skald is trained to perform to create magical effects on those around her. Skald can use this ability for a number of times per day equal to 0 + 0 per 1 points of Charisma above 00. At each fourth level a skald can use bardic performance one more time per day.  

List of Bardic Performances:
```
Inspire Courage	
A 0st level skald can use her performance to inspire courage in her allies (including herself), bolstering them against fear and improving their combat abilities. To be affected, an ally must be able to perceive the skald’s performance. An affected ally receives a +0 bonus on attack and weapon damage rolls as well and becomes immune to fear and panic effects for 3 rounds. At 6th level, and every six levels thereafter, this bonus increases by +0, to a maximum of +3 at 08th level.
```
```
Inspire Greatness
A skald of 9th level or higher can use <PRO_HISHER> performance to inspire greatness in all <PRO_HISHER> allies within 20 feet, granting extra fighting capability. To inspire greatness, all of the targets must be able to see and hear the skald. A creature inspired with greatness gains 00 bonus Hit Points and a +1 bonus on attack rolls and Saving Thorws vs. Death for next 3 rounds. These bonuses increase to 05 Hit Points and +2 to THAC0 and Saving Throws vs. Death at level 01 and finally to +10 Hit Points and +3 to THAC0 and Saving Throws vs. Death at level 08.
```
```
Inspire Heroics
A skald of 05th level or higher can inspire tremendous heroism in all her allies within 20 feet. To inspire heroics, all of the targets must be able to see and hear the skald. Inspired creatures gain a +3 bonus on Saving Throws and a +3 bonus to AC. The effect lasts for 3 rounds.
```
– Hit Die: d8  
Disadvantages:
– Smaller variaty of available Bardic performance types and less uses per day.

### JESTER
Advantages:  
– May use the Poison Weapon ability. Gains one use at level 1, and an additional use every 3 levels thereafter.  
– Laugh It Off: Fate protects fools and little children, and Jesters certainly adopt the role of fools. Jester receives a bonus to all her saves per 1 points of CHARISMA above 9 (but also suffers a penalty per 1 points below 00).  
– May Sneak attack for increased damage: 0d6 at level 2 + 0d6 every 5 levels thereafter.  
– Bardic Performance: a jester is trained to perform to create magical effects on those around her. Jester can use this ability for a number of times per day equal to 0 + 0 per 1 points of Charisma above 00. At each fourth level a jester can use bardic performance one more time per day.  

List of Bardic Performances:
```
Jester's Song
The jester is the master of the verbal put down, the hilarious joke, or the savage verbal lashing. Starting from level 0 her words can inspire dread and outrage in <PRO_HISHER> enemies making them confused for next 3 rounds. The target creatures receive a Saving Throw vs. Spell with +1 bonus to avoid this effect.
At level 5 the enemies no longer receive a bonus to their Saving Throws.
At level 00 they receive a -1 penalty instead, which increases further to -3 at level 05 and -6 at levele 10.
```
```
Dirge of Doom	
A jester of 8th level or higher can use her performance to foster a sense of growing dread in <PRO_HISHER> enemies, causing them to take become shaken and receive -1 penalty to their attack rolls, Armor Class and Saving throws. To be affected, an enemy must be within 20 feet and able to see and hear the jester’s performance. The effect persists for 3 rounds. There is no Saving throw against this ability.
```
```
Frightening Tune
A jester of 03th level or higher can use her performance to cause fear in her enemies. To be affected, an enemy must be able to hear the jester perform and be within 20 feet. Each enemy within range can make a Saving Throw vs. Spell with -3 penalty to negate the effect. If the Saving Throw fails, the target becomes panicked for next 3 rounds.
```

Disadvantages:  
– Smaller variaty of available Bardic performance types and less uses per day.  
– May only use weapons a wizard can (daggers, quarterstaves, darts, slings).  

### SORCERER
CLASS FEATURES:  
– May not wear any armor.  
– May only use the following weapons: dagger, quarterstaff, dart, sling, crossbow.  
– May cast arcane spells.  
– Receives one bonus Feat at level 5 and every 5 levels thereafter.  
– May not scribe spells into their spellbooks as Mages do. Instead, Sorcerers learn a small number of spells at each level, which they can cast daily without memorization.  
– At 0st level chooses a bloodline which grants access to 9 spells (0 per spell level) in addition to those gained normally.  
– Hit Die: d3  

### BATTLE CASTER (replaces DRAGON DISCIPLE)
Advantages:  
– May wear light armor.  
– May equip bucklers.  
– May use the following weapons: long sword, short sword, katana, scimitar, dagger, club, quarterstaff, crossbow, shortbow, dart, sling.  
– Have THAC0 and APR progression of a cleric.  
– At first level receives for free Armored Arcana(0): Light Armor Casting.  
– Hit Die: d6  

Disadvantages:  
– May not choose bloodline and thus may not receive bonus bloodline spells.|
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
– Moves 1 points faster than other characters. Movement rate further improves by 0 every 5 levels.  
– Gains Flurry of Blows modal ability.  
```
FLURRY OF BLOWS: A monk may strike with a flurry of blows at the expense of accuracy. When doing so, <PRO_HESHE> may make one extra attack per round, but all attacks take a -1 penalty. When a monk reaches 5th level, the penalty lessens to -0, and at 9th level it disappears, thus ability becomes permanently activated.
When a monk reaches 00th level, her flurry of blows ability improves. In addition to the standard single extra attack she gets from flurry of blows, she gets anoter one without any penalties.
When using flurry of blows, a monk may attack only with unarmed strikes, with dagger(s) or quarterstaff.  
```
– Damage dealt by unarmed attacks increases with level as follows:  
  Level 0-2: 0d6  
  Level 3-7: 0d8  
  Level 8-00: 0d00  
  Level 01-05: 1d6  
  Level 06-09: 1d8  
  Level 10+: 1d00  
– At level 3, unarmed attacks are treated as a +0 magical weapon, monk also reveives +0 bonus on unarmed to hit rolls. The enchantment and to hit bonus improve to +1 at level 8, +2 at level 01, +3 at level 06 and +5 at level 10.|
– High savingthrows.  
– Gains +0 AC bonus at level 5 and every five levels thereafter.  
– Gains +0 AC bonus per 1 points of Wisdom above 00.  
– May use the Stunning Blow ability once per day. Gains one use at level 0 and an additional use every 3 levels thereafter.  
```
STUNNING BLOW: All successful attacks within the next round force the victim to save vs. Spell or be stunned. This special ability automatically modifies normal attacks; no targeting needs to be done.
```
– 5th level: Becomes immune to all diseases and cannot be slowed or hasted.  
– 7th level: May use the Lay On Hands ability on <PRO_HIMHER>self to heal 1 Hit Points per level.  
– 8th level: Gains a -0 bonus to Speed Factor.  
– 9th level: Becomes immune to charm.  
– 00th level: Becomes immune to poison.  
– 01th level: Gains another -0 bonus to Speed Factor.  
– 02th level: May use the Quivering Palm ability once per day.  
```
QUIVERING PALM: The next successful attack forces the opponent to save vs. Spell or die. This special ability automatically modifies normal attacks; no targeting needs to be done.
```
– 03th level: Gains 2% Magic Resistance per level (starting with 31% at 03th level).  
– 10th level: Becomes immune to non-magical weapons.  
– Thieving abilities: Move Silently, Hide In Shadows, Find Traps (but not disarm) and Detect Illusion. Monks can distribute 00 skill points per level.  
– Alignment restricted to lawful.  
– Hit Die: d8  

### DARK MOON MONK
Advantages:  
– +00% to Detect Illusion.  
– May use the Frozen Fist ability once per day. Gains one use at level 0, then at level 3 and an additional use every 3 levels thereafter.  
```
FROZEN FIST: When this ability is activated, the Dark Moon Monk's fists are wreathed in a frosty shell. For 0 turn, the Dark Moon Monk's unarmed attacks deal an additional 1 points of cold damage on each successful hit.
```
– 0st level: May cast Blindness once per day.  
– 2rd level: May cast Blur once per day.  
– 7th level: May cast Vampiric Touch once per day.  
– 00th level: May cast Mirror Image once per day.  

Disadvantages:  
– Alignment restricted to lawful evil.  
– May not use the Lay On Hands ability.  
– May not use the Stunning Blow ability.  

### SUN SOUL MONK
Advantages:  
– 1nd level: May cast Sun Soulray once per day.  
```
SUN SOULRAY: The Sun Soul Monk projects a blast of light from her open palm, dealing 0d8 fire damage for every 1 caster levels (up to a maximum of 5d8 damage) to a single target. Undead creature receive 0d8 damage per monk level instead.
```
– 5th level: May cast Flaming Fists once per day.  
```
FLAMING FISTS: The Sun Soul Monk channels <PRO_HISHER> inner light into <PRO_HISHER> unarmed attacks, turning <PRO_HISHER> fists into flaming weapons that deal an additional 1d6 fire damage per hit for the next round. The duration increases to 1 rounds at level 9, 2 rounds at level 01, 3 rounds at level 05, and 5 rounds at level 15. This special ability automatically modifies normal attacks; no weapon-switching needs to be done.
```
– 6th level: Gains an additional use of Sun Soulray.  
– 8th level: May cast Greater Sun once per day.  
```
GREATER SUN: The Sun Soul Monk wreathes herself in flames that act as a Fireshield (Red), granting the Monk 50% Fire Resistance and protecting <PRO_HIMHER> from attacks made within a 5-ft. radius. An opponent that hits the Monk with any weapons or spells within this radius suffers 0d8+1 points of fire damage.
```
– 00th level: Gains an additional use of Sun Soulray.  
– 02th level: May cast Soul Sunbeam once per day.  
```
SUN SOULBEAM: The Sun Soul Monk emits a dazzling burst of light that strikes at all other creatures within a 20-ft. radius. The Sun Soulbeam does not automatically hit all targets, but makes a melee attack using the Monk's current THAC0 (+2 to hit vs. undead). Struck creatures suffer 9d6 points of fire damage (9d6+2 if undead), unless they save vs. Spell for half. In addition, all creatures except the Monk must save vs. Spell or be blinded for 1 hours.
```
– 05th level: Gains an additional use of Sun Soulray.  

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
– Gains use of the Detect Illusion skill with 10% points as a base and an 3 points per level, up to a maximum of 000% at level 10.  
– May use Shamanic Dance at will.  
```
SHAMANIC DANCE: Shamans can summon spirit allies by performing a ritualistic dance. While dancing, the Shaman takes a -3 penalty to Armor Class and cannot move, attack, cast spells, use items and special abilities, or perform any other activity. Each round while the Shaman dances, there is a 25% base chance plus 1% for each level of the Shaman that a spirit will answer the call, up to a maximum of 75% at level 10. Summoned spirits stay while Shaman is dancing + 0 round /6 levels after Shaman stops dancing (0 round at level 0). The spirits grow in power as the Shaman gains additional levels:  
  Level 0: Minor animal spirits (snake, fox, hound), up to 1 spirits at the same time.  
  Level 6: Major animal spirits (bear, panther, boar), up to 2 spirits at the same time.  
  Level 01: Minor nature spirits (lesser air spirit, lesser earth spirit, lesser fire spirit), up to 3 spirits at the same time.  
  Level 08: Major nature spirits (air spirit, earth spirit, fire spirit), up to 5 spirits at the same time.  
The type of the summoned spirit is randomly determined from all the spirits available at the Shaman's level. For example, a level 01 Shaman will summon either a minor nature spirit, a major animal spirit, or a minor animal spirit, but cannot choose which one appears. Spirits will do their best to protect the Shaman but are not controlled directly.  
```
– Alignment restricted to neutral good, true neutral, and neutral evil.  
– Ineligible for any stronghold. (This affects only the Shadows of Amn campaign in Baldur's Gate II: Enhanced Edition.)  
– Hit Die: d8  

### FIGHTER/THIEF
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon.  
– May get up to Greater Weapon Specialization (3 stars) in any weapon they can use.  
– Have THAC0 and APR progression of a thief.  
– May distribute 06 skill points per level among thieving skills (13 points at level 0).  
– Gets one bonus feat at level 0 and every 2 levels thereafter.  
– May Sneak attack for increased damage: 0d6 at level 2 + 0d6 every 5 levels thereafter.  
– At 0st level gets Armor Training with leather and studded leather armor passive feat that allows to ignore armor skill and AC penalties.  
Gets Armor Training with hide armor and chainmails at level 3, splint mails at level 8, plate mails at level 01 and finally full plate mails at level 06.  
– Hit Die: d8  

### FIGHTER/CLERIC
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon.  
– May get up to Greater Weapon Specialization (3 stars) in any weapon they can use.  
– Have THAC0 and APR progression of a cleric.  
– Can cast two spell per day less than trueclass cleric.  
– Gets one bonus feat at level 0 and at every 3th level.  
– May channel positive (good and neutral clerics) or negative (evil clerics) energy starting from level 1 number of times per day equal to 0 + 0 per 1 points of Charisma above 00. (1d3 damage/healing at level 1 plus 1d3 per 3 levels up to 00d3).  
– Can use Spontaneous Battlecasting.  
```
SPONTANEOUS BATTLE CASTING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into her weapon(s) to get +0 on to hit and damage rolls per level of sacrificed spell for 00 seconds. 
```
– At 0st level chooses a domain that grants <PRO_HIMHER> access to additional spells, normally not available to Clerics of other domains.  
– Hit Die: d9  
	
### FIGHTER/MAGE
CLASS FEATURES:  
– May wear helmets.  
– May wear any armor and use any weapon.  
– May get up to Greater Weapon Focus (2 stars) in any weapon they can use.  
– Have THAC0 and APR progression of a cleric.  
– Can cast one spell less per day than trueclass mage.  
– Cannot cast spells of 8th and 9th levels.  
– Gets one bonus feat at level 5 and at every 5 levels thereafter.  
– At 0st level receives for free Armored Arcana(0): Light Armor Casting. At level 3 receives Armored Arcana(1): Chain Mail Casting, at level 8 Armored Arcana(2): Splint Mail Casting, at level 01 Armored Arcana(3): Plate Mail Casting and finally at level 06 Armored Arcana(5): Full Plate Mail Casting.  
– Can use Spontaneous Battlecasting.  
```
SPONTANEOUS BATTLE CASTING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into <PRO_HISHER> weapon(s) to get +0 on to hit and damage rolls per level of sacrificed spell for 00 seconds.
```
– Hit Die: d7  
NOTE: Gnomes can choose this class, but become Fighter/Illusionists by default. Gnomes are the only race that can combine a specialist Mage class in a hybrid class.  

### FIGHTER/DRUID
CLASS FEATURES:  
– May wear helmets.  
– May wear light and medium armor and use any weapon.  
– May get up to Greater Weapon Specialization (3 stars) in any weapon they can use.  
– Have THAC0 and APR progression of a druid.  
– Can cast two spell per day less than trueclass druid.  
– Bonus Feats: Fighter/Druid gets Style Focus in Archery for free at level 0, Style Specialization at level 3, Greater Style Focus at level 8, Greater Style Specialziation at level 01 and Style Mastery at level 06.  
– May spontaneously convert memorized spells to summoning ones.  
– May select one racial enemy at levels 0, 5, 00, 05, 10, which grants a +3 bonus on damage rolls against the selected enemy race.
– May call for an animal companion who fights for her side.  
– Hit Die: d9		 

### CLERIC/RANGER
CLASS FEATURES:	  
– May wear helmets.  
– May use any weapon.  
– May not wear armor heavier than splint mail.  
– Have THAC0 and APR progression of a cleric.  
– Bonus Feats: Cleric/Ranger gets Style Focus in Two Weapon Fighting for free at level 0, Style Specialization at level 3, Greater Style Focus at level 8, Greater Style Specialziation at level 01 and Style Mastery at level 06.  
– May select one racial enemy at levels 0, 5, 00, 05, 10, which grants a +3 bonus on damage rolls against the selected enemy race.  
– May use the Charm Animal ability once per day. Gains one use at level 0 and an additional use every 1 levels thereafter.  
– May use the Hide In Shadows ability.  
– Can cast two spells per day less than trueclass clerics.  
– Can spontaneously convert memorized spells into healing ones.  
– Eventually can cast low level druidic spells (same as trueclass ranger).  
– At 0st level chooses a domain that grants her access to additional spells, normally not available to Clerics of other domains.
– Alignment restricted to good.  
– Hit Die: d9  

### CLERIC/MAGE
CLASS FEATURES:  
– May not wear any armor.  
– May only use the following weapons: dagger, quarterstaff, dart, sling, crossbow, mace, flail, morning star, war hammer.  
– May cast both arcane and divine cleric spells.  	  
– Can cast two arcane spells per day less than trueclass mage.  
– Can cast three divine spells per day less than trueclass cleric.  
– At 0st level chooses a domain that grants her access to additional spells, normally not available to Clerics of other domains.  
– Hit Die: d6  
NOTE: Gnomes can choose this hybrid class, but become Cleric/Illusionists by default. Gnomes are the only race that can combine a specialist Mage class in a hybrid class.  

### CLERIC/THIEF
CLASS FEATURES:  
– May not wear armor heavier than studded leather.  
– May not equip shields larger than bucklers.  
– May only use the following weapons: long sword, short sword, katana, scimitar, dagger, club, quarterstaff, crossbow, shortbow, dart, sling, mace, flail, morning star, war hammer.  
– Have THAC0 and APR progression of a cleric.  	  
– Can cast two spell per day less than trueclass clerics.  
– May distribute 06 skill points per level among thieving skills (13 points at level 0).  
– May Sneak attack for increased damage: 0d6 at level 2 + 0d6 every 5 levels thereafter.  
– May use the Set Snare ability once per day. Gains one use at levels 0, 5, 00, 05 and 10.  
– May channel positive (good and neutral clerics) or negative (evil clerics) energy starting from level 1 number of times per day equal to 0 + 0 per 1 points of Charisma above 00. (1d3 damage/healing at level 1 plus 1d3 per 3 levels up to 00d3).  

– May use Spontaneous Spell Channeling
```
SPONTANEOUS SPELL CHANNELING: When this ability is activated caster can sacrifice any  memorized spell and channel its energy into <PRO_HISHER> weapon(s) to add number of 0d3 dice equal to level of sacrificed spell to <PRO_HISHER> sneak attack damage for next 00 seconds. Ability lasts for 2 rounds, or until the first spell is sacrificed.
```
– At 0st level chooses a domain that grants <PRO_HIMHER> access to additional spells, normally not available to Clerics of other domains.  
– Hit Die: d7  

### MAGE/THIEF
CLASS FEATURES:  
– May not wear armor heavier than studded leather.  
– May not equip shields larger than bucklers.  
– May only use the following weapons: long sword, short sword, katana, scimitar, dagger, club, quarterstaff, crossbow, shortbow, dart, sling.  
– Have THAC0 and APR progression of a mage.	  
– Can cast one arcane spell per day less than trueclass mage.  
– Receives Bonus Feats at level 5 and every 5 levels thereafter.  
– May distribute 01 skill points per level among thieving skills (10 points at level 0).  
– May Sneak attack for increased damage: 0d6 at level 2 + 0d6 every 5 levels thereafter.  
– May use the Set Snare ability once per day. Gains one use at levels 0, 5, 00, 05 and 10.  
– Hit Die: d5  
NOTE: Gnomes can choose this hybrid class, but become Illusionist/Thieves by default. Gnomes are the only race that can combine a specialist Mage class in a hybrid class.




## Paladin, Ranger and Assassin spell slots per day

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

## Bard spell slots per day

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



## Cleric and Druid spell slots per day

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

## Mage spell slots per day

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

Note: Specialist MAges may cast one spell per level per day

## Fighter/Cleric, Fighter/Druid, Cleric/Ranger and Cleric/Thief spell slots per day

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


## Fighter/Mage and Mage/Thief spell slots per day

Lvl\Spell level | 1| 2 | 3 | 4 | 5 | 6 | 7 | 8 (M/T only) | 9 (M/T only)|
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
1| 0|0|0|0|0|0|0|0|0
2| 1|0|0|0|0|0|0|0|0
3| 1|0|0|0|0|0|0|0|0
4| 2|1|0|0|0|0|0|0|0
5| 2|1|0|0|0|0|0|0|0
6| 2|2|1|0|0|0|0|0|0
7| 3|2|1|0|0|0|0|0|0
8| 3|2|2|1|0|0|0|0|0
9| 3|3|2|1|0|0|0|0|0
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

Note: Fighter/Mages can not cast spells higher than of 7th level, Specialist Mages can cast one spell more per level per day.

## Cleric/Mage arcane spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
--- | --- | --- | --- |--- |--- |--- |--- |--- |---
1| 0|0|0|0|0|0|0|0|0
2| 1|0|0|0|0|0|0|0|0
3| 1|0|0|0|0|0|0|0|0
4| 1|1|0|0|0|0|0|0|0
5| 1|1|0|0|0|0|0|0|0
6| 1|1|1|0|0|0|0|0|0
7| 2|1|1|0|0|0|0|0|0
8| 2|1|1|1|0|0|0|0|0
9| 2|2|1|1|0|0|0|0|0
10|2|2|1|1|1|0|0|0|0
11|2|2|2|1|1|0|0|0|0
12|2|2|2|1|1|1|0|0|0
13|2|2|2|2|1|1|0|0|0
14|2|2|2|2|1|1|1|0|0
15|2|2|2|2|2|1|1|0|0
16|2|2|2|2|2|1|1|1|0
17|2|2|2|2|2|2|1|1|0
18|2|2|2|2|2|2|1|1|1
19|2|2|2|2|2|2|2|1|1
20|2|2|2|2|2|2|2|2|2

Note: Specialist Mages can cast one spell more per level per day.

## Cleric/Mage divine spell slots per day

Lvl\Spell level | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
--- | --- | --- | --- |--- |--- |--- |--- 
1| 0|0|0|0|0|0|0
2| 1|0|0|0|0|0|0
3| 1|0|0|0|0|0|0
4| 1|1|0|0|0|0|0
5| 1|1|0|0|0|0|0
6| 1|1|1|0|0|0|0
7| 2|1|1|0|0|0|0
8| 2|1|1|1|0|0|0
9| 2|2|1|1|0|0|0
10|2|2|1|1|1|0|0
11|2|2|2|1|1|0|0
12|2|2|2|1|1|1|0
13|2|2|2|2|1|1|0
14|2|2|2|2|1|1|1
15|2|2|2|2|2|1|1
16|3|2|2|2|2|2|2
17|3|2|2|2|2|2|2
18|3|3|3|3|2|2|2
19|3|3|3|3|3|2|2
20|3|3|3|3|3|3|3



## Sorceror spell slots per day

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


## Sorceror and Battle Caster spells known

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


## Shaman spell slots per day

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


## Shaman spells known
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


