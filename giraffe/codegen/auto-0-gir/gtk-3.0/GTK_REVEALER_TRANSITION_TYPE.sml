signature GTK_REVEALER_TRANSITION_TYPE =
  sig
    datatype enum =
      NONE
    | CROSSFADE
    | SLIDE_RIGHT
    | SLIDE_LEFT
    | SLIDE_UP
    | SLIDE_DOWN
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
