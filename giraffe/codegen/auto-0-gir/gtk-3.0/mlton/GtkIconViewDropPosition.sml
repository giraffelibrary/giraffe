structure GtkIconViewDropPosition :>
  sig
    include GTK_ICON_VIEW_DROP_POSITION
  end =
  struct
    datatype t =
      NO_DROP
    | DROP_INTO
    | DROP_LEFT
    | DROP_RIGHT
    | DROP_ABOVE
    | DROP_BELOW
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NO_DROP => f 0
          | DROP_INTO => f 1
          | DROP_LEFT => f 2
          | DROP_RIGHT => f 3
          | DROP_ABOVE => f 4
          | DROP_BELOW => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NO_DROP
          | 1 => DROP_INTO
          | 2 => DROP_LEFT
          | 3 => DROP_RIGHT
          | 4 => DROP_ABOVE
          | 5 => DROP_BELOW
          | n => raise Value n
      end
    val getType_ = _import "gtk_icon_view_drop_position_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NO_DROP
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
