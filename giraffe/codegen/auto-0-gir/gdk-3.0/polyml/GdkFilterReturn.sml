structure GdkFilterReturn :> GDK_FILTER_RETURN =
  struct
    datatype enum =
      CONTINUE
    | TRANSLATE
    | REMOVE
    structure Enum =
      Enum(
        type enum = enum
        val null = CONTINUE
        val toInt =
          fn
            CONTINUE => 0
          | TRANSLATE => 1
          | REMOVE => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CONTINUE
          | 1 => TRANSLATE
          | 2 => REMOVE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_filter_return_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
