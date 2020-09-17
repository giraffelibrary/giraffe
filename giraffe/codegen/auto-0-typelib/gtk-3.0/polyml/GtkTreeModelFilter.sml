structure GtkTreeModelFilter :>
  GTK_TREE_MODEL_FILTER
    where type 'a class = 'a GtkTreeModelFilterClass.class
    where type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_model_filter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val clearCache_ = call (getSymbol "gtk_tree_model_filter_clear_cache") (GtkTreeModelFilterClass.PolyML.cPtr --> cVoid)
      val convertChildIterToIter_ =
        call (getSymbol "gtk_tree_model_filter_convert_child_iter_to_iter")
          (
            GtkTreeModelFilterClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val convertChildPathToPath_ = call (getSymbol "gtk_tree_model_filter_convert_child_path_to_path") (GtkTreeModelFilterClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cOptPtr)
      val convertIterToChildIter_ =
        call (getSymbol "gtk_tree_model_filter_convert_iter_to_child_iter")
          (
            GtkTreeModelFilterClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> cVoid
          )
      val convertPathToChildPath_ = call (getSymbol "gtk_tree_model_filter_convert_path_to_child_path") (GtkTreeModelFilterClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cOptPtr)
      val getModel_ = call (getSymbol "gtk_tree_model_filter_get_model") (GtkTreeModelFilterClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
      val refilter_ = call (getSymbol "gtk_tree_model_filter_refilter") (GtkTreeModelFilterClass.PolyML.cPtr --> cVoid)
      val setVisibleColumn_ = call (getSymbol "gtk_tree_model_filter_set_visible_column") (GtkTreeModelFilterClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
    end
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
    fun setVisibleColumn self column = (GtkTreeModelFilterClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setVisibleColumn_ (self & column)
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
