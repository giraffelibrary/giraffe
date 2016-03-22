structure GtkTreeModelFilter :>
  GTK_TREE_MODEL_FILTER
    where type 'a class = 'a GtkTreeModelFilterClass.class
    where type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_model_filter_get_type" : unit -> GObjectType.C.val_;
    val clearCache_ = _import "gtk_tree_model_filter_clear_cache" : GtkTreeModelFilterClass.C.notnull GtkTreeModelFilterClass.C.p -> unit;
    val convertChildIterToIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_filter_convert_child_iter_to_iter" :
              GtkTreeModelFilterClass.C.notnull GtkTreeModelFilterClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val convertChildPathToPath_ = fn x1 & x2 => (_import "gtk_tree_model_filter_convert_child_path_to_path" : GtkTreeModelFilterClass.C.notnull GtkTreeModelFilterClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p;) (x1, x2)
    val convertIterToChildIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_filter_convert_iter_to_child_iter" :
              GtkTreeModelFilterClass.C.notnull GtkTreeModelFilterClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val convertPathToChildPath_ = fn x1 & x2 => (_import "gtk_tree_model_filter_convert_path_to_child_path" : GtkTreeModelFilterClass.C.notnull GtkTreeModelFilterClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p;) (x1, x2)
    val getModel_ = _import "gtk_tree_model_filter_get_model" : GtkTreeModelFilterClass.C.notnull GtkTreeModelFilterClass.C.p -> GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p;
    val refilter_ = _import "gtk_tree_model_filter_refilter" : GtkTreeModelFilterClass.C.notnull GtkTreeModelFilterClass.C.p -> unit;
    val setVisibleColumn_ = fn x1 & x2 => (_import "gtk_tree_model_filter_set_visible_column" : GtkTreeModelFilterClass.C.notnull GtkTreeModelFilterClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkTreeModelFilterClass.class
    type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    fun asTreeDragSource self = (GObjectObjectClass.C.withPtr ---> GtkTreeDragSourceClass.C.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun clearCache self = (GtkTreeModelFilterClass.C.withPtr ---> I) clearCache_ self
    fun convertChildIterToIter self childIter =
      let
        val filterIter & retVal =
          (
            GtkTreeModelFilterClass.C.withPtr
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
        if retVal then SOME filterIter else NONE
      end
    fun convertChildPathToPath self childPath = (GtkTreeModelFilterClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) convertChildPathToPath_ (self & childPath)
    fun convertIterToChildIter self filterIter =
      let
        val childIter & () =
          (
            GtkTreeModelFilterClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withPtr
             ---> GtkTreeIterRecord.C.fromPtr true && I
          )
            convertIterToChildIter_
            (
              self
               & ()
               & filterIter
            )
      in
        childIter
      end
    fun convertPathToChildPath self filterPath = (GtkTreeModelFilterClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) convertPathToChildPath_ (self & filterPath)
    fun getModel self = (GtkTreeModelFilterClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun refilter self = (GtkTreeModelFilterClass.C.withPtr ---> I) refilter_ self
    fun setVisibleColumn self column = (GtkTreeModelFilterClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setVisibleColumn_ (self & column)
    local
      open Property
    in
      val childModelProp =
        {
          get = fn x => get "child-model" GtkTreeModelClass.tOpt x,
          set = fn x => set "child-model" GtkTreeModelClass.tOpt x
        }
      val virtualRootProp =
        {
          get = fn x => get "virtual-root" GtkTreePathRecord.tOpt x,
          set = fn x => set "virtual-root" GtkTreePathRecord.tOpt x
        }
    end
  end
