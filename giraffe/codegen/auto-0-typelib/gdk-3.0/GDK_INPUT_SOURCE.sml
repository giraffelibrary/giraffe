signature GDK_INPUT_SOURCE =
  sig
    datatype enum =
      MOUSE
    | PEN
    | ERASER
    | CURSOR
    | KEYBOARD
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
