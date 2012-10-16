structure AtkTextBoundary :>
  sig
    include ATK_TEXT_BOUNDARY
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      CHAR
    | WORDSTART
    | WORDEND
    | SENTENCESTART
    | SENTENCEEND
    | LINESTART
    | LINEEND
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            CHAR => f 0
          | WORDSTART => f 1
          | WORDEND => f 2
          | SENTENCESTART => f 3
          | SENTENCEEND => f 4
          | LINESTART => f 5
          | LINEEND => f 6
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => CHAR
          | 1 => WORDSTART
          | 2 => WORDEND
          | 3 => SENTENCESTART
          | 4 => SENTENCEEND
          | 5 => LINESTART
          | 6 => LINEEND
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_text_boundary_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
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
