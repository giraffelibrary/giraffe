signature GTK_PACK_TYPE =
  sig
    datatype enum =
      START
    | END
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
