structure GtkStateType :>
  sig
    include GTK_STATE_TYPE
  end =
  struct
    datatype t =
      NORMAL
    | ACTIVE
    | PRELIGHT
    | SELECTED
    | INSENSITIVE
    | INCONSISTENT
    | FOCUSED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NORMAL => f 0
          | ACTIVE => f 1
          | PRELIGHT => f 2
          | SELECTED => f 3
          | INSENSITIVE => f 4
          | INCONSISTENT => f 5
          | FOCUSED => f 6
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NORMAL
          | 1 => ACTIVE
          | 2 => PRELIGHT
          | 3 => SELECTED
          | 4 => INSENSITIVE
          | 5 => INCONSISTENT
          | 6 => FOCUSED
          | n => raise Value n
      end
    val getType_ = _import "gtk_state_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NORMAL
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
