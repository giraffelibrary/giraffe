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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_zlib_compressor_format_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
