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
      val getType_ = call (load_sym libgtk "gtk_tree_model_sort_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val clearCache_ = call (load_sym libgtk "gtk_tree_model_sort_clear_cache") (GtkTreeModelSortClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val convertChildIterToIter_ =
        call (load_sym libgtk "gtk_tree_model_sort_convert_child_iter_to_iter")
          (
            GtkTreeModelSortClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val convertChildPathToPath_ = call (load_sym libgtk "gtk_tree_model_sort_convert_child_path_to_path") (GtkTreeModelSortClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val convertIterToChildIter_ =
        call (load_sym libgtk "gtk_tree_model_sort_convert_iter_to_child_iter")
          (
            GtkTreeModelSortClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val convertPathToChildPath_ = call (load_sym libgtk "gtk_tree_model_sort_convert_path_to_child_path") (GtkTreeModelSortClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val getModel_ = call (load_sym libgtk "gtk_tree_model_sort_get_model") (GtkTreeModelSortClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
      val iterIsValid_ = call (load_sym libgtk "gtk_tree_model_sort_iter_is_valid") (GtkTreeModelSortClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val resetDefaultSortFunc_ = call (load_sym libgtk "gtk_tree_model_sort_reset_default_sort_func") (GtkTreeModelSortClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkTreeModelSortClass.class
    type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    type 'a tree_sortable_class = 'a GtkTreeSortableClass.class
    type tree_path_t = GtkTreePathRecord.t
    type tree_iter_t = GtkTreeIterRecord.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
    fun asTreeDragSource self = (GObjectObjectClass.C.withPtr ---> GtkTreeDragSourceClass.C.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) I self
    fun asTreeSortable self = (GObjectObjectClass.C.withPtr ---> GtkTreeSortableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun clearCache self = (GtkTreeModelSortClass.C.withPtr ---> I) clearCache_ self
    fun convertChildIterToIter self childIter =
      let
        val sortIter & retVal =
          (
            GtkTreeModelSortClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withPtr
             ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal
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
    fun convertChildPathToPath self childPath = (GtkTreeModelSortClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) convertChildPathToPath_ (self & childPath)
    fun convertIterToChildIter self sortedIter =
      let
        val childIter & () =
          (
            GtkTreeModelSortClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withPtr
             ---> GtkTreeIterRecord.C.fromPtr true && I
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
    fun convertPathToChildPath self sortedPath = (GtkTreeModelSortClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) convertPathToChildPath_ (self & sortedPath)
    fun getModel self = (GtkTreeModelSortClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun iterIsValid self iter = (GtkTreeModelSortClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterIsValid_ (self & iter)
    fun resetDefaultSortFunc self = (GtkTreeModelSortClass.C.withPtr ---> I) resetDefaultSortFunc_ self
    local
      open Property
    in
      val modelProp =
        {
          get = fn x => get "model" GtkTreeModelClass.tOpt x,
          set = fn x => set "model" GtkTreeModelClass.tOpt x
        }
    end
  end
