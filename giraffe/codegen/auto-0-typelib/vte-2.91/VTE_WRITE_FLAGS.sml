signature VTE_WRITE_FLAGS =
  sig
    datatype enum =
      DEFAULT
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
