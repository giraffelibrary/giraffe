signature GTK_EXPANDER_STYLE =
  sig
    datatype enum =
      COLLAPSED
    | SEMI_COLLAPSED
    | SEMI_EXPANDED
    | EXPANDED
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
