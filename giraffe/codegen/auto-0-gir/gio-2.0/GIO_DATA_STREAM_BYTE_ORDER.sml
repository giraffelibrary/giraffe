signature GIO_DATA_STREAM_BYTE_ORDER =
  sig
    datatype enum =
      BIG_ENDIAN
    | LITTLE_ENDIAN
    | HOST_ENDIAN
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
