signature GDK_CROSSING_MODE =
  sig
    datatype enum =
      NORMAL
    | GRAB
    | UNGRAB
    | GTK_GRAB
    | GTK_UNGRAB
    | STATE_CHANGED
    | TOUCH_BEGIN
    | TOUCH_END
    | DEVICE_SWITCH
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
