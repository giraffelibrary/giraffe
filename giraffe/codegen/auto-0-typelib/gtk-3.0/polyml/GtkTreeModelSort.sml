structure GtkTreeModelSort :>
  GTK_TREE_MODEL_SORT
    where type 'a class_t = 'a GtkTreeModelSortClass.t
    where type 'a treedragsourceclass_t = 'a GtkTreeDragSourceClass.t
    where type 'a treesortableclass_t = 'a GtkTreeSortableClass.t
    where type treepathrecord_t = GtkTreePathRecord.t
    where type treeiterrecord_t = GtkTreeIterRecord.t
    where type 'a treemodelclass_t = 'a GtkTreeModelClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_model_sort_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val clearCache_ = call (load_sym libgtk "gtk_tree_model_sort_clear_cache") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val convertChildIterToIter_ =
        call (load_sym libgtk "gtk_tree_model_sort_convert_child_iter_to_iter")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val convertChildPathToPath_ = call (load_sym libgtk "gtk_tree_model_sort_convert_child_path_to_path") (GObjectObjectClass.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> GtkTreePathRecord.PolyML.PTR)
      val convertIterToChildIter_ =
        call (load_sym libgtk "gtk_tree_model_sort_convert_iter_to_child_iter")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val convertPathToChildPath_ = call (load_sym libgtk "gtk_tree_model_sort_convert_path_to_child_path") (GObjectObjectClass.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> GtkTreePathRecord.PolyML.PTR)
      val getModel_ = call (load_sym libgtk "gtk_tree_model_sort_get_model") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val iterIsValid_ = call (load_sym libgtk "gtk_tree_model_sort_iter_is_valid") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val resetDefaultSortFunc_ = call (load_sym libgtk "gtk_tree_model_sort_reset_default_sort_func") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkTreeModelSortClass.t
    type 'a treedragsourceclass_t = 'a GtkTreeDragSourceClass.t
    type 'a treesortableclass_t = 'a GtkTreeSortableClass.t
    type treepathrecord_t = GtkTreePathRecord.t
    type treeiterrecord_t = GtkTreeIterRecord.t
    type 'a treemodelclass_t = 'a GtkTreeModelClass.t
    type t = base class_t
    fun asTreeDragSource self = (GObjectObjectClass.C.withPtr ---> GtkTreeDragSourceClass.C.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) I self
    fun asTreeSortable self = (GObjectObjectClass.C.withPtr ---> GtkTreeSortableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun clearCache self = (GObjectObjectClass.C.withPtr ---> I) clearCache_ self
    fun convertChildIterToIter self childIter =
      let
        val sortIter & retVal =
          (
            GObjectObjectClass.C.withPtr
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
    fun convertChildPathToPath self childPath = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) convertChildPathToPath_ (self & childPath)
    fun convertIterToChildIter self sortedIter =
      let
        val childIter & () =
          (
            GObjectObjectClass.C.withPtr
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
    fun convertPathToChildPath self sortedPath = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) convertPathToChildPath_ (self & sortedPath)
    fun getModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun iterIsValid self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterIsValid_ (self & iter)
    fun resetDefaultSortFunc self = (GObjectObjectClass.C.withPtr ---> I) resetDefaultSortFunc_ self
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
