structure GioSocketFamily :> GIO_SOCKET_FAMILY =
  struct
    datatype enum =
      INVALID
    | UNIX
    | IPV_4
    | IPV_6
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | UNIX => 1
          | IPV_4 => 2
          | IPV_6 => 10
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => UNIX
          | 2 => IPV_4
          | 10 => IPV_6
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_socket_family_get_type" : unit -> GObjectType.FFI.val_;
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
