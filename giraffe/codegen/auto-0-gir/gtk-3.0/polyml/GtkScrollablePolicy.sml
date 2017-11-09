structure GtkScrollablePolicy :> GTK_SCROLLABLE_POLICY =
  struct
    datatype enum =
      MINIMUM
    | NATURAL
    structure Enum =
      Enum(
        type enum = enum
        val null = MINIMUM
        val toInt =
          fn
            MINIMUM => 0
          | NATURAL => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => MINIMUM
          | 1 => NATURAL
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_scrollable_policy_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
