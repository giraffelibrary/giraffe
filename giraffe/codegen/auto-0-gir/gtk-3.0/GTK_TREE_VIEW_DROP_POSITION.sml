signature GTK_TREE_VIEW_DROP_POSITION =
  sig
    datatype enum =
      BEFORE
    | AFTER
    | INTO_OR_BEFORE
    | INTO_OR_AFTER
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
