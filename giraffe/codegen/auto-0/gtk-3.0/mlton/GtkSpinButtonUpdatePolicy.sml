structure GtkSpinButtonUpdatePolicy :>
  sig
    include GTK_SPIN_BUTTON_UPDATE_POLICY
  end =
  struct
    datatype t =
      ALWAYS
    | IFVALID
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            ALWAYS => f 0
          | IFVALID => f 1
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => ALWAYS
          | 1 => IFVALID
          | n => raise Value n
      end
    val getType_ = _import "gtk_spin_button_update_policy_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = ALWAYS
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
