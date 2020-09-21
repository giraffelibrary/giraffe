structure GtkTreeRowReference :>
  GTK_TREE_ROW_REFERENCE
    where type t = GtkTreeRowReferenceRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_row_reference_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_tree_row_reference_new") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GtkTreeRowReferenceRecord.PolyML.cPtr)
      val newProxy_ =
        call (getSymbol "gtk_tree_row_reference_new_proxy")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> GtkTreeRowReferenceRecord.PolyML.cPtr
          )
      val copy_ = call (getSymbol "gtk_tree_row_reference_copy") (GtkTreeRowReferenceRecord.PolyML.cPtr --> GtkTreeRowReferenceRecord.PolyML.cPtr)
      val getModel_ = call (getSymbol "gtk_tree_row_reference_get_model") (GtkTreeRowReferenceRecord.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
      val getPath_ = call (getSymbol "gtk_tree_row_reference_get_path") (GtkTreeRowReferenceRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cOptPtr)
      val valid_ = call (getSymbol "gtk_tree_row_reference_valid") (GtkTreeRowReferenceRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val deleted_ = call (getSymbol "gtk_tree_row_reference_deleted") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val inserted_ = call (getSymbol "gtk_tree_row_reference_inserted") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> cVoid)
    end
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
