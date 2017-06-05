signature GTK_ARROW_PLACEMENT =
  sig
    datatype enum =
      BOTH
    | START
    | END
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
