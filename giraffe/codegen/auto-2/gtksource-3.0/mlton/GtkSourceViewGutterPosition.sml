structure GtkSourceViewGutterPosition :>
  sig
    include GTK_SOURCE_VIEW_GUTTER_POSITION
  end =
  struct
    datatype t =
      LINES
    | MARKS
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            LINES => f ~30
          | MARKS => f ~20
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            ~30 => LINES
          | ~20 => MARKS
          | n => raise Value n
      end
    val getType_ = _import "gtk_source_view_gutter_position_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = LINES
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
