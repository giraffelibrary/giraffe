structure GtkTextWindowType :> GTK_TEXT_WINDOW_TYPE =
  struct
    datatype enum =
      PRIVATE
    | WIDGET
    | TEXT
    | LEFT
    | RIGHT
    | TOP
    | BOTTOM
    structure Enum =
      Enum(
        type enum = enum
        val null = PRIVATE
        val toInt =
          fn
            PRIVATE => 0
          | WIDGET => 1
          | TEXT => 2
          | LEFT => 3
          | RIGHT => 4
          | TOP => 5
          | BOTTOM => 6
        exception Value of GInt.t
        val fromInt =
          fn
            0 => PRIVATE
          | 1 => WIDGET
          | 2 => TEXT
          | 3 => LEFT
          | 4 => RIGHT
          | 5 => TOP
          | 6 => BOTTOM
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_text_window_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
