structure AtkLayer :> ATK_LAYER =
  struct
    datatype enum =
      INVALID
    | BACKGROUND
    | CANVAS
    | WIDGET
    | MDI
    | POPUP
    | OVERLAY
    | WINDOW
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | BACKGROUND => 1
          | CANVAS => 2
          | WIDGET => 3
          | MDI => 4
          | POPUP => 5
          | OVERLAY => 6
          | WINDOW => 7
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => BACKGROUND
          | 2 => CANVAS
          | 3 => WIDGET
          | 4 => MDI
          | 5 => POPUP
          | 6 => OVERLAY
          | 7 => WINDOW
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_layer_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
