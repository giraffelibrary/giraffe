signature GTK_STATE_TYPE =
  sig
    datatype enum =
      NORMAL
    | ACTIVE
    | PRELIGHT
    | SELECTED
    | INSENSITIVE
    | INCONSISTENT
    | FOCUSED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
