structure GioDBusMessageHeaderField :>
  sig
    include GIO_D_BUS_MESSAGE_HEADER_FIELD
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
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
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
        fun withRefVal f = withVal (FFI.Enum.withRef f)
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
    val getType_ = _import "g_dbus_message_header_field_get_type" : unit -> GObjectType.C.val_;
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
