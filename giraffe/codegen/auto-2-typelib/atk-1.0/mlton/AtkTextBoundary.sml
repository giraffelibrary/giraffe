structure AtkTextBoundary :>
  sig
    include ATK_TEXT_BOUNDARY
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
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            CHAR => f 0
          | WORDSTART => f 1
          | WORDEND => f 2
          | SENTENCESTART => f 3
          | SENTENCEEND => f 4
          | LINESTART => f 5
          | LINEEND => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
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
    val getType_ = _import "atk_text_boundary_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
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
