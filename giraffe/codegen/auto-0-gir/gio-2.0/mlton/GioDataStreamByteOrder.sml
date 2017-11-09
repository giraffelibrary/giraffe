structure GioDataStreamByteOrder :> GIO_DATA_STREAM_BYTE_ORDER =
  struct
    datatype enum =
      BIG_ENDIAN
    | LITTLE_ENDIAN
    | HOST_ENDIAN
    structure Enum =
      Enum(
        type enum = enum
        val null = BIG_ENDIAN
        val toInt =
          fn
            BIG_ENDIAN => 0
          | LITTLE_ENDIAN => 1
          | HOST_ENDIAN => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => BIG_ENDIAN
          | 1 => LITTLE_ENDIAN
          | 2 => HOST_ENDIAN
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_data_stream_byte_order_get_type" : unit -> GObjectType.FFI.val_;
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
