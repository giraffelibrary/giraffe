structure GdkNotifyType :> GDK_NOTIFY_TYPE =
  struct
    datatype enum =
      ANCESTOR
    | VIRTUAL
    | INFERIOR
    | NONLINEAR
    | NONLINEAR_VIRTUAL
    | UNKNOWN
    structure Enum =
      Enum(
        type enum = enum
        val null = ANCESTOR
        val toInt =
          fn
            ANCESTOR => 0
          | VIRTUAL => 1
          | INFERIOR => 2
          | NONLINEAR => 3
          | NONLINEAR_VIRTUAL => 4
          | UNKNOWN => 5
        exception Value of GInt.t
        val fromInt =
          fn
            0 => ANCESTOR
          | 1 => VIRTUAL
          | 2 => INFERIOR
          | 3 => NONLINEAR
          | 4 => NONLINEAR_VIRTUAL
          | 5 => UNKNOWN
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_notify_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
