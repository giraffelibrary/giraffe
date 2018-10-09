signature PANGO_STYLE =
  sig
    datatype enum =
      NORMAL
    | OBLIQUE
    | ITALIC
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
