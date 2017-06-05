signature GDK_CROSSING_MODE =
  sig
    datatype enum =
      NORMAL
    | GRAB
    | UNGRAB
    | GTK_GRAB
    | GTK_UNGRAB
    | STATE_CHANGED
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
