signature CAIRO_CONTENT =
  sig
    datatype enum =
      COLOR
    | ALPHA
    | COLOR_ALPHA
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
