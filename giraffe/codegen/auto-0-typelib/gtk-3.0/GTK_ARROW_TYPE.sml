signature GTK_ARROW_TYPE =
  sig
    datatype enum =
      UP
    | DOWN
    | LEFT
    | RIGHT
    | NONE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
