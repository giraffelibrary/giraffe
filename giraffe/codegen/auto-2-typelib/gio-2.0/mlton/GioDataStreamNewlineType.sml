structure GioDataStreamNewlineType :>
  sig
    include GIO_DATA_STREAM_NEWLINE_TYPE
  end =
  struct
    datatype t =
      LF
    | CR
    | CRLF
    | ANY
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            LF => f 0
          | CR => f 1
          | CRLF => f 2
          | ANY => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => LF
          | 1 => CR
          | 2 => CRLF
          | 3 => ANY
          | n => raise Value n
      end
    val getType_ = _import "g_data_stream_newline_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = LF
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
