signature GDK_INPUT_MODE =
  sig
    datatype enum =
      DISABLED
    | SCREEN
    | WINDOW
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
