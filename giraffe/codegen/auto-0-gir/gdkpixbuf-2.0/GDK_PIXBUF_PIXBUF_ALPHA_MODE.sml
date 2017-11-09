signature GDK_PIXBUF_PIXBUF_ALPHA_MODE =
  sig
    datatype enum =
      BILEVEL
    | FULL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
