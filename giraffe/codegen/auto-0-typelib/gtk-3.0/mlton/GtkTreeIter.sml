structure GtkTreeIter :>
  GTK_TREE_ITER
    where type t = GtkTreeIterRecord.t =
  struct
    val getType_ = _import "gtk_tree_iter_get_type" : unit -> GObjectType.C.val_;
    val copy_ = _import "gtk_tree_iter_copy" : GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p;
    type t = GtkTreeIterRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GtkTreeIterRecord.C.withPtr ---> GtkTreeIterRecord.C.fromPtr true) copy_ self
  end
