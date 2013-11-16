structure GtkSpinType :>
  sig
    include GTK_SPIN_TYPE
  end =
  struct
    datatype t =
      STEPFORWARD
    | STEPBACKWARD
    | PAGEFORWARD
    | PAGEBACKWARD
    | HOME
    | END
    | USERDEFINED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            STEPFORWARD => f 0
          | STEPBACKWARD => f 1
          | PAGEFORWARD => f 2
          | PAGEBACKWARD => f 3
          | HOME => f 4
          | END => f 5
          | USERDEFINED => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => STEPFORWARD
          | 1 => STEPBACKWARD
          | 2 => PAGEFORWARD
          | 3 => PAGEBACKWARD
          | 4 => HOME
          | 5 => END
          | 6 => USERDEFINED
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
    val null = STEPFORWARD
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
