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
      val getType_ = call (load_sym libgtk "gtk_tree_model_filter_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val clearCache_ = call (load_sym libgtk "gtk_tree_model_filter_clear_cache") (GtkTreeModelFilterClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val convertChildIterToIter_ =
        call (load_sym libgtk "gtk_tree_model_filter_convert_child_iter_to_iter")
          (
            GtkTreeModelFilterClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val convertChildPathToPath_ = call (load_sym libgtk "gtk_tree_model_filter_convert_child_path_to_path") (GtkTreeModelFilterClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val convertIterToChildIter_ =
        call (load_sym libgtk "gtk_tree_model_filter_convert_iter_to_child_iter")
          (
            GtkTreeModelFilterClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val convertPathToChildPath_ = call (load_sym libgtk "gtk_tree_model_filter_convert_path_to_child_path") (GtkTreeModelFilterClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val getModel_ = call (load_sym libgtk "gtk_tree_model_filter_get_model") (GtkTreeModelFilterClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
      val refilter_ = call (load_sym libgtk "gtk_tree_model_filter_refilter") (GtkTreeModelFilterClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setVisibleColumn_ = call (load_sym libgtk "gtk_tree_model_filter_set_visible_column") (GtkTreeModelFilterClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
    end
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
