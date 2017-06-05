signature GDK_WINDOW_WINDOW_CLASS =
  sig
    datatype enum =
      OUTPUT
    | ONLY
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
