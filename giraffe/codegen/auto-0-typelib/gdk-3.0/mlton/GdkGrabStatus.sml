structure GdkGrabStatus :> GDK_GRAB_STATUS =
  struct
    datatype enum =
      SUCCESS
    | ALREADY_GRABBED
    | INVALID_TIME
    | NOT_VIEWABLE
    | FROZEN
    structure Enum =
      Enum(
        type enum = enum
        val null = SUCCESS
        val toInt =
          fn
            SUCCESS => 0
          | ALREADY_GRABBED => 1
          | INVALID_TIME => 2
          | NOT_VIEWABLE => 3
          | FROZEN => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => SUCCESS
          | 1 => ALREADY_GRABBED
          | 2 => INVALID_TIME
          | 3 => NOT_VIEWABLE
          | 4 => FROZEN
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_grab_status_get_type" : unit -> GObjectType.FFI.val_;
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
