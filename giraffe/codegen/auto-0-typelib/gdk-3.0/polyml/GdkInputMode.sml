structure GdkInputMode :> GDK_INPUT_MODE =
  struct
    datatype enum =
      DISABLED
    | SCREEN
    | WINDOW
    structure Enum =
      Enum(
        type enum = enum
        val null = DISABLED
        val toInt =
          fn
            DISABLED => 0
          | SCREEN => 1
          | WINDOW => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => DISABLED
          | 1 => SCREEN
          | 2 => WINDOW
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_input_mode_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
