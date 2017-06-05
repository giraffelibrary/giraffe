structure GtkDragResult :> GTK_DRAG_RESULT =
  struct
    datatype enum =
      SUCCESS
    | NO_TARGET
    | USER_CANCELLED
    | TIMEOUT_EXPIRED
    | GRAB_BROKEN
    | ERROR
    structure Enum =
      Enum(
        type enum = enum
        val null = SUCCESS
        val toInt =
          fn
            SUCCESS => 0
          | NO_TARGET => 1
          | USER_CANCELLED => 2
          | TIMEOUT_EXPIRED => 3
          | GRAB_BROKEN => 4
          | ERROR => 5
        exception Value of GInt.t
        val fromInt =
          fn
            0 => SUCCESS
          | 1 => NO_TARGET
          | 2 => USER_CANCELLED
          | 3 => TIMEOUT_EXPIRED
          | 4 => GRAB_BROKEN
          | 5 => ERROR
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_drag_result_get_type" : unit -> GObjectType.FFI.val_;
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
