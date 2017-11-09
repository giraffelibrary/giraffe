structure GioUnixSocketAddressType :> GIO_UNIX_SOCKET_ADDRESS_TYPE =
  struct
    datatype enum =
      INVALID
    | ANONYMOUS
    | PATH
    | ABSTRACT
    | ABSTRACT_PADDED
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | ANONYMOUS => 1
          | PATH => 2
          | ABSTRACT => 3
          | ABSTRACT_PADDED => 4
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => ANONYMOUS
          | 2 => PATH
          | 3 => ABSTRACT
          | 4 => ABSTRACT_PADDED
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_unix_socket_address_type_get_type" : unit -> GObjectType.FFI.val_;
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
