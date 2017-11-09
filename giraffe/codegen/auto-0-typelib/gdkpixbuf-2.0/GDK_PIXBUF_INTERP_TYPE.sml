signature GDK_PIXBUF_INTERP_TYPE =
  sig
    datatype enum =
      NEAREST
    | TILES
    | BILINEAR
    | HYPER
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
