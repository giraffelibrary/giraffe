signature GTK_NOTEBOOK_TAB =
  sig
    datatype enum =
      FIRST
    | LAST
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
