structure GtkBaselinePosition :> GTK_BASELINE_POSITION =
  struct
    datatype enum =
      TOP
    | CENTER
    | BOTTOM
    structure Enum =
      Enum(
        type enum = enum
        val null = TOP
        val toInt =
          fn
            TOP => 0
          | CENTER => 1
          | BOTTOM => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => TOP
          | 1 => CENTER
          | 2 => BOTTOM
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_baseline_position_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
