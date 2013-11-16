signature GTK_TREE_ITER =
  sig
    type record_t
    val getType : unit -> GObject.Type.t
    val copy : record_t -> record_t
  end
