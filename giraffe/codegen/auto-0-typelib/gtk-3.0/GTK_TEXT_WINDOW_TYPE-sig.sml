signature GTK_TEXT_WINDOW_TYPE =
  sig
    datatype enum =
      PRIVATE
    | WIDGET
    | TEXT
    | LEFT
    | RIGHT
    | TOP
    | BOTTOM
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end