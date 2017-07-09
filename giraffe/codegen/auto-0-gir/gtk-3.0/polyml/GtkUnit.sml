structure GtkUnit :> GTK_UNIT =
  struct
    datatype enum =
      PIXEL
    | POINTS
    | INCH
    | MM
    structure Enum =
      Enum(
        type enum = enum
        val null = PIXEL
        val toInt =
          fn
            PIXEL => 0
          | POINTS => 1
          | INCH => 2
          | MM => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => PIXEL
          | 1 => POINTS
          | 2 => INCH
          | 3 => MM
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_unit_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
