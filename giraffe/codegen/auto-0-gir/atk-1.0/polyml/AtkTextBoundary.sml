structure AtkTextBoundary :>
  sig
    include ATK_TEXT_BOUNDARY
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      CHAR
    | WORD_START
    | WORD_END
    | SENTENCE_START
    | SENTENCE_END
    | LINE_START
    | LINE_END
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            CHAR => f 0
          | WORD_START => f 1
          | WORD_END => f 2
          | SENTENCE_START => f 3
          | SENTENCE_END => f 4
          | LINE_START => f 5
          | LINE_END => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => CHAR
          | 1 => WORD_START
          | 2 => WORD_END
          | 3 => SENTENCE_START
          | 4 => SENTENCE_END
          | 5 => LINE_START
          | 6 => LINE_END
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
      val getType_ = call (load_sym libatk "atk_text_boundary_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
    val null = CHAR
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
