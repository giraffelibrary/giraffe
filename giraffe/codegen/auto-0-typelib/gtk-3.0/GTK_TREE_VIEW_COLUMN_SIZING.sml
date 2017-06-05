signature GTK_TREE_VIEW_COLUMN_SIZING =
  sig
    datatype enum =
      GROW_ONLY
    | AUTOSIZE
    | FIXED
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
