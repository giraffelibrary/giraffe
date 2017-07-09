structure GtkSourceViewGutterPosition :> GTK_SOURCE_VIEW_GUTTER_POSITION =
  struct
    datatype enum =
      LINES
    | MARKS
    structure Enum =
      Enum(
        type enum = enum
        val null = LINES
        val toInt =
          fn
            LINES => ~30
          | MARKS => ~20
        exception Value of GInt.t
        val fromInt =
          fn
            ~30 => LINES
          | ~20 => MARKS
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_view_gutter_position_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
