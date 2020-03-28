structure GtkTreePath :>
  GTK_TREE_PATH
    where type t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_path_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_tree_path_new") (cVoid --> GtkTreePathRecord.PolyML.cPtr)
      val newFirst_ = call (getSymbol "gtk_tree_path_new_first") (cVoid --> GtkTreePathRecord.PolyML.cPtr)
      val newFromIndices_ = call (getSymbol "gtk_tree_path_new_from_indicesv") (GInt32CArrayN.PolyML.cInPtr &&> GUInt64.PolyML.cVal --> GtkTreePathRecord.PolyML.cPtr)
      val newFromString_ = call (getSymbol "gtk_tree_path_new_from_string") (Utf8.PolyML.cInPtr --> GtkTreePathRecord.PolyML.cPtr)
      val appendIndex_ = call (getSymbol "gtk_tree_path_append_index") (GtkTreePathRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val compare_ = call (getSymbol "gtk_tree_path_compare") (GtkTreePathRecord.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val copy_ = call (getSymbol "gtk_tree_path_copy") (GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val down_ = call (getSymbol "gtk_tree_path_down") (GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val getDepth_ = call (getSymbol "gtk_tree_path_get_depth") (GtkTreePathRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getIndices_ = call (getSymbol "gtk_tree_path_get_indices_with_depth") (GtkTreePathRecord.PolyML.cPtr &&> GInt32.PolyML.cRef --> GInt32CArrayN.PolyML.cOutPtr)
      val isAncestor_ = call (getSymbol "gtk_tree_path_is_ancestor") (GtkTreePathRecord.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isDescendant_ = call (getSymbol "gtk_tree_path_is_descendant") (GtkTreePathRecord.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val next_ = call (getSymbol "gtk_tree_path_next") (GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val prependIndex_ = call (getSymbol "gtk_tree_path_prepend_index") (GtkTreePathRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val prev_ = call (getSymbol "gtk_tree_path_prev") (GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val toString_ = call (getSymbol "gtk_tree_path_to_string") (GtkTreePathRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val up_ = call (getSymbol "gtk_tree_path_up") (GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = GtkTreePathRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTreePathRecord.FFI.fromPtr true) new_ ()
    fun newFirst () = (I ---> GtkTreePathRecord.FFI.fromPtr true) newFirst_ ()
    fun newFromIndices indices =
      let
        val length = LargeInt.fromInt (GInt32CArrayN.length indices)
        val retVal = (GInt32CArrayN.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GtkTreePathRecord.FFI.fromPtr true) newFromIndices_ (indices & length)
      in
        retVal
      end
    fun newFromString path = (Utf8.FFI.withPtr ---> GtkTreePathRecord.FFI.fromPtr true) newFromString_ path
    fun appendIndex self index = (GtkTreePathRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) appendIndex_ (self & index)
    fun compare self b = (GtkTreePathRecord.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GInt32.FFI.fromVal) compare_ (self & b)
    fun copy self = (GtkTreePathRecord.FFI.withPtr ---> GtkTreePathRecord.FFI.fromPtr true) copy_ self
    fun down self = (GtkTreePathRecord.FFI.withPtr ---> I) down_ self
    fun getDepth self = (GtkTreePathRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getDepth_ self
    fun getIndices self =
      let
        val depth & retVal = (GtkTreePathRecord.FFI.withPtr &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && GInt32CArrayN.FFI.fromPtr 0) getIndices_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt depth)
      end
    fun isAncestor self descendant = (GtkTreePathRecord.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) isAncestor_ (self & descendant)
    fun isDescendant self ancestor = (GtkTreePathRecord.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) isDescendant_ (self & ancestor)
    fun next self = (GtkTreePathRecord.FFI.withPtr ---> I) next_ self
    fun prependIndex self index = (GtkTreePathRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) prependIndex_ (self & index)
    fun prev self = (GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) prev_ self
    fun toString self = (GtkTreePathRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
    fun up self = (GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) up_ self
  end
