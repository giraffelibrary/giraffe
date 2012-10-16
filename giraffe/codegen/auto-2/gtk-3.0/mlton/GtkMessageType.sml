structure GtkMessageType :>
  sig
    include GTK_MESSAGE_TYPE
  end =
  struct
    datatype t =
      INFO
    | WARNING
    | QUESTION
    | ERROR
    | OTHER
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            INFO => f 0
          | WARNING => f 1
          | QUESTION => f 2
          | ERROR => f 3
          | OTHER => f 4
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => INFO
          | 1 => WARNING
          | 2 => QUESTION
          | 3 => ERROR
          | 4 => OTHER
          | n => raise Value n
      end
    val getType_ = _import "gtk_message_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = INFO
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
