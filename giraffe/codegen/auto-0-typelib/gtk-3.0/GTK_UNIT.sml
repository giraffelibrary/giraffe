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
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
