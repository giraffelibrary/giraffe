structure GtkTextWindowType :>
  sig
    include GTK_TEXT_WINDOW_TYPE
  end =
  struct
    datatype t =
      PRIVATE
    | WIDGET
    | TEXT
    | LEFT
    | RIGHT
    | TOP
    | BOTTOM
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            PRIVATE => f 0
          | WIDGET => f 1
          | TEXT => f 2
          | LEFT => f 3
          | RIGHT => f 4
          | TOP => f 5
          | BOTTOM => f 6
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => PRIVATE
          | 1 => WIDGET
          | 2 => TEXT
          | 3 => LEFT
          | 4 => RIGHT
          | 5 => TOP
          | 6 => BOTTOM
          | n => raise Value n
      end
    val getType_ = _import "gtk_text_window_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = PRIVATE
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
