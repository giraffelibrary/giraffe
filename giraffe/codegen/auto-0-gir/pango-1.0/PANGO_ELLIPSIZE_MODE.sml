signature PANGO_ELLIPSIZE_MODE =
  sig
    datatype enum =
      NONE
    | START
    | MIDDLE
    | END
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
