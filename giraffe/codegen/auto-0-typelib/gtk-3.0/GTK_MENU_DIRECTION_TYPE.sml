signature GTK_MENU_DIRECTION_TYPE =
  sig
    datatype enum =
      PARENT
    | CHILD
    | NEXT
    | PREV
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
