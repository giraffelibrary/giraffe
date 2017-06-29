structure GtkMovementStep :> GTK_MOVEMENT_STEP =
  struct
    datatype enum =
      LOGICAL_POSITIONS
    | VISUAL_POSITIONS
    | WORDS
    | DISPLAY_LINES
    | DISPLAY_LINE_ENDS
    | PARAGRAPHS
    | PARAGRAPH_ENDS
    | PAGES
    | BUFFER_ENDS
    | HORIZONTAL_PAGES
    structure Enum =
      Enum(
        type enum = enum
        val null = LOGICAL_POSITIONS
        val toInt =
          fn
            LOGICAL_POSITIONS => 0
          | VISUAL_POSITIONS => 1
          | WORDS => 2
          | DISPLAY_LINES => 3
          | DISPLAY_LINE_ENDS => 4
          | PARAGRAPHS => 5
          | PARAGRAPH_ENDS => 6
          | PAGES => 7
          | BUFFER_ENDS => 8
          | HORIZONTAL_PAGES => 9
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => LOGICAL_POSITIONS
          | 1 => VISUAL_POSITIONS
          | 2 => WORDS
          | 3 => DISPLAY_LINES
          | 4 => DISPLAY_LINE_ENDS
          | 5 => PARAGRAPHS
          | 6 => PARAGRAPH_ENDS
          | 7 => PAGES
          | 8 => BUFFER_ENDS
          | 9 => HORIZONTAL_PAGES
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_movement_step_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
