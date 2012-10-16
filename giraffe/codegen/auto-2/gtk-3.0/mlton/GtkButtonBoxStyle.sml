structure GtkButtonBoxStyle :>
  sig
    include GTK_BUTTON_BOX_STYLE
  end =
  struct
    datatype t =
      SPREAD
    | EDGE
    | START
    | END
    | CENTER
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            SPREAD => f 1
          | EDGE => f 2
          | START => f 3
          | END => f 4
          | CENTER => f 5
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            1 => SPREAD
          | 2 => EDGE
          | 3 => START
          | 4 => END
          | 5 => CENTER
          | n => raise Value n
      end
    val getType_ = _import "gtk_button_box_style_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = SPREAD
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
