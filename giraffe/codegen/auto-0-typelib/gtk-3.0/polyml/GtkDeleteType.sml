structure GtkDeleteType :>
  sig
    include GTK_DELETE_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      CHARS
    | WORD_ENDS
    | WORDS
    | DISPLAY_LINES
    | DISPLAY_LINE_ENDS
    | PARAGRAPH_ENDS
    | PARAGRAPHS
    | WHITESPACE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            CHARS => f 0
          | WORD_ENDS => f 1
          | WORDS => f 2
          | DISPLAY_LINES => f 3
          | DISPLAY_LINE_ENDS => f 4
          | PARAGRAPH_ENDS => f 5
          | PARAGRAPHS => f 6
          | WHITESPACE => f 7
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => CHARS
          | 1 => WORD_ENDS
          | 2 => WORDS
          | 3 => DISPLAY_LINES
          | 4 => DISPLAY_LINE_ENDS
          | 5 => PARAGRAPH_ENDS
          | 6 => PARAGRAPHS
          | 7 => WHITESPACE
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
      val getType_ = call (load_sym libgtk "gtk_delete_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = CHARS
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
