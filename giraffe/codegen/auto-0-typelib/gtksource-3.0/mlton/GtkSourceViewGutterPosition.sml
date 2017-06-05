structure GtkSourceViewGutterPosition :> GTK_SOURCE_VIEW_GUTTER_POSITION =
  struct
    datatype enum =
      LINES
    | MARKS
    structure Enum =
      Enum(
        type enum = enum
        val null = LINES
        val toInt =
          fn
            LINES => ~30
          | MARKS => ~20
        exception Value of GInt32.t
        val fromInt =
          fn
            ~30 => LINES
          | ~20 => MARKS
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_source_view_gutter_position_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
