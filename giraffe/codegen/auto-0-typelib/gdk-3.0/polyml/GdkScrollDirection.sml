structure GdkScrollDirection :> GDK_SCROLL_DIRECTION =
  struct
    datatype enum =
      UP
    | DOWN
    | LEFT
    | RIGHT
    structure Enum =
      Enum(
        type enum = enum
        val null = UP
        val toInt =
          fn
            UP => 0
          | DOWN => 1
          | LEFT => 2
          | RIGHT => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => UP
          | 1 => DOWN
          | 2 => LEFT
          | 3 => RIGHT
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_scroll_direction_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
