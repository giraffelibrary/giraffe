structure GtkNumberUpLayout :>
  sig
    include GTK_NUMBER_UP_LAYOUT
  end =
  struct
    datatype t =
      LRTB
    | LRBT
    | RLTB
    | RLBT
    | TBLR
    | TBRL
    | BTLR
    | BTRL
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            LRTB => f 0
          | LRBT => f 1
          | RLTB => f 2
          | RLBT => f 3
          | TBLR => f 4
          | TBRL => f 5
          | BTLR => f 6
          | BTRL => f 7
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => LRTB
          | 1 => LRBT
          | 2 => RLTB
          | 3 => RLBT
          | 4 => TBLR
          | 5 => TBRL
          | 6 => BTLR
          | 7 => BTRL
          | n => raise Value n
      end
    val getType_ = _import "gtk_number_up_layout_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = LRTB
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
