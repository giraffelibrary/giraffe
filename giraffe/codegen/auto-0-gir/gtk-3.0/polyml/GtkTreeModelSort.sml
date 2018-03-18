structure GtkTreeModelSort :>
  GTK_TREE_MODEL_SORT
    where type 'a class = 'a GtkTreeModelSortClass.class
    where type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    where type 'a tree_sortable_class = 'a GtkTreeSortableClass.class
    where type tree_path_t = GtkTreePathRecord.t
    where type tree_iter_t = GtkTreeIterRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_model_sort_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val clearCache_ = call (getSymbol "gtk_tree_model_sort_clear_cache") (GtkTreeModelSortClass.PolyML.cPtr --> cVoid)
      val convertChildIterToIter_ =
        call (getSymbol "gtk_tree_model_sort_convert_child_iter_to_iter")
          (
            GtkTreeModelSortClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val convertChildPathToPath_ = call (getSymbol "gtk_tree_model_sort_convert_child_path_to_path") (GtkTreeModelSortClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cOptPtr)
      val convertIterToChildIter_ =
        call (getSymbol "gtk_tree_model_sort_convert_iter_to_child_iter")
          (
            GtkTreeModelSortClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> cVoid
          )
      val convertPathToChildPath_ = call (getSymbol "gtk_tree_model_sort_convert_path_to_child_path") (GtkTreeModelSortClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cOptPtr)
      val getModel_ = call (getSymbol "gtk_tree_model_sort_get_model") (GtkTreeModelSortClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
      val iterIsValid_ = call (getSymbol "gtk_tree_model_sort_iter_is_valid") (GtkTreeModelSortClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val resetDefaultSortFunc_ = call (getSymbol "gtk_tree_model_sort_reset_default_sort_func") (GtkTreeModelSortClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkTreeModelSortClass.class
    type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    type 'a tree_sortable_class = 'a GtkTreeSortableClass.class
    type tree_path_t = GtkTreePathRecord.t
    type tree_iter_t = GtkTreeIterRecord.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
    fun asTreeDragSource self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeDragSourceClass.FFI.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr false) I self
    fun asTreeSortable self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeSortableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearCache self = (GtkTreeModelSortClass.FFI.withPtr ---> I) clearCache_ self
    fun convertChildIterToIter self childIter =
      let
        val sortIter & retVal =
          (
            GtkTreeModelSortClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            convertChildIterToIter_
            (
              self
               & ()
               & childIter
            )
      in
        if retVal then SOME sortIter else NONE
      end
    fun convertChildPathToPath self childPath = (GtkTreeModelSortClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GtkTreePathRecord.FFI.fromOptPtr true) convertChildPathToPath_ (self & childPath)
    fun convertIterToChildIter self sortedIter =
      let
        val childIter & () =
          (
            GtkTreeModelSortClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            convertIterToChildIter_
            (
              self
               & ()
               & sortedIter
            )
      in
        childIter
      end
    fun convertPathToChildPath self sortedPath = (GtkTreeModelSortClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GtkTreePathRecord.FFI.fromOptPtr true) convertPathToChildPath_ (self & sortedPath)
    fun getModel self = (GtkTreeModelSortClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr false) getModel_ self
    fun iterIsValid self iter = (GtkTreeModelSortClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) iterIsValid_ (self & iter)
    fun resetDefaultSortFunc self = (GtkTreeModelSortClass.FFI.withPtr ---> I) resetDefaultSortFunc_ self
    local
      open Property
    in
      val modelProp =
        {
          get = fn x => get "model" GtkTreeModelClass.tOpt x,
          new = fn x => new "model" GtkTreeModelClass.tOpt x
        }
    end
  end
