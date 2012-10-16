structure GtkWrapMode :>
  sig
    include GTK_WRAP_MODE
  end =
  struct
    datatype t =
      NONE
    | CHAR
    | WORD
    | WORDCHAR
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NONE => f 0
          | CHAR => f 1
          | WORD => f 2
          | WORDCHAR => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => CHAR
          | 2 => WORD
          | 3 => WORDCHAR
          | n => raise Value n
      end
    val getType_ = _import "gtk_wrap_mode_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NONE
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
