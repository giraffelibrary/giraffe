signature GIO_DATA_STREAM_NEWLINE_TYPE =
  sig
    datatype enum =
      LF
    | CR
    | CR_LF
    | ANY
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end