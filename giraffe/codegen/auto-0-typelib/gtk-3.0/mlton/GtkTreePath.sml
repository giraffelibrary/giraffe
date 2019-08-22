structure GtkTreePath :>
  GTK_TREE_PATH
    where type t = GtkTreePathRecord.t =
  struct
    structure GInt32CVectorNType =
      CValueCVectorNType(
        structure CElemType = GInt32.C.ValueType
        structure ElemSequence = CValueVectorSequence(GInt32.C.ValueType)
      )
    structure GInt32CVectorN = CVectorN(GInt32CVectorNType)
    val getType_ = _import "gtk_tree_path_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_tree_path_new" : unit -> GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p;
    val newFirst_ = _import "gtk_tree_path_new_first" : unit -> GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p;
    val newFromIndices_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_tree_path_new_from_indicesv" :
              GInt32CVectorN.MLton.p1
               * GInt32CVectorN.FFI.notnull GInt32CVectorN.MLton.p2
               * GUInt64.FFI.val_
               -> GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromString_ = _import "mlton_gtk_tree_path_new_from_string" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p;
    val appendIndex_ = fn x1 & x2 => (_import "gtk_tree_path_append_index" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val compare_ = fn x1 & x2 => (_import "gtk_tree_path_compare" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val copy_ = _import "gtk_tree_path_copy" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p;
    val down_ = _import "gtk_tree_path_down" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> unit;
    val getDepth_ = _import "gtk_tree_path_get_depth" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GInt32.FFI.val_;
    val getIndices_ = fn x1 & x2 => (_import "gtk_tree_path_get_indices_with_depth" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p * GInt32.FFI.ref_ -> GInt32CVectorN.FFI.notnull GInt32CVectorN.FFI.out_p;) (x1, x2)
    val isAncestor_ = fn x1 & x2 => (_import "gtk_tree_path_is_ancestor" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val isDescendant_ = fn x1 & x2 => (_import "gtk_tree_path_is_descendant" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val next_ = _import "gtk_tree_path_next" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> unit;
    val prependIndex_ = fn x1 & x2 => (_import "gtk_tree_path_prepend_index" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val prev_ = _import "gtk_tree_path_prev" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GBool.FFI.val_;
    val toString_ = _import "gtk_tree_path_to_string" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val up_ = _import "gtk_tree_path_up" : GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GBool.FFI.val_;
    type t = GtkTreePathRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTreePathRecord.FFI.fromPtr true) new_ ()
    fun newFirst () = (I ---> GtkTreePathRecord.FFI.fromPtr true) newFirst_ ()
    fun newFromIndices indices =
      let
        val length = LargeInt.fromInt (GInt32CVectorN.length indices)
        val retVal = (GInt32CVectorN.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GtkTreePathRecord.FFI.fromPtr true) newFromIndices_ (indices & length)
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
        val depth & retVal = (GtkTreePathRecord.FFI.withPtr &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && GInt32CVectorN.FFI.fromPtr 0) getIndices_ (self & GInt32.null)
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
