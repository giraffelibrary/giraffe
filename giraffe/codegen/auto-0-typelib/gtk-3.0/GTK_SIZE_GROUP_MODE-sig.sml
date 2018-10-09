signature GTK_SIZE_GROUP_MODE =
  sig
    datatype enum =
      NONE
    | HORIZONTAL
    | VERTICAL
    | BOTH
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
