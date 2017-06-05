signature PANGO_GRAVITY_HINT =
  sig
    datatype enum =
      NATURAL
    | STRONG
    | LINE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
