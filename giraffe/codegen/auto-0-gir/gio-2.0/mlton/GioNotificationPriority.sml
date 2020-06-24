structure GioNotificationPriority :> GIO_NOTIFICATION_PRIORITY =
  struct
    datatype enum =
      NORMAL
    | LOW
    | HIGH
    | URGENT
    structure Enum =
      Enum(
        type enum = enum
        val null = NORMAL
        val toInt =
          fn
            NORMAL => 0
          | LOW => 1
          | HIGH => 2
          | URGENT => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NORMAL
          | 1 => LOW
          | 2 => HIGH
          | 3 => URGENT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_notification_priority_get_type" : unit -> GObjectType.FFI.val_;
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
