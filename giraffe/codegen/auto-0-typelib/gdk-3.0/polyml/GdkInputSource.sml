structure GdkInputSource :> GDK_INPUT_SOURCE =
  struct
    datatype enum =
      MOUSE
    | PEN
    | ERASER
    | CURSOR
    | KEYBOARD
    structure Enum =
      Enum(
        type enum = enum
        val null = MOUSE
        val toInt =
          fn
            MOUSE => 0
          | PEN => 1
          | ERASER => 2
          | CURSOR => 3
          | KEYBOARD => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => MOUSE
          | 1 => PEN
          | 2 => ERASER
          | 3 => CURSOR
          | 4 => KEYBOARD
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_input_source_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
