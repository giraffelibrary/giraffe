structure GdkStatus :> GDK_STATUS =
  struct
    datatype enum =
      OK
    | ERROR
    | ERROR_PARAM
    | ERROR_FILE
    | ERROR_MEM
    structure Enum =
      Enum(
        type enum = enum
        val null = OK
        val toInt =
          fn
            OK => 0
          | ERROR => ~1
          | ERROR_PARAM => ~2
          | ERROR_FILE => ~3
          | ERROR_MEM => ~4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => OK
          | ~1 => ERROR
          | ~2 => ERROR_PARAM
          | ~3 => ERROR_FILE
          | ~4 => ERROR_MEM
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_status_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
