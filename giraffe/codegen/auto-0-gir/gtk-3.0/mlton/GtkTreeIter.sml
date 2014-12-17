structure GtkTreeIter :>
  GTK_TREE_ITER
    where type record_t = GtkTreeIterRecord.t =
  struct
    val getType_ = _import "gtk_tree_iter_get_type" : unit -> GObjectType.C.val_;
    val copy_ = _import "gtk_tree_iter_copy" : GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p;
    type record_t = GtkTreeIterRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GtkTreeIterRecord.C.withPtr ---> GtkTreeIterRecord.C.fromPtr true) copy_ self
  end
