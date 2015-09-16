structure GdkStatus :>
  sig
    include GDK_STATUS
  end =
  struct
    datatype t =
      OK
    | ERROR
    | ERROR_PARAM
    | ERROR_FILE
    | ERROR_MEM
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            OK => f 0
          | ERROR => f ~1
          | ERROR_PARAM => f ~2
          | ERROR_FILE => f ~3
          | ERROR_MEM => f ~4
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => OK
          | ~1 => ERROR
          | ~2 => ERROR_PARAM
          | ~3 => ERROR_FILE
          | ~4 => ERROR_MEM
          | n => raise Value n
      end
    val getType_ = _import "gdk_status_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = OK
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
