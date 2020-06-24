structure GtkWindowPosition :> GTK_WINDOW_POSITION =
  struct
    datatype enum =
      NONE
    | CENTER
    | MOUSE
    | CENTER_ALWAYS
    | CENTER_ON_PARENT
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | CENTER => 1
          | MOUSE => 2
          | CENTER_ALWAYS => 3
          | CENTER_ON_PARENT => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => CENTER
          | 2 => MOUSE
          | 3 => CENTER_ALWAYS
          | 4 => CENTER_ON_PARENT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_window_position_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
