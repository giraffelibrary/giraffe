structure GtkTreeIter :>
  GTK_TREE_ITER
    where type t = GtkTreeIterRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_iter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (getSymbol "gtk_tree_iter_copy") (GtkTreeIterRecord.PolyML.cPtr --> GtkTreeIterRecord.PolyML.cPtr)
    end
    type t = GtkTreeIterRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GtkTreeIterRecord.FFI.withPtr ---> GtkTreeIterRecord.FFI.fromPtr true) copy_ self
  end
