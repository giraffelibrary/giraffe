structure GtkTreeModelFilter :>
  GTK_TREE_MODEL_FILTER
    where type 'a class = 'a GtkTreeModelFilterClass.class
    where type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_model_filter_get_type" : unit -> GObjectType.FFI.val_;
    val clearCache_ = _import "gtk_tree_model_filter_clear_cache" : GtkTreeModelFilterClass.FFI.non_opt GtkTreeModelFilterClass.FFI.p -> unit;
    val convertChildIterToIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_filter_convert_child_iter_to_iter" :
              GtkTreeModelFilterClass.FFI.non_opt GtkTreeModelFilterClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val convertChildPathToPath_ = fn x1 & x2 => (_import "gtk_tree_model_filter_convert_child_path_to_path" : GtkTreeModelFilterClass.FFI.non_opt GtkTreeModelFilterClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> GtkTreePathRecord.FFI.opt GtkTreePathRecord.FFI.p;) (x1, x2)
    val convertIterToChildIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_filter_convert_iter_to_child_iter" :
              GtkTreeModelFilterClass.FFI.non_opt GtkTreeModelFilterClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val convertPathToChildPath_ = fn x1 & x2 => (_import "gtk_tree_model_filter_convert_path_to_child_path" : GtkTreeModelFilterClass.FFI.non_opt GtkTreeModelFilterClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> GtkTreePathRecord.FFI.opt GtkTreePathRecord.FFI.p;) (x1, x2)
    val getModel_ = _import "gtk_tree_model_filter_get_model" : GtkTreeModelFilterClass.FFI.non_opt GtkTreeModelFilterClass.FFI.p -> GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p;
    val refilter_ = _import "gtk_tree_model_filter_refilter" : GtkTreeModelFilterClass.FFI.non_opt GtkTreeModelFilterClass.FFI.p -> unit;
    val setVisibleColumn_ = fn x1 & x2 => (_import "gtk_tree_model_filter_set_visible_column" : GtkTreeModelFilterClass.FFI.non_opt GtkTreeModelFilterClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkTreeModelFilterClass.class
    type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    fun asTreeDragSource self = (GObjectObjectClass.FFI.withPtr false ---> GtkTreeDragSourceClass.FFI.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearCache self = (GtkTreeModelFilterClass.FFI.withPtr false ---> I) clearCache_ self
    fun convertChildIterToIter self childIter =
      let
        val filterIter & retVal =
          (
            GtkTreeModelFilterClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withPtr false
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
    fun convertChildPathToPath self childPath = (GtkTreeModelFilterClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GtkTreePathRecord.FFI.fromOptPtr true) convertChildPathToPath_ (self & childPath)
    fun convertIterToChildIter self filterIter =
      let
        val childIter & () =
          (
            GtkTreeModelFilterClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withPtr false
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
    fun convertPathToChildPath self filterPath = (GtkTreeModelFilterClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GtkTreePathRecord.FFI.fromOptPtr true) convertPathToChildPath_ (self & filterPath)
    fun getModel self = (GtkTreeModelFilterClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromPtr false) getModel_ self before GtkTreeModelFilterClass.FFI.touchPtr self
    fun refilter self = (GtkTreeModelFilterClass.FFI.withPtr false ---> I) refilter_ self
    fun setVisibleColumn self column = (GtkTreeModelFilterClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setVisibleColumn_ (self & column)
    local
      open ValueAccessor
    in
      val childModelProp =
        {
          name = "child-model",
          gtype = fn () => C.gtype GtkTreeModelClass.tOpt (),
          get = fn x => fn () => C.get GtkTreeModelClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkTreeModelClass.tOpt x
        }
      val virtualRootProp =
        {
          name = "virtual-root",
          gtype = fn () => C.gtype GtkTreePathRecord.tOpt (),
          get = fn x => fn () => C.get GtkTreePathRecord.tOpt x,
          set = ignore,
          init = fn x => C.set GtkTreePathRecord.tOpt x
        }
    end
  end
