structure GdkNotifyType :>
  sig
    include GDK_NOTIFY_TYPE
  end =
  struct
    datatype t =
      ANCESTOR
    | VIRTUAL
    | INFERIOR
    | NONLINEAR
    | NONLINEARVIRTUAL
    | UNKNOWN
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            ANCESTOR => f 0
          | VIRTUAL => f 1
          | INFERIOR => f 2
          | NONLINEAR => f 3
          | NONLINEARVIRTUAL => f 4
          | UNKNOWN => f 5
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => ANCESTOR
          | 1 => VIRTUAL
          | 2 => INFERIOR
          | 3 => NONLINEAR
          | 4 => NONLINEARVIRTUAL
          | 5 => UNKNOWN
          | n => raise Value n
      end
    val getType_ = _import "gdk_notify_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = ANCESTOR
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
