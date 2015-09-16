structure GdkGrabStatus :>
  sig
    include GDK_GRAB_STATUS
  end =
  struct
    datatype t =
      SUCCESS
    | ALREADY_GRABBED
    | INVALID_TIME
    | NOT_VIEWABLE
    | FROZEN
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            SUCCESS => f 0
          | ALREADY_GRABBED => f 1
          | INVALID_TIME => f 2
          | NOT_VIEWABLE => f 3
          | FROZEN => f 4
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => SUCCESS
          | 1 => ALREADY_GRABBED
          | 2 => INVALID_TIME
          | 3 => NOT_VIEWABLE
          | 4 => FROZEN
          | n => raise Value n
      end
    val getType_ = _import "gdk_grab_status_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = SUCCESS
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
