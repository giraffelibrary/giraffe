structure GtkArrowType :> GTK_ARROW_TYPE =
  struct
    datatype enum =
      UP
    | DOWN
    | LEFT
    | RIGHT
    | NONE
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
          | NONE => 4
        exception Value of GInt.t
        val fromInt =
          fn
            0 => UP
          | 1 => DOWN
          | 2 => LEFT
          | 3 => RIGHT
          | 4 => NONE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_arrow_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
