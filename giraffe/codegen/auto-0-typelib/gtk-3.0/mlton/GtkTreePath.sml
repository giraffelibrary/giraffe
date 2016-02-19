structure GtkTreePath :>
  GTK_TREE_PATH
    where type record_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_path_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_tree_path_new" : unit -> GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p;
    val newFirst_ = _import "gtk_tree_path_new_first" : unit -> GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p;
    val newFromString_ = _import "mlton_gtk_tree_path_new_from_string" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p;
    val appendIndex_ = fn x1 & x2 => (_import "gtk_tree_path_append_index" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val compare_ = fn x1 & x2 => (_import "gtk_tree_path_compare" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Int32.C.val_;) (x1, x2)
    val copy_ = _import "gtk_tree_path_copy" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p;
    val down_ = _import "gtk_tree_path_down" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> unit;
    val getDepth_ = _import "gtk_tree_path_get_depth" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Int32.C.val_;
    val isAncestor_ = fn x1 & x2 => (_import "gtk_tree_path_is_ancestor" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val isDescendant_ = fn x1 & x2 => (_import "gtk_tree_path_is_descendant" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val next_ = _import "gtk_tree_path_next" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> unit;
    val prependIndex_ = fn x1 & x2 => (_import "gtk_tree_path_prepend_index" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val prev_ = _import "gtk_tree_path_prev" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Bool.C.val_;
    val toString_ = _import "gtk_tree_path_to_string" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val up_ = _import "gtk_tree_path_up" : GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Bool.C.val_;
    type record_t = GtkTreePathRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTreePathRecord.C.fromPtr true) new_ ()
    fun newFirst () = (I ---> GtkTreePathRecord.C.fromPtr true) newFirst_ ()
    fun newFromString path = (Utf8.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) newFromString_ path
    fun appendIndex self index = (GtkTreePathRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> I) appendIndex_ (self & index)
    fun compare self b = (GtkTreePathRecord.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Int32.C.fromVal) compare_ (self & b)
    fun copy self = (GtkTreePathRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) copy_ self
    fun down self = (GtkTreePathRecord.C.withPtr ---> I) down_ self
    fun getDepth self = (GtkTreePathRecord.C.withPtr ---> FFI.Int32.C.fromVal) getDepth_ self
    fun isAncestor self descendant = (GtkTreePathRecord.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) isAncestor_ (self & descendant)
    fun isDescendant self ancestor = (GtkTreePathRecord.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) isDescendant_ (self & ancestor)
    fun next self = (GtkTreePathRecord.C.withPtr ---> I) next_ self
    fun prependIndex self index = (GtkTreePathRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> I) prependIndex_ (self & index)
    fun prev self = (GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) prev_ self
    fun toString self = (GtkTreePathRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
    fun up self = (GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) up_ self
  end
