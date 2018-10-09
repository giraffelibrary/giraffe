signature GTK_SELECTION_MODE =
  sig
    datatype enum =
      NONE
    | SINGLE
    | BROWSE
    | MULTIPLE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
