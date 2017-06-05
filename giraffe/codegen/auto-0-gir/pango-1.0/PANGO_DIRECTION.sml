signature PANGO_DIRECTION =
  sig
    datatype enum =
      LTR
    | RTL
    | TTB_LTR
    | TTB_RTL
    | WEAK_LTR
    | WEAK_RTL
    | NEUTRAL
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
