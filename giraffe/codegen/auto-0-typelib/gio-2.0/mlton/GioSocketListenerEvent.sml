structure GioSocketListenerEvent :> GIO_SOCKET_LISTENER_EVENT =
  struct
    datatype enum =
      BINDING
    | BOUND
    | LISTENING
    | LISTENED
    structure Enum =
      Enum(
        type enum = enum
        val null = BINDING
        val toInt =
          fn
            BINDING => 0
          | BOUND => 1
          | LISTENING => 2
          | LISTENED => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BINDING
          | 1 => BOUND
          | 2 => LISTENING
          | 3 => LISTENED
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_socket_listener_event_get_type" : unit -> GObjectType.FFI.val_;
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
