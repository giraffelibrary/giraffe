signature GTK_IMAGE_TYPE =
  sig
    datatype enum =
      EMPTY
    | PIXBUF
    | STOCK
    | ICON_SET
    | ANIMATION
    | ICON_NAME
    | GICON
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
