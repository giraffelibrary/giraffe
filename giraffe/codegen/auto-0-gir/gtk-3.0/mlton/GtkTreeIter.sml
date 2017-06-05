structure GtkTreeIter :>
  GTK_TREE_ITER
    where type t = GtkTreeIterRecord.t =
  struct
    val getType_ = _import "gtk_tree_iter_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "gtk_tree_iter_copy" : GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p -> GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p;
    type t = GtkTreeIterRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GtkTreeIterRecord.FFI.withPtr ---> GtkTreeIterRecord.FFI.fromPtr true) copy_ self
  end
