signature PANGO_VARIANT =
  sig
    datatype enum =
      NORMAL
    | SMALL_CAPS
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
