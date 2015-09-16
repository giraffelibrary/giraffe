structure GtkToolbarStyle :>
  sig
    include GTK_TOOLBAR_STYLE
  end =
  struct
    datatype t =
      ICONS
    | TEXT
    | BOTH
    | BOTH_HORIZ
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            ICONS => f 0
          | TEXT => f 1
          | BOTH => f 2
          | BOTH_HORIZ => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => ICONS
          | 1 => TEXT
          | 2 => BOTH
          | 3 => BOTH_HORIZ
          | n => raise Value n
      end
    val getType_ = _import "gtk_toolbar_style_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = ICONS
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
