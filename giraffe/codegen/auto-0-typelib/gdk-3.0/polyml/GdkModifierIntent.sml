structure GdkModifierIntent :> GDK_MODIFIER_INTENT =
  struct
    datatype enum =
      PRIMARY_ACCELERATOR
    | CONTEXT_MENU
    | EXTEND_SELECTION
    | MODIFY_SELECTION
    | NO_TEXT_INPUT
    | SHIFT_GROUP
    | DEFAULT_MOD_MASK
    structure Enum =
      Enum(
        type enum = enum
        val null = PRIMARY_ACCELERATOR
        val toInt =
          fn
            PRIMARY_ACCELERATOR => 0
          | CONTEXT_MENU => 1
          | EXTEND_SELECTION => 2
          | MODIFY_SELECTION => 3
          | NO_TEXT_INPUT => 4
          | SHIFT_GROUP => 5
          | DEFAULT_MOD_MASK => 6
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => PRIMARY_ACCELERATOR
          | 1 => CONTEXT_MENU
          | 2 => EXTEND_SELECTION
          | 3 => MODIFY_SELECTION
          | 4 => NO_TEXT_INPUT
          | 5 => SHIFT_GROUP
          | 6 => DEFAULT_MOD_MASK
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_modifier_intent_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
