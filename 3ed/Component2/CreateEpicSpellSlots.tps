

COPY ~3ed\Feats\EpicSpellSlot\Bam~ ~override~
OUTER_SET MAX_SLOTS = 5

WITH_TRA ~%LANGUAGE%\epic_spell_slot.tra~ BEGIN 
    OUTER_SET sel_name = RESOLVE_STR_REF(@001)
    OUTER_SET sel_desc = RESOLVE_STR_REF(@002)
    OUTER_SET undo_desc = RESOLVE_STR_REF(@003)
    
    OUTER_SET sel_wiz1 = RESOLVE_STR_REF (@11)
    OUTER_SET sel_wiz2 = RESOLVE_STR_REF (@12)
    OUTER_SET sel_wiz3 = RESOLVE_STR_REF (@13)
    OUTER_SET sel_wiz4 = RESOLVE_STR_REF (@14)
    OUTER_SET sel_wiz5 = RESOLVE_STR_REF (@15)
    OUTER_SET sel_wiz6 = RESOLVE_STR_REF (@16)
    OUTER_SET sel_wiz7 = RESOLVE_STR_REF (@17)
    OUTER_SET sel_wiz8 = RESOLVE_STR_REF (@18)
    OUTER_SET sel_wiz9 = RESOLVE_STR_REF (@19)
    
    OUTER_SET sel_clr1 = RESOLVE_STR_REF (@21)
    OUTER_SET sel_clr2 = RESOLVE_STR_REF (@22)
    OUTER_SET sel_clr3 = RESOLVE_STR_REF (@23)
    OUTER_SET sel_clr4 = RESOLVE_STR_REF (@24)
    OUTER_SET sel_clr5 = RESOLVE_STR_REF (@25)
    OUTER_SET sel_clr6 = RESOLVE_STR_REF (@26)
    OUTER_SET sel_clr7 = RESOLVE_STR_REF (@27)
    
    OUTER_SET undo_wiz1 = RESOLVE_STR_REF (@31)
    OUTER_SET undo_wiz2 = RESOLVE_STR_REF (@32)
    OUTER_SET undo_wiz3 = RESOLVE_STR_REF (@33)
    OUTER_SET undo_wiz4 = RESOLVE_STR_REF (@34)
    OUTER_SET undo_wiz5 = RESOLVE_STR_REF (@35)
    OUTER_SET undo_wiz6 = RESOLVE_STR_REF (@36)
    OUTER_SET undo_wiz7 = RESOLVE_STR_REF (@37)
    OUTER_SET undo_wiz8 = RESOLVE_STR_REF (@38)
    OUTER_SET undo_wiz9 = RESOLVE_STR_REF (@39)
    
    OUTER_SET undo_clr1 = RESOLVE_STR_REF (@41)
    OUTER_SET undo_clr2 = RESOLVE_STR_REF (@42)
    OUTER_SET undo_clr3 = RESOLVE_STR_REF (@43)
    OUTER_SET undo_clr4 = RESOLVE_STR_REF (@44)
    OUTER_SET undo_clr5 = RESOLVE_STR_REF (@45)
    OUTER_SET undo_clr6 = RESOLVE_STR_REF (@46)
    OUTER_SET undo_clr7 = RESOLVE_STR_REF (@47)
END

ACTION_DEFINE_ASSOCIATIVE_ARRAY class_spell_id BEGIN
    ~1~  => ~1~ //mage
    ~19~ => ~1~ //sorcerer
    ~13~ => ~1~ //mage-thief
    ~3~  => ~2~ //cleric
    ~11~ => ~2~ //druid
    ~21~ => ~2~ //shaman
    ~7~  => ~3~ //fm
    ~10~ => ~3~ //fmt
    ~8~  => ~1~ //fd
    ~9~  => ~1~ //fc
    ~18~ => ~1~ //cr
    ~15~ => ~1~ //ct
    ~14~ => ~4~ //cm
    ~17~ => ~5~ //fmc
    ~5~  => ~6~ //bard
END


ACTION_DEFINE_ARRAY max_wiz_spell_level BEGIN
    ~9~ ~0~ ~7~ ~9~ ~7~ ~6~
END

ACTION_DEFINE_ARRAY max_clr_spell_level BEGIN
    ~0~ ~7~ ~0~ ~7~ ~5~ ~0~
END

//create spells giving slots
OUTER_FOR (i = 1; i <= MAX_SLOTS; i = i+1) BEGIN
    //create 2DA
    OUTER_FOR (j = 1; j<=6; j = j+1) BEGIN
        OUTER_SET index = j - 1
        OUTER_SET EVALUATE_BUFFER wiz_max=$max_wiz_spell_level("%index%")
        OUTER_SET EVALUATE_BUFFER clr_max=$max_clr_spell_level("%index%")
        COPY ~3ed\Feats\EpicSpellSlot\TEMPLATE.2DA~ ~override\EP%j%SPL%i%.2DA~
            SET pos = 0
        FOR (l = 1; l<=wiz_max; l = l+1) BEGIN
            INSERT_2DA_ROW pos 3 ~WizardSpell%l%    EWSPL%i%%l%   3~
            SET pos = pos + 1
        END
        FOR (l = 1; l<=clr_max; l = l+1) BEGIN
            INSERT_2DA_ROW pos 3 ~ClericSpell%l%    ECSPL%i%%l%   3~
            SET pos = pos + 1
        END
        COPY ~3ed\Feats\EpicSpellSlot\TMPL_SL.SPL~ ~override/EP%j%SPL%i%.SPL~
            SPRINT resource EVALUATE_BUFFER ~EP%j%SPL%i%~
            LPF ALTER_SPELL_EFFECT STR_VAR resource END
    END
    //create spell selection
    COPY ~3ed\Feats\EpicSpellSlot\TMPL_EM.SPL~ ~override/EPSPLG%i%.SPL~
        PHP_EACH class_spell_id AS class => id BEGIN
           SPRINT resource EVALUATE_BUFFER ~EP%id%SPL%i%~
           LPF ADD_SPELL_EFFECT INT_VAR opcode = 326 target = 1 duration = 1 parameter2 = 105 parameter1 = class STR_VAR resource END 
        END
        SPRINT resource EVALUATE_BUFFER ~EPSPLG%i%~ //remove ability that gave selection
        LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 172 duration = 1 STR_VAR resource END
        LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 171 duration = 1 STR_VAR resource END
        LPF ALTER_SPELL_HEADER INT_VAR header = 1 STR_VAR icon = ~EPCSPL1B~ END
        WRITE_ASCII 0x003a ~EPCSPL1B~
        WRITE_LONG 0x0008 sel_name //name of the spell
        WRITE_LONG 0x0050 sel_desc //description of the spell
    
   
    //create spells giving slots
    OUTER_FOR (wiz_lvl = 1; wiz_lvl <= 9; wiz_lvl = wiz_lvl+1) BEGIN
        COPY ~3ed\Feats\EpicSpellSlot\TMPL_WZ.SPL~ ~override/EWSPL%i%%wiz_lvl%.SPL~
            SET shift = wiz_lvl - 1
            LPF ALTER_SPELL_EFFECT INT_VAR parameter2 = (1 << shift) END
            SPRINT resource EVALUATE_BUFFER ~EPSPLG%i%~ //remove ability that gave selection
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 172 duration = 1 STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~EPSRW%i%%wiz_lvl%~ //give ability to undo selection
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 171 duration = 1 STR_VAR resource END
            SPRINT icon EVALUATE_BUFFER ~EPCSPW%wiz_lvl%B~
            LPF ALTER_SPELL_HEADER INT_VAR header = 1 STR_VAR icon END
            SPRINT name  EVALUATE_BUFFER ~sel_wiz%wiz_lvl%~
            SPRINT name_ref EVALUATE_BUFFER ~%%name%%~        
            WRITE_LONG 0x0008 %name_ref% //name of the spell
            
        COPY ~3ed\Feats\EpicSpellSlot\TMPL_EM.SPL~ ~override/EPSRW%i%%wiz_lvl%.SPL~
            SPRINT resource EVALUATE_BUFFER ~EPSPLG%i%~ //give ability that gave selection
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 171 duration = 1 STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~EPSRW%i%%wiz_lvl%~ //remove ability to undo selection
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 172 duration = 1 STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~EWSPL%i%%wiz_lvl%~ //remove spell slot
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 321 duration = 1 STR_VAR resource END
            SPRINT name  EVALUATE_BUFFER ~undo_wiz%wiz_lvl%~
            SPRINT name_ref EVALUATE_BUFFER  ~%%name%%~
            WRITE_LONG 0x0008 %name_ref% //name of the spell
            WRITE_LONG 0x0050 undo_desc //description of the spell
            LPF ALTER_SPELL_HEADER INT_VAR header = 1 STR_VAR icon = ~EPCSPL0B~ END
            WRITE_ASCII 0x003a ~EPCSPL0B~
    END
    
    OUTER_FOR (clr_lvl = 1; clr_lvl <= 7; clr_lvl = clr_lvl+1) BEGIN
        COPY ~3ed\Feats\EpicSpellSlot\TMPL_CL.SPL~ ~override/ECSPL%i%%clr_lvl%.SPL~
            SET shift = clr_lvl - 1
            LPF ALTER_SPELL_EFFECT INT_VAR parameter2 = (1 << shift) END
            SPRINT resource EVALUATE_BUFFER ~EPSPLG%i%~ //remove ability that gave selection
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 172 duration = 1 STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~EPSRC%i%%clr_lvl%~ //give ability to undo selection
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 171 duration = 1 STR_VAR resource END
            SPRINT icon EVALUATE_BUFFER ~EPCSPP%clr_lvl%B~
            LPF ALTER_SPELL_HEADER INT_VAR header = 1 STR_VAR icon END
            SPRINT name  EVALUATE_BUFFER ~sel_clr%clr_lvl%~
            SPRINT name_ref EVALUATE_BUFFER  ~%%name%%~
            WRITE_LONG 0x0008 %name_ref% //name of the spell
            
            
        COPY ~3ed\Feats\EpicSpellSlot\TMPL_EM.SPL~ ~override/EPSRC%i%%clr_lvl%.SPL~
            SPRINT resource EVALUATE_BUFFER ~EPSPLG%i%~ //give ability that gave selection
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 171 duration = 1 STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~EPSRC%i%%clr_lvl%~ //remove ability to undo selection
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 172 duration = 1 STR_VAR resource END
            SPRINT resource EVALUATE_BUFFER ~ECSPL%i%%clr_lvl%~ //remove spell slot
            LPF ADD_SPELL_EFFECT INT_VAR target = 1 opcode = 321 duration = 1 STR_VAR resource END
            SPRINT name  EVALUATE_BUFFER ~undo_clr%clr_lvl%~
            SPRINT name_ref EVALUATE_BUFFER  ~%%name%%~
            WRITE_LONG 0x0008 %name_ref% //name of the spell
            WRITE_LONG 0x0050 undo_desc //description of the spell
            LPF ALTER_SPELL_HEADER INT_VAR header = 1 STR_VAR icon = ~EPCSPL0B~ END
            WRITE_ASCII 0x003a ~EPCSPL0B~
    END
END

LAF ADD_FEATS_LVL INT_VAR min_level=22 max_level=30 d_level=2 
    STR_VAR mask_file = ~3ed/Feats/FeatAttribution/FULLCST.SPL~ //mage, cm, sorc, druid, cleric, shaman
            clab=~\(\(CLABMA.+\)\|\(CLABPR.+\)\|\(CLABSH.+\)\|\(CLABDR.+\)\|\(OHTYR\)\|\(OHTEMPUS\)\)\.2DA~  
            feat_name_indexed = 1 feat_name=~EPSPLG~ caption = ~EPSPFL~ feat_type = ~GA~ END
            
LAF ADD_FEATS_LVL INT_VAR min_level=23 max_level=29 d_level=3 
    STR_VAR mask_file = ~3ed/Feats/FeatAttribution/SEMICST.SPL~ //mt, fc, fd, cr, fm, fmt, fcm, ct, bard 
            clab=~\(\(CLABMA.+\)\|\(CLABPR.+\)\|\(CLABDR.+\)\|\(CLABBA.+\)\)\.2DA~  
            feat_name_indexed = 1 feat_name=~EPSPLG~ caption = ~EPSPSM~ feat_type = ~GA~ END
LAF ADD_FEATS_LVL INT_VAR min_level=23 max_level=29 d_level=3 
    STR_VAR clab=~CLABSO01\.2DA~  //battlecaster
            feat_name_indexed = 1 feat_name=~EPSPLG~ caption = ~EPSPSM~ feat_type = ~GA~ END



