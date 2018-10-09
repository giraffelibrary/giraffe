signature GTK_TREE_VIEW_GRID_LINES =
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
