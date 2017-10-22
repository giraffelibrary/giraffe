structure GtkButtonBoxStyle :> GTK_BUTTON_BOX_STYLE =
  struct
    datatype enum =
      SPREAD
    | EDGE
    | START
    | END
    | CENTER
    | EXPAND
    structure Enum =
      Enum(
        type enum = enum
        val null = SPREAD
        val toInt =
          fn
            SPREAD => 1
          | EDGE => 2
          | START => 3
          | END => 4
          | CENTER => 5
          | EXPAND => 6
        exception Value of GInt32.t
        val fromInt =
          fn
            1 => SPREAD
          | 2 => EDGE
          | 3 => START
          | 4 => END
          | 5 => CENTER
          | 6 => EXPAND
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_button_box_style_get_type" : unit -> GObjectType.FFI.val_;
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
