signature GDK_INPUT_SOURCE =
  sig
    datatype enum =
      MOUSE
    | PEN
    | ERASER
    | CURSOR
    | KEYBOARD
    | TOUCHSCREEN
    | TOUCHPAD
    | TRACKPOINT
    | TABLET_PAD
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
