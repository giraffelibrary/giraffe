signature GTK_SOURCE_COMPRESSION_TYPE =
  sig
    datatype enum =
      NONE
    | GZIP
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
