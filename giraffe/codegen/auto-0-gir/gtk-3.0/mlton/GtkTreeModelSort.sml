structure GtkTreeModelSort :>
  GTK_TREE_MODEL_SORT
    where type 'a class = 'a GtkTreeModelSortClass.class
    where type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    where type 'a tree_sortable_class = 'a GtkTreeSortableClass.class
    where type tree_path_t = GtkTreePathRecord.t
    where type tree_iter_t = GtkTreeIterRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class =
  struct
    val getType_ = _import "gtk_tree_model_sort_get_type" : unit -> GObjectType.C.val_;
    val clearCache_ = _import "gtk_tree_model_sort_clear_cache" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val convertChildIterToIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_sort_convert_child_iter_to_iter" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val convertChildPathToPath_ = fn x1 & x2 => (_import "gtk_tree_model_sort_convert_child_path_to_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p;) (x1, x2)
    val convertIterToChildIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_sort_convert_iter_to_child_iter" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val convertPathToChildPath_ = fn x1 & x2 => (_import "gtk_tree_model_sort_convert_path_to_child_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p;) (x1, x2)
    val getModel_ = _import "gtk_tree_model_sort_get_model" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val iterIsValid_ = fn x1 & x2 => (_import "gtk_tree_model_sort_iter_is_valid" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val resetDefaultSortFunc_ = _import "gtk_tree_model_sort_reset_default_sort_func" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
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
