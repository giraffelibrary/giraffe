signature GTK_WINDOW_TYPE =
  sig
    datatype enum =
      TOPLEVEL
    | POPUP
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
