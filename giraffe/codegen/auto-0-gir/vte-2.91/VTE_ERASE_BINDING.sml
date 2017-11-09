signature VTE_ERASE_BINDING =
  sig
    datatype enum =
      AUTO
    | ASCII_BACKSPACE
    | ASCII_DELETE
    | DELETE_SEQUENCE
    | TTY
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
