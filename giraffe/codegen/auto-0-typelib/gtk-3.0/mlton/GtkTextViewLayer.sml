structure GtkTextViewLayer :> GTK_TEXT_VIEW_LAYER =
  struct
    datatype enum =
      BELOW
    | ABOVE
    | BELOW_TEXT
    | ABOVE_TEXT
    structure Enum =
      Enum(
        type enum = enum
        val null = BELOW
        val toInt =
          fn
            BELOW => 0
          | ABOVE => 1
          | BELOW_TEXT => 2
          | ABOVE_TEXT => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BELOW
          | 1 => ABOVE
          | 2 => BELOW_TEXT
          | 3 => ABOVE_TEXT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_text_view_layer_get_type" : unit -> GObjectType.FFI.val_;
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
