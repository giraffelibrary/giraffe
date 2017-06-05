signature GDK_INPUT_MODE =
  sig
    datatype enum =
      DISABLED
    | SCREEN
    | WINDOW
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
