signature GDK_PIXBUF_COLORSPACE =
  sig
    datatype enum =
      RGB
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
