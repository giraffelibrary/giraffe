structure GtkIMStatusStyle :>
  sig
    include GTK_I_M_STATUS_STYLE
  end =
  struct
    datatype t =
      NOTHING
    | CALLBACK
    | NONE
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NOTHING => f 0
          | CALLBACK => f 1
          | NONE => f 2
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NOTHING
          | 1 => CALLBACK
          | 2 => NONE
          | n => raise Value n
      end
    val getType_ = _import "gtk_im_status_style_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NOTHING
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
