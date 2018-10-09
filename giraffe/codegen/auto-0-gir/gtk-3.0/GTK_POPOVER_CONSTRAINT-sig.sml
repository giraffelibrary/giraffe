signature GTK_POPOVER_CONSTRAINT =
  sig
    datatype enum =
      NONE
    | WINDOW
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
