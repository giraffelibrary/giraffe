signature GTK_RELIEF_STYLE =
  sig
    datatype enum =
      NORMAL
    | HALF
    | NONE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
