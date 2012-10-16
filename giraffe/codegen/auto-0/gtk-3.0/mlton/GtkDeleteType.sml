structure GtkDeleteType :>
  sig
    include GTK_DELETE_TYPE
  end =
  struct
    datatype t =
      CHARS
    | WORDENDS
    | WORDS
    | DISPLAYLINES
    | DISPLAYLINEENDS
    | PARAGRAPHENDS
    | PARAGRAPHS
    | WHITESPACE
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            CHARS => f 0
          | WORDENDS => f 1
          | WORDS => f 2
          | DISPLAYLINES => f 3
          | DISPLAYLINEENDS => f 4
          | PARAGRAPHENDS => f 5
          | PARAGRAPHS => f 6
          | WHITESPACE => f 7
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => CHARS
          | 1 => WORDENDS
          | 2 => WORDS
          | 3 => DISPLAYLINES
          | 4 => DISPLAYLINEENDS
          | 5 => PARAGRAPHENDS
          | 6 => PARAGRAPHS
          | 7 => WHITESPACE
          | n => raise Value n
      end
    val getType_ = _import "gtk_delete_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
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
