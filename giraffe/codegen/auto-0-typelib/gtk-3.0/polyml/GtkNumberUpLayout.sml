structure GtkNumberUpLayout :> GTK_NUMBER_UP_LAYOUT =
  struct
    datatype enum =
      LRTB
    | LRBT
    | RLTB
    | RLBT
    | TBLR
    | TBRL
    | BTLR
    | BTRL
    structure Enum =
      Enum(
        type enum = enum
        val null = LRTB
        val toInt =
          fn
            LRTB => 0
          | LRBT => 1
          | RLTB => 2
          | RLBT => 3
          | TBLR => 4
          | TBRL => 5
          | BTLR => 6
          | BTRL => 7
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => LRTB
          | 1 => LRBT
          | 2 => RLTB
          | 3 => RLBT
          | 4 => TBLR
          | 5 => TBRL
          | 6 => BTLR
          | 7 => BTRL
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_number_up_layout_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
