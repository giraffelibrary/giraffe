structure GtkCornerType :> GTK_CORNER_TYPE =
  struct
    datatype enum =
      TOP_LEFT
    | BOTTOM_LEFT
    | TOP_RIGHT
    | BOTTOM_RIGHT
    structure Enum =
      Enum(
        type enum = enum
        val null = TOP_LEFT
        val toInt =
          fn
            TOP_LEFT => 0
          | BOTTOM_LEFT => 1
          | TOP_RIGHT => 2
          | BOTTOM_RIGHT => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => TOP_LEFT
          | 1 => BOTTOM_LEFT
          | 2 => TOP_RIGHT
          | 3 => BOTTOM_RIGHT
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_corner_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
