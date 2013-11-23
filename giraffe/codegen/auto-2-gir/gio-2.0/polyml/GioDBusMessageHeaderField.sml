structure GioDBusMessageHeaderField :>
  sig
    include GIO_D_BUS_MESSAGE_HEADER_FIELD
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      INVALID
    | PATH
    | INTERFACE
    | MEMBER
    | ERRORNAME
    | REPLYSERIAL
    | DESTINATION
    | SENDER
    | SIGNATURE
    | NUMUNIXFDS
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID => f 0
          | PATH => f 1
          | INTERFACE => f 2
          | MEMBER => f 3
          | ERRORNAME => f 4
          | REPLYSERIAL => f 5
          | DESTINATION => f 6
          | SENDER => f 7
          | SIGNATURE => f 8
          | NUMUNIXFDS => f 9
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => PATH
          | 2 => INTERFACE
          | 3 => MEMBER
          | 4 => ERRORNAME
          | 5 => REPLYSERIAL
          | 6 => DESTINATION
          | 7 => SENDER
          | 8 => SIGNATURE
          | 9 => NUMUNIXFDS
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
      val getType_ = call (load_sym libgio "g_dbus_message_header_field_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = INVALID
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
