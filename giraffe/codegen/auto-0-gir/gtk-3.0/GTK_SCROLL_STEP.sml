signature GTK_SCROLL_STEP =
  sig
    datatype enum =
      STEPS
    | PAGES
    | ENDS
    | HORIZONTAL_STEPS
    | HORIZONTAL_PAGES
    | HORIZONTAL_ENDS
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
