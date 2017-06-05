signature GIO_ZLIB_COMPRESSOR_FORMAT =
  sig
    datatype enum =
      ZLIB
    | GZIP
    | RAW
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
