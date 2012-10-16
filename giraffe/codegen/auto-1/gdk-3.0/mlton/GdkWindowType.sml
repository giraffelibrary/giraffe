structure GdkWindowType :>
  sig
    include GDK_WINDOW_TYPE
  end =
  struct
    datatype t =
      ROOT
    | TOPLEVEL
    | CHILD
    | TEMP
    | FOREIGN
    | OFFSCREEN
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            ROOT => f 0
          | TOPLEVEL => f 1
          | CHILD => f 2
          | TEMP => f 3
          | FOREIGN => f 4
          | OFFSCREEN => f 5
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => ROOT
          | 1 => TOPLEVEL
          | 2 => CHILD
          | 3 => TEMP
          | 4 => FOREIGN
          | 5 => OFFSCREEN
          | n => raise Value n
      end
    val getType_ = _import "gdk_window_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = ROOT
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
