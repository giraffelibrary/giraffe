structure GioSocketProtocol :>
  sig
    include GIO_SOCKET_PROTOCOL
  end =
  struct
    datatype t =
      UNKNOWN
    | DEFAULT
    | TCP
    | UDP
    | SCTP
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            UNKNOWN => f ~1
          | DEFAULT => f 0
          | TCP => f 6
          | UDP => f 17
          | SCTP => f 132
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            ~1 => UNKNOWN
          | 0 => DEFAULT
          | 6 => TCP
          | 17 => UDP
          | 132 => SCTP
          | n => raise Value n
      end
    val getType_ = _import "g_socket_protocol_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = UNKNOWN
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
