

    WITH_TRA ~%LANGUAGE%\rest8.tra~ BEGIN
    
        OUTER_SET MessageStrRef = RESOLVE_STR_REF (@001)
        COPY ~3ed/RestOnce8/DIS_REST.SPL~ ~override~
            LPF ALTER_SPELL_EFFECT INT_VAR parameter1 = MessageStrRef END
            
        EXTEND_TOP ~BALDUR.BCS~ ~3ed/RestOnce8/Rest8.baf~

    END 
        