structure GtkIconViewDropPosition :> GTK_ICON_VIEW_DROP_POSITION =
  struct
    datatype enum =
      NO_DROP
    | DROP_INTO
    | DROP_LEFT
    | DROP_RIGHT
    | DROP_ABOVE
    | DROP_BELOW
    structure Enum =
      Enum(
        type enum = enum
        val null = NO_DROP
        val toInt =
          fn
            NO_DROP => 0
          | DROP_INTO => 1
          | DROP_LEFT => 2
          | DROP_RIGHT => 3
          | DROP_ABOVE => 4
          | DROP_BELOW => 5
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NO_DROP
          | 1 => DROP_INTO
          | 2 => DROP_LEFT
          | 3 => DROP_RIGHT
          | 4 => DROP_ABOVE
          | 5 => DROP_BELOW
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_icon_view_drop_position_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
