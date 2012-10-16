structure GtkTreePath :>
  GTK_TREE_PATH
    where type record_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_path_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_tree_path_new") (FFI.PolyML.VOID --> GtkTreePathRecord.PolyML.PTR)
      val newFirst_ = call (load_sym libgtk "gtk_tree_path_new_first") (FFI.PolyML.VOID --> GtkTreePathRecord.PolyML.PTR)
      val newFromString_ = call (load_sym libgtk "gtk_tree_path_new_from_string") (FFI.PolyML.String.INPTR --> GtkTreePathRecord.PolyML.PTR)
      val appendIndex_ = call (load_sym libgtk "gtk_tree_path_append_index") (GtkTreePathRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val compare_ = call (load_sym libgtk "gtk_tree_path_compare") (GtkTreePathRecord.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val copy_ = call (load_sym libgtk "gtk_tree_path_copy") (GtkTreePathRecord.PolyML.PTR --> GtkTreePathRecord.PolyML.PTR)
      val down_ = call (load_sym libgtk "gtk_tree_path_down") (GtkTreePathRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getDepth_ = call (load_sym libgtk "gtk_tree_path_get_depth") (GtkTreePathRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val isAncestor_ = call (load_sym libgtk "gtk_tree_path_is_ancestor") (GtkTreePathRecord.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val isDescendant_ = call (load_sym libgtk "gtk_tree_path_is_descendant") (GtkTreePathRecord.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val next_ = call (load_sym libgtk "gtk_tree_path_next") (GtkTreePathRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val prependIndex_ = call (load_sym libgtk "gtk_tree_path_prepend_index") (GtkTreePathRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val prev_ = call (load_sym libgtk "gtk_tree_path_prev") (GtkTreePathRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val toString_ = call (load_sym libgtk "gtk_tree_path_to_string") (GtkTreePathRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val up_ = call (load_sym libgtk "gtk_tree_path_up") (GtkTreePathRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type record_t = GtkTreePathRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTreePathRecord.C.fromPtr true) new_ ()
    fun newFirst () = (I ---> GtkTreePathRecord.C.fromPtr true) newFirst_ ()
    fun newFromString path = (FFI.String.withConstPtr ---> GtkTreePathRecord.C.fromPtr true) newFromString_ path
    fun appendIndex self index = (GtkTreePathRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) appendIndex_ (self & index)
    fun compare self b = (GtkTreePathRecord.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Int32.fromVal) compare_ (self & b)
    fun copy self = (GtkTreePathRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) copy_ self
    fun down self = (GtkTreePathRecord.C.withPtr ---> I) down_ self
    fun getDepth self = (GtkTreePathRecord.C.withPtr ---> FFI.Int32.fromVal) getDepth_ self
    fun isAncestor self descendant = (GtkTreePathRecord.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.fromVal) isAncestor_ (self & descendant)
    fun isDescendant self ancestor = (GtkTreePathRecord.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.fromVal) isDescendant_ (self & ancestor)
    fun next self = (GtkTreePathRecord.C.withPtr ---> I) next_ self
    fun prependIndex self index = (GtkTreePathRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) prependIndex_ (self & index)
    fun prev self = (GtkTreePathRecord.C.withPtr ---> FFI.Bool.fromVal) prev_ self
    fun toString self = (GtkTreePathRecord.C.withPtr ---> FFI.String.fromPtr true) toString_ self
    fun up self = (GtkTreePathRecord.C.withPtr ---> FFI.Bool.fromVal) up_ self
  end
