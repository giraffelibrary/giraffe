signature GDK_PIXBUF_PIXBUF_ROTATION =
  sig
    datatype enum =
      NONE
    | COUNTERCLOCKWISE
    | UPSIDEDOWN
    | CLOCKWISE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
