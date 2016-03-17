structure GtkTreeSelection :>
  GTK_TREE_SELECTION
    where type 'a class = 'a GtkTreeSelectionClass.class
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type 'a tree_view_class = 'a GtkTreeViewClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type tree_path_t = GtkTreePathRecord.t
    where type selection_mode_t = GtkSelectionMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_selection_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val countSelectedRows_ = call (load_sym libgtk "gtk_tree_selection_count_selected_rows") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getMode_ = call (load_sym libgtk "gtk_tree_selection_get_mode") (GObjectObjectClass.PolyML.cPtr --> GtkSelectionMode.PolyML.cVal)
      val getSelected_ =
        call (load_sym libgtk "gtk_tree_selection_get_selected")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val getTreeView_ = call (load_sym libgtk "gtk_tree_selection_get_tree_view") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val iterIsSelected_ = call (load_sym libgtk "gtk_tree_selection_iter_is_selected") (GObjectObjectClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val pathIsSelected_ = call (load_sym libgtk "gtk_tree_selection_path_is_selected") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val selectAll_ = call (load_sym libgtk "gtk_tree_selection_select_all") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val selectIter_ = call (load_sym libgtk "gtk_tree_selection_select_iter") (GObjectObjectClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val selectPath_ = call (load_sym libgtk "gtk_tree_selection_select_path") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val selectRange_ =
        call (load_sym libgtk "gtk_tree_selection_select_range")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val setMode_ = call (load_sym libgtk "gtk_tree_selection_set_mode") (GObjectObjectClass.PolyML.cPtr &&> GtkSelectionMode.PolyML.cVal --> FFI.PolyML.cVoid)
      val unselectAll_ = call (load_sym libgtk "gtk_tree_selection_unselect_all") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unselectIter_ = call (load_sym libgtk "gtk_tree_selection_unselect_iter") (GObjectObjectClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unselectPath_ = call (load_sym libgtk "gtk_tree_selection_unselect_path") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unselectRange_ =
        call (load_sym libgtk "gtk_tree_selection_unselect_range")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class = 'a GtkTreeSelectionClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type 'a tree_view_class = 'a GtkTreeViewClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type tree_path_t = GtkTreePathRecord.t
    type selection_mode_t = GtkSelectionMode.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun countSelectedRows self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) countSelectedRows_ self
    fun getMode self = (GObjectObjectClass.C.withPtr ---> GtkSelectionMode.C.fromVal) getMode_ self
    fun getSelected self =
      let
        val model
         & iter
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             ---> GtkTreeModelClass.C.fromPtr false
                   && GtkTreeIterRecord.C.fromPtr true
                   && FFI.Bool.C.fromVal
          )
            getSelected_
            (
              self
               & NONE
               & ()
            )
      in
        if retVal then SOME (model, iter) else NONE
      end
    fun getTreeView self = (GObjectObjectClass.C.withPtr ---> GtkTreeViewClass.C.fromPtr false) getTreeView_ self
    fun iterIsSelected self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterIsSelected_ (self & iter)
    fun pathIsSelected self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) pathIsSelected_ (self & path)
    fun selectAll self = (GObjectObjectClass.C.withPtr ---> I) selectAll_ self
    fun selectIter self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) selectIter_ (self & iter)
    fun selectPath self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) selectPath_ (self & path)
    fun selectRange self startPath endPath =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         ---> I
      )
        selectRange_
        (
          self
           & startPath
           & endPath
        )
    fun setMode self type' = (GObjectObjectClass.C.withPtr &&&> GtkSelectionMode.C.withVal ---> I) setMode_ (self & type')
    fun unselectAll self = (GObjectObjectClass.C.withPtr ---> I) unselectAll_ self
    fun unselectIter self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) unselectIter_ (self & iter)
    fun unselectPath self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) unselectPath_ (self & path)
    fun unselectRange self startPath endPath =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         ---> I
      )
        unselectRange_
        (
          self
           & startPath
           & endPath
        )
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val modeProp =
        {
          get = fn x => get "mode" GtkSelectionMode.t x,
          set = fn x => set "mode" GtkSelectionMode.t x
        }
    end
  end
