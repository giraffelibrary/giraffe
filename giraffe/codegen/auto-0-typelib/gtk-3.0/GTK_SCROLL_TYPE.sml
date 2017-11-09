signature GTK_SCROLL_TYPE =
  sig
    datatype enum =
      NONE
    | JUMP
    | STEP_BACKWARD
    | STEP_FORWARD
    | PAGE_BACKWARD
    | PAGE_FORWARD
    | STEP_UP
    | STEP_DOWN
    | PAGE_UP
    | PAGE_DOWN
    | STEP_LEFT
    | STEP_RIGHT
    | PAGE_LEFT
    | PAGE_RIGHT
    | START
    | END
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
