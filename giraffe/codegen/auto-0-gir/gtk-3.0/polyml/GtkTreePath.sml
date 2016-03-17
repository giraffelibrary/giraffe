structure GtkTreePath :>
  GTK_TREE_PATH
    where type t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_path_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_tree_path_new") (FFI.PolyML.cVoid --> GtkTreePathRecord.PolyML.cPtr)
      val newFirst_ = call (load_sym libgtk "gtk_tree_path_new_first") (FFI.PolyML.cVoid --> GtkTreePathRecord.PolyML.cPtr)
      val newFromString_ = call (load_sym libgtk "gtk_tree_path_new_from_string") (Utf8.PolyML.cInPtr --> GtkTreePathRecord.PolyML.cPtr)
      val appendIndex_ = call (load_sym libgtk "gtk_tree_path_append_index") (GtkTreePathRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val compare_ = call (load_sym libgtk "gtk_tree_path_compare") (GtkTreePathRecord.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val copy_ = call (load_sym libgtk "gtk_tree_path_copy") (GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val down_ = call (load_sym libgtk "gtk_tree_path_down") (GtkTreePathRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getDepth_ = call (load_sym libgtk "gtk_tree_path_get_depth") (GtkTreePathRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val isAncestor_ = call (load_sym libgtk "gtk_tree_path_is_ancestor") (GtkTreePathRecord.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isDescendant_ = call (load_sym libgtk "gtk_tree_path_is_descendant") (GtkTreePathRecord.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val next_ = call (load_sym libgtk "gtk_tree_path_next") (GtkTreePathRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val prependIndex_ = call (load_sym libgtk "gtk_tree_path_prepend_index") (GtkTreePathRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val prev_ = call (load_sym libgtk "gtk_tree_path_prev") (GtkTreePathRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val toString_ = call (load_sym libgtk "gtk_tree_path_to_string") (GtkTreePathRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val up_ = call (load_sym libgtk "gtk_tree_path_up") (GtkTreePathRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type t = GtkTreePathRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTreePathRecord.C.fromPtr true) new_ ()
    fun newFirst () = (I ---> GtkTreePathRecord.C.fromPtr true) newFirst_ ()
    fun newFromString path = (Utf8.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) newFromString_ path
    fun appendIndex self index = (GtkTreePathRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) appendIndex_ (self & index)
    fun compare self b = (GtkTreePathRecord.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Int.C.fromVal) compare_ (self & b)
    fun copy self = (GtkTreePathRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) copy_ self
    fun down self = (GtkTreePathRecord.C.withPtr ---> I) down_ self
    fun getDepth self = (GtkTreePathRecord.C.withPtr ---> FFI.Int.C.fromVal) getDepth_ self
    fun isAncestor self descendant = (GtkTreePathRecord.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) isAncestor_ (self & descendant)
    fun isDescendant self ancestor = (GtkTreePathRecord.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) isDescendant_ (self & ancestor)
    fun next self = (GtkTreePathRecord.C.withPtr ---> I) next_ self
    fun prependIndex self index = (GtkTreePathRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) prependIndex_ (self & index)
    fun prev self = (GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) prev_ self
    fun toString self = (GtkTreePathRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
    fun up self = (GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) up_ self
  end
