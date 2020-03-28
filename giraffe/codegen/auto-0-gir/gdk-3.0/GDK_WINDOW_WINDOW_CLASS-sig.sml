signature GDK_WINDOW_WINDOW_CLASS =
  sig
    datatype enum =
      INPUT_OUTPUT
    | INPUT_ONLY
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end