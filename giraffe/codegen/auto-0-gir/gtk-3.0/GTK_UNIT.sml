signature GTK_UNIT =
  sig
    datatype enum =
      PIXEL
    | POINTS
    | INCH
    | MM
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
