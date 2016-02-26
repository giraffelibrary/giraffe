structure GtkMovementStep :>
  sig
    include GTK_MOVEMENT_STEP
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            LOGICAL_POSITIONS => f 0
          | VISUAL_POSITIONS => f 1
          | WORDS => f 2
          | DISPLAY_LINES => f 3
          | DISPLAY_LINE_ENDS => f 4
          | PARAGRAPHS => f 5
          | PARAGRAPH_ENDS => f 6
          | PAGES => f 7
          | BUFFER_ENDS => f 8
          | HORIZONTAL_PAGES => f 9
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
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
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_movement_step_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> FFI.PolyML.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = LOGICAL_POSITIONS
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
