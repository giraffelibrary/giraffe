signature VTE_TERMINAL_CURSOR_BLINK_MODE =
  sig
    datatype enum =
      SYSTEM
    | ON
    | OFF
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
