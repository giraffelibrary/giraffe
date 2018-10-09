signature GTK_STACK_TRANSITION_TYPE =
  sig
    datatype enum =
      NONE
    | CROSSFADE
    | SLIDE_RIGHT
    | SLIDE_LEFT
    | SLIDE_UP
    | SLIDE_DOWN
    | SLIDE_LEFT_RIGHT
    | SLIDE_UP_DOWN
    | OVER_UP
    | OVER_DOWN
    | OVER_LEFT
    | OVER_RIGHT
    | UNDER_UP
    | UNDER_DOWN
    | UNDER_LEFT
    | UNDER_RIGHT
    | OVER_UP_DOWN
    | OVER_DOWN_UP
    | OVER_LEFT_RIGHT
    | OVER_RIGHT_LEFT
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
