signature GTK_TREE_ITER =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val copy : t -> t
  end
