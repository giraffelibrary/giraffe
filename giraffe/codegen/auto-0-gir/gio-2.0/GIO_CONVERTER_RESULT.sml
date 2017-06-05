signature GIO_CONVERTER_RESULT =
  sig
    datatype enum =
      ERROR
    | CONVERTED
    | FINISHED
    | FLUSHED
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
