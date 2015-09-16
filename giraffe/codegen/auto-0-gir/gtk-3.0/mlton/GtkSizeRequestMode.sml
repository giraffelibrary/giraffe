structure GtkSizeRequestMode :>
  sig
    include GTK_SIZE_REQUEST_MODE
  end =
  struct
    datatype t =
      HEIGHT_FOR_WIDTH
    | WIDTH_FOR_HEIGHT
    | CONSTANT_SIZE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            HEIGHT_FOR_WIDTH => f 0
          | WIDTH_FOR_HEIGHT => f 1
          | CONSTANT_SIZE => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => HEIGHT_FOR_WIDTH
          | 1 => WIDTH_FOR_HEIGHT
          | 2 => CONSTANT_SIZE
          | n => raise Value n
      end
    val getType_ = _import "gtk_size_request_mode_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = HEIGHT_FOR_WIDTH
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
