structure GtkSourceSmartHomeEndType :> GTK_SOURCE_SMART_HOME_END_TYPE =
  struct
    datatype enum =
      DISABLED
    | BEFORE
    | AFTER
    | ALWAYS
    structure Enum =
      Enum(
        type enum = enum
        val null = DISABLED
        val toInt =
          fn
            DISABLED => 0
          | BEFORE => 1
          | AFTER => 2
          | ALWAYS => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => DISABLED
          | 1 => BEFORE
          | 2 => AFTER
          | 3 => ALWAYS
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_smart_home_end_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
