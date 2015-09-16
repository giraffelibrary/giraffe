structure GtkSpinType :>
  sig
    include GTK_SPIN_TYPE
  end =
  struct
    datatype t =
      STEP_FORWARD
    | STEP_BACKWARD
    | PAGE_FORWARD
    | PAGE_BACKWARD
    | HOME
    | END
    | USER_DEFINED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            STEP_FORWARD => f 0
          | STEP_BACKWARD => f 1
          | PAGE_FORWARD => f 2
          | PAGE_BACKWARD => f 3
          | HOME => f 4
          | END => f 5
          | USER_DEFINED => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => STEP_FORWARD
          | 1 => STEP_BACKWARD
          | 2 => PAGE_FORWARD
          | 3 => PAGE_BACKWARD
          | 4 => HOME
          | 5 => END
          | 6 => USER_DEFINED
          | n => raise Value n
      end
    val getType_ = _import "gtk_spin_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = STEP_FORWARD
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
