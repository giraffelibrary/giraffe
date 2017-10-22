structure GtkButtonBoxStyle :> GTK_BUTTON_BOX_STYLE =
  struct
    datatype enum =
      SPREAD
    | EDGE
    | START
    | END
    | CENTER
    | EXPAND
    structure Enum =
      Enum(
        type enum = enum
        val null = SPREAD
        val toInt =
          fn
            SPREAD => 1
          | EDGE => 2
          | START => 3
          | END => 4
          | CENTER => 5
          | EXPAND => 6
        exception Value of GInt.t
        val fromInt =
          fn
            1 => SPREAD
          | 2 => EDGE
          | 3 => START
          | 4 => END
          | 5 => CENTER
          | 6 => EXPAND
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_button_box_style_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
