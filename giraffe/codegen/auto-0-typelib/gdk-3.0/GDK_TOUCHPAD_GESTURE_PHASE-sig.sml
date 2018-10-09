signature GDK_TOUCHPAD_GESTURE_PHASE =
  sig
    datatype enum =
      BEGIN
    | UPDATE
    | END
    | CANCEL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
