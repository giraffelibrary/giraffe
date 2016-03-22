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
      val countSelectedRows_ = call (load_sym libgtk "gtk_tree_selection_count_selected_rows") (GtkTreeSelectionClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getMode_ = call (load_sym libgtk "gtk_tree_selection_get_mode") (GtkTreeSelectionClass.PolyML.cPtr --> GtkSelectionMode.PolyML.cVal)
      val getSelected_ =
        call (load_sym libgtk "gtk_tree_selection_get_selected")
          (
            GtkTreeSelectionClass.PolyML.cPtr
             &&> GtkTreeModelClass.PolyML.cOutRef
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val getTreeView_ = call (load_sym libgtk "gtk_tree_selection_get_tree_view") (GtkTreeSelectionClass.PolyML.cPtr --> GtkTreeViewClass.PolyML.cPtr)
      val iterIsSelected_ = call (load_sym libgtk "gtk_tree_selection_iter_is_selected") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val pathIsSelected_ = call (load_sym libgtk "gtk_tree_selection_path_is_selected") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val selectAll_ = call (load_sym libgtk "gtk_tree_selection_select_all") (GtkTreeSelectionClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val selectIter_ = call (load_sym libgtk "gtk_tree_selection_select_iter") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val selectPath_ = call (load_sym libgtk "gtk_tree_selection_select_path") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val selectRange_ =
        call (load_sym libgtk "gtk_tree_selection_select_range")
          (
            GtkTreeSelectionClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val setMode_ = call (load_sym libgtk "gtk_tree_selection_set_mode") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkSelectionMode.PolyML.cVal --> FFI.PolyML.cVoid)
      val unselectAll_ = call (load_sym libgtk "gtk_tree_selection_unselect_all") (GtkTreeSelectionClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unselectIter_ = call (load_sym libgtk "gtk_tree_selection_unselect_iter") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unselectPath_ = call (load_sym libgtk "gtk_tree_selection_unselect_path") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unselectRange_ =
        call (load_sym libgtk "gtk_tree_selection_unselect_range")
          (
            GtkTreeSelectionClass.PolyML.cPtr
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
    fun countSelectedRows self = (GtkTreeSelectionClass.C.withPtr ---> FFI.Int.C.fromVal) countSelectedRows_ self
    fun getMode self = (GtkTreeSelectionClass.C.withPtr ---> GtkSelectionMode.C.fromVal) getMode_ self
    fun getSelected self =
      let
        val model
         & iter
         & retVal =
          (
            GtkTreeSelectionClass.C.withPtr
             &&&> GtkTreeModelClass.C.withRefOptPtr
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
    fun getTreeView self = (GtkTreeSelectionClass.C.withPtr ---> GtkTreeViewClass.C.fromPtr false) getTreeView_ self
    fun iterIsSelected self iter = (GtkTreeSelectionClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterIsSelected_ (self & iter)
    fun pathIsSelected self path = (GtkTreeSelectionClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) pathIsSelected_ (self & path)
    fun selectAll self = (GtkTreeSelectionClass.C.withPtr ---> I) selectAll_ self
    fun selectIter self iter = (GtkTreeSelectionClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) selectIter_ (self & iter)
    fun selectPath self path = (GtkTreeSelectionClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) selectPath_ (self & path)
    fun selectRange self startPath endPath =
      (
        GtkTreeSelectionClass.C.withPtr
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
    fun setMode self type' = (GtkTreeSelectionClass.C.withPtr &&&> GtkSelectionMode.C.withVal ---> I) setMode_ (self & type')
    fun unselectAll self = (GtkTreeSelectionClass.C.withPtr ---> I) unselectAll_ self
    fun unselectIter self iter = (GtkTreeSelectionClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) unselectIter_ (self & iter)
    fun unselectPath self path = (GtkTreeSelectionClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) unselectPath_ (self & path)
    fun unselectRange self startPath endPath =
      (
        GtkTreeSelectionClass.C.withPtr
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
