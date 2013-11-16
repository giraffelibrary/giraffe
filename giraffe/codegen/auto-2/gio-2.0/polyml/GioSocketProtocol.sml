structure GioSocketProtocol :>
  sig
    include GIO_SOCKET_PROTOCOL
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
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
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            UNKNOWN => f ~1
          | DEFAULT => f 0
          | TCP => f 6
          | UDP => f 17
          | SCTP => f 132
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            ~1 => UNKNOWN
          | 0 => DEFAULT
          | 6 => TCP
          | 17 => UDP
          | 132 => SCTP
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_protocol_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
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
