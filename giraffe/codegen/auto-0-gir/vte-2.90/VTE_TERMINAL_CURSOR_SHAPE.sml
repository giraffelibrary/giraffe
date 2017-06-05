signature VTE_TERMINAL_CURSOR_SHAPE =
  sig
    datatype enum =
      BLOCK
    | IBEAM
    | UNDERLINE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
