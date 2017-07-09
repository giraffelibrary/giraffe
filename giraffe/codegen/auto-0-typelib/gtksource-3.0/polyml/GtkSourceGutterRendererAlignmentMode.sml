structure GtkSourceGutterRendererAlignmentMode :> GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE =
  struct
    datatype enum =
      CELL
    | FIRST
    | LAST
    structure Enum =
      Enum(
        type enum = enum
        val null = CELL
        val toInt =
          fn
            CELL => 0
          | FIRST => 1
          | LAST => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => CELL
          | 1 => FIRST
          | 2 => LAST
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_gutter_renderer_alignment_mode_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
