structure GioZlibCompressorFormat :> GIO_ZLIB_COMPRESSOR_FORMAT =
  struct
    datatype enum =
      ZLIB
    | GZIP
    | RAW
    structure Enum =
      Enum(
        type enum = enum
        val null = ZLIB
        val toInt =
          fn
            ZLIB => 0
          | GZIP => 1
          | RAW => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => ZLIB
          | 1 => GZIP
          | 2 => RAW
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_zlib_compressor_format_get_type" : unit -> GObjectType.FFI.val_;
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
