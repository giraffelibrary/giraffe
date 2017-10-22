structure GdkDeviceToolType :> GDK_DEVICE_TOOL_TYPE =
  struct
    datatype enum =
      UNKNOWN
    | PEN
    | ERASER
    | BRUSH
    | PENCIL
    | AIRBRUSH
    | MOUSE
    | LENS
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => 0
          | PEN => 1
          | ERASER => 2
          | BRUSH => 3
          | PENCIL => 4
          | AIRBRUSH => 5
          | MOUSE => 6
          | LENS => 7
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => UNKNOWN
          | 1 => PEN
          | 2 => ERASER
          | 3 => BRUSH
          | 4 => PENCIL
          | 5 => AIRBRUSH
          | 6 => MOUSE
          | 7 => LENS
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_device_tool_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
