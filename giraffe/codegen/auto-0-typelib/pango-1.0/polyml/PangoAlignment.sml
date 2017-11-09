structure PangoAlignment :> PANGO_ALIGNMENT =
  struct
    datatype enum =
      LEFT
    | CENTER
    | RIGHT
    structure Enum =
      Enum(
        type enum = enum
        val null = LEFT
        val toInt =
          fn
            LEFT => 0
          | CENTER => 1
          | RIGHT => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => LEFT
          | 1 => CENTER
          | 2 => RIGHT
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_alignment_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
