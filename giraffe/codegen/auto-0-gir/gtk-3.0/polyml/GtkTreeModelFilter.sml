structure GtkTreeModelFilter :>
  GTK_TREE_MODEL_FILTER
    where type 'a class_t = 'a GtkTreeModelFilterClass.t
    where type 'a tree_drag_source_class_t = 'a GtkTreeDragSourceClass.t
    where type tree_iter_record_t = GtkTreeIterRecord.t
    where type 'a tree_model_class_t = 'a GtkTreeModelClass.t
    where type tree_path_record_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_model_filter_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val clearCache_ = call (load_sym libgtk "gtk_tree_model_filter_clear_cache") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val convertChildIterToIter_ =
        call (load_sym libgtk "gtk_tree_model_filter_convert_child_iter_to_iter")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val convertChildPathToPath_ = call (load_sym libgtk "gtk_tree_model_filter_convert_child_path_to_path") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val convertIterToChildIter_ =
        call (load_sym libgtk "gtk_tree_model_filter_convert_iter_to_child_iter")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val convertPathToChildPath_ = call (load_sym libgtk "gtk_tree_model_filter_convert_path_to_child_path") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val getModel_ = call (load_sym libgtk "gtk_tree_model_filter_get_model") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val refilter_ = call (load_sym libgtk "gtk_tree_model_filter_refilter") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setVisibleColumn_ = call (load_sym libgtk "gtk_tree_model_filter_set_visible_column") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkTreeModelFilterClass.t
    type 'a tree_drag_source_class_t = 'a GtkTreeDragSourceClass.t
    type tree_iter_record_t = GtkTreeIterRecord.t
    type 'a tree_model_class_t = 'a GtkTreeModelClass.t
    type tree_path_record_t = GtkTreePathRecord.t
    type t = base class_t
    fun asTreeDragSource self = (GObjectObjectClass.C.withPtr ---> GtkTreeDragSourceClass.C.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun clearCache self = (GObjectObjectClass.C.withPtr ---> I) clearCache_ self
    fun convertChildIterToIter self childIter =
      let
        val filterIter & retVal =
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
        if retVal then SOME filterIter else NONE
      end
    fun convertChildPathToPath self childPath = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) convertChildPathToPath_ (self & childPath)
    fun convertIterToChildIter self filterIter =
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
               & filterIter
            )
      in
        childIter
      end
    fun convertPathToChildPath self filterPath = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) convertPathToChildPath_ (self & filterPath)
    fun getModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun refilter self = (GObjectObjectClass.C.withPtr ---> I) refilter_ self
    fun setVisibleColumn self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setVisibleColumn_ (self & column)
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
