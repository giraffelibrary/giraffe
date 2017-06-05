signature PANGO_STRETCH =
  sig
    datatype enum =
      ULTRA_CONDENSED
    | EXTRA_CONDENSED
    | CONDENSED
    | SEMI_CONDENSED
    | NORMAL
    | SEMI_EXPANDED
    | EXPANDED
    | EXTRA_EXPANDED
    | ULTRA_EXPANDED
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
