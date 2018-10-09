signature GTK_TEXT_VIEW_LAYER =
  sig
    datatype enum =
      BELOW
    | ABOVE
    | BELOW_TEXT
    | ABOVE_TEXT
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
