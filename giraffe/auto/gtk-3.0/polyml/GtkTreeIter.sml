structure GtkTreeIter :>
  GTK_TREE_ITER
    where type record_t = GtkTreeIterRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_iter_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val copy_ = call (load_sym libgtk "gtk_tree_iter_copy") (GtkTreeIterRecord.PolyML.PTR --> GtkTreeIterRecord.PolyML.PTR)
    end
    type record_t = GtkTreeIterRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GtkTreeIterRecord.C.withPtr ---> GtkTreeIterRecord.C.fromPtr true) copy_ self
  end
