structure GtkScrollStep :> GTK_SCROLL_STEP =
  struct
    datatype enum =
      STEPS
    | PAGES
    | ENDS
    | HORIZONTAL_STEPS
    | HORIZONTAL_PAGES
    | HORIZONTAL_ENDS
    structure Enum =
      Enum(
        type enum = enum
        val null = STEPS
        val toInt =
          fn
            STEPS => 0
          | PAGES => 1
          | ENDS => 2
          | HORIZONTAL_STEPS => 3
          | HORIZONTAL_PAGES => 4
          | HORIZONTAL_ENDS => 5
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => STEPS
          | 1 => PAGES
          | 2 => ENDS
          | 3 => HORIZONTAL_STEPS
          | 4 => HORIZONTAL_PAGES
          | 5 => HORIZONTAL_ENDS
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_scroll_step_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
