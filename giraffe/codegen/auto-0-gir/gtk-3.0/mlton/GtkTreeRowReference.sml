structure GtkTreeRowReference :>
  GTK_TREE_ROW_REFERENCE
    where type t = GtkTreeRowReferenceRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_row_reference_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_tree_row_reference_new" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> GtkTreeRowReferenceRecord.FFI.non_opt GtkTreeRowReferenceRecord.FFI.p;) (x1, x2)
    val newProxy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_row_reference_new_proxy" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               -> GtkTreeRowReferenceRecord.FFI.non_opt GtkTreeRowReferenceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val copy_ = _import "gtk_tree_row_reference_copy" : GtkTreeRowReferenceRecord.FFI.non_opt GtkTreeRowReferenceRecord.FFI.p -> GtkTreeRowReferenceRecord.FFI.non_opt GtkTreeRowReferenceRecord.FFI.p;
    val getModel_ = _import "gtk_tree_row_reference_get_model" : GtkTreeRowReferenceRecord.FFI.non_opt GtkTreeRowReferenceRecord.FFI.p -> GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p;
    val getPath_ = _import "gtk_tree_row_reference_get_path" : GtkTreeRowReferenceRecord.FFI.non_opt GtkTreeRowReferenceRecord.FFI.p -> GtkTreePathRecord.FFI.opt GtkTreePathRecord.FFI.p;
    val valid_ = _import "gtk_tree_row_reference_valid" : GtkTreeRowReferenceRecord.FFI.non_opt GtkTreeRowReferenceRecord.FFI.p -> GBool.FFI.val_;
    val deleted_ = fn x1 & x2 => (_import "gtk_tree_row_reference_deleted" : GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> unit;) (x1, x2)
    val inserted_ = fn x1 & x2 => (_import "gtk_tree_row_reference_inserted" : GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> unit;) (x1, x2)
    type t = GtkTreeRowReferenceRecord.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type tree_path_t = GtkTreePathRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (model, path) = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GtkTreeRowReferenceRecord.FFI.fromPtr true) new_ (model & path)
    fun newProxy
      (
        proxy,
        model,
        path
      ) =
      (
        GObjectObjectClass.FFI.withPtr false
         &&&> GtkTreeModelClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         ---> GtkTreeRowReferenceRecord.FFI.fromPtr true
      )
        newProxy_
        (
          proxy
           & model
           & path
        )
    fun copy self = (GtkTreeRowReferenceRecord.FFI.withPtr false ---> GtkTreeRowReferenceRecord.FFI.fromPtr true) copy_ self
    fun getModel self = (GtkTreeRowReferenceRecord.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromPtr false) getModel_ self before GtkTreeRowReferenceRecord.FFI.touchPtr self
    fun getPath self = (GtkTreeRowReferenceRecord.FFI.withPtr false ---> GtkTreePathRecord.FFI.fromOptPtr true) getPath_ self
    fun valid self = (GtkTreeRowReferenceRecord.FFI.withPtr false ---> GBool.FFI.fromVal) valid_ self
    fun deleted (proxy, path) = (GObjectObjectClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> I) deleted_ (proxy & path)
    fun inserted (proxy, path) = (GObjectObjectClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> I) inserted_ (proxy & path)
  end
