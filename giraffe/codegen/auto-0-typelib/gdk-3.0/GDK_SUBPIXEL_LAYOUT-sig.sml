signature GDK_SUBPIXEL_LAYOUT =
  sig
    datatype enum =
      UNKNOWN
    | NONE
    | HORIZONTAL_RGB
    | HORIZONTAL_BGR
    | VERTICAL_RGB
    | VERTICAL_BGR
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
