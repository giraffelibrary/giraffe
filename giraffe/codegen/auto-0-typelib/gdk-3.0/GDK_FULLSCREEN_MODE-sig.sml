signature GDK_FULLSCREEN_MODE =
  sig
    datatype enum =
      CURRENT_MONITOR
    | ALL_MONITORS
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
