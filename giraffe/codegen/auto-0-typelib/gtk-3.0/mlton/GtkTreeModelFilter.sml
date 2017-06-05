structure GtkTreeModelFilter :>
  GTK_TREE_MODEL_FILTER
    where type 'a class = 'a GtkTreeModelFilterClass.class
    where type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_model_filter_get_type" : unit -> GObjectType.FFI.val_;
    val clearCache_ = _import "gtk_tree_model_filter_clear_cache" : GtkTreeModelFilterClass.FFI.notnull GtkTreeModelFilterClass.FFI.p -> unit;
    val convertChildIterToIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_filter_convert_child_iter_to_iter" :
              GtkTreeModelFilterClass.FFI.notnull GtkTreeModelFilterClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val convertChildPathToPath_ = fn x1 & x2 => (_import "gtk_tree_model_filter_convert_child_path_to_path" : GtkTreeModelFilterClass.FFI.notnull GtkTreeModelFilterClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p;) (x1, x2)
    val convertIterToChildIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_filter_convert_iter_to_child_iter" :
              GtkTreeModelFilterClass.FFI.notnull GtkTreeModelFilterClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val convertPathToChildPath_ = fn x1 & x2 => (_import "gtk_tree_model_filter_convert_path_to_child_path" : GtkTreeModelFilterClass.FFI.notnull GtkTreeModelFilterClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p;) (x1, x2)
    val getModel_ = _import "gtk_tree_model_filter_get_model" : GtkTreeModelFilterClass.FFI.notnull GtkTreeModelFilterClass.FFI.p -> GtkTreeModelClass.FFI.notnull GtkTreeModelClass.FFI.p;
    val refilter_ = _import "gtk_tree_model_filter_refilter" : GtkTreeModelFilterClass.FFI.notnull GtkTreeModelFilterClass.FFI.p -> unit;
    val setVisibleColumn_ = fn x1 & x2 => (_import "gtk_tree_model_filter_set_visible_column" : GtkTreeModelFilterClass.FFI.notnull GtkTreeModelFilterClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkTreeModelFilterClass.class
    type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    fun asTreeDragSource self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeDragSourceClass.FFI.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearCache self = (GtkTreeModelFilterClass.FFI.withPtr ---> I) clearCache_ self
    fun convertChildIterToIter self childIter =
      let
        val filterIter & retVal =
          (
            GtkTreeModelFilterClass.FFI.withPtr
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
        if retVal then SOME filterIter else NONE
      end
    fun convertChildPathToPath self childPath = (GtkTreeModelFilterClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GtkTreePathRecord.FFI.fromPtr true) convertChildPathToPath_ (self & childPath)
    fun convertIterToChildIter self filterIter =
      let
        val childIter & () =
          (
            GtkTreeModelFilterClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
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
    fun convertPathToChildPath self filterPath = (GtkTreeModelFilterClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GtkTreePathRecord.FFI.fromPtr true) convertPathToChildPath_ (self & filterPath)
    fun getModel self = (GtkTreeModelFilterClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr false) getModel_ self
    fun refilter self = (GtkTreeModelFilterClass.FFI.withPtr ---> I) refilter_ self
    fun setVisibleColumn self column = (GtkTreeModelFilterClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setVisibleColumn_ (self & column)
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
