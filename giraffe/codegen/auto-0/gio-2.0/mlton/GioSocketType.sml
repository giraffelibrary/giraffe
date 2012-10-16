structure GioSocketType :>
  sig
    include GIO_SOCKET_TYPE
  end =
  struct
    datatype t =
      INVALID
    | STREAM
    | DATAGRAM
    | SEQPACKET
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            INVALID => f 0
          | STREAM => f 1
          | DATAGRAM => f 2
          | SEQPACKET => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => STREAM
          | 2 => DATAGRAM
          | 3 => SEQPACKET
          | n => raise Value n
      end
    val getType_ = _import "g_socket_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = INVALID
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
