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
      val getType_ = call (getSymbol "gtk_tree_selection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val countSelectedRows_ = call (getSymbol "gtk_tree_selection_count_selected_rows") (GtkTreeSelectionClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMode_ = call (getSymbol "gtk_tree_selection_get_mode") (GtkTreeSelectionClass.PolyML.cPtr --> GtkSelectionMode.PolyML.cVal)
      val getSelected_ =
        call (getSymbol "gtk_tree_selection_get_selected")
          (
            GtkTreeSelectionClass.PolyML.cPtr
             &&> GtkTreeModelClass.PolyML.cOutRef
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getTreeView_ = call (getSymbol "gtk_tree_selection_get_tree_view") (GtkTreeSelectionClass.PolyML.cPtr --> GtkTreeViewClass.PolyML.cPtr)
      val iterIsSelected_ = call (getSymbol "gtk_tree_selection_iter_is_selected") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val pathIsSelected_ = call (getSymbol "gtk_tree_selection_path_is_selected") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val selectAll_ = call (getSymbol "gtk_tree_selection_select_all") (GtkTreeSelectionClass.PolyML.cPtr --> cVoid)
      val selectIter_ = call (getSymbol "gtk_tree_selection_select_iter") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> cVoid)
      val selectPath_ = call (getSymbol "gtk_tree_selection_select_path") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val selectRange_ =
        call (getSymbol "gtk_tree_selection_select_range")
          (
            GtkTreeSelectionClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> cVoid
          )
      val setMode_ = call (getSymbol "gtk_tree_selection_set_mode") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkSelectionMode.PolyML.cVal --> cVoid)
      val unselectAll_ = call (getSymbol "gtk_tree_selection_unselect_all") (GtkTreeSelectionClass.PolyML.cPtr --> cVoid)
      val unselectIter_ = call (getSymbol "gtk_tree_selection_unselect_iter") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> cVoid)
      val unselectPath_ = call (getSymbol "gtk_tree_selection_unselect_path") (GtkTreeSelectionClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val unselectRange_ =
        call (getSymbol "gtk_tree_selection_unselect_range")
          (
            GtkTreeSelectionClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> cVoid
          )
    end
    type 'a class = 'a GtkTreeSelectionClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type 'a tree_view_class = 'a GtkTreeViewClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type tree_path_t = GtkTreePathRecord.t
    type selection_mode_t = GtkSelectionMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun countSelectedRows self = (GtkTreeSelectionClass.FFI.withPtr ---> GInt.FFI.fromVal) countSelectedRows_ self
    fun getMode self = (GtkTreeSelectionClass.FFI.withPtr ---> GtkSelectionMode.FFI.fromVal) getMode_ self
    fun getSelected self =
      let
        val model
         & iter
         & retVal =
          (
            GtkTreeSelectionClass.FFI.withPtr
             &&&> GtkTreeModelClass.FFI.withRefOptPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             ---> GtkTreeModelClass.FFI.fromPtr false
                   && GtkTreeIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
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
    fun getTreeView self = (GtkTreeSelectionClass.FFI.withPtr ---> GtkTreeViewClass.FFI.fromPtr false) getTreeView_ self
    fun iterIsSelected self iter = (GtkTreeSelectionClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) iterIsSelected_ (self & iter)
    fun pathIsSelected self path = (GtkTreeSelectionClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) pathIsSelected_ (self & path)
    fun selectAll self = (GtkTreeSelectionClass.FFI.withPtr ---> I) selectAll_ self
    fun selectIter self iter = (GtkTreeSelectionClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> I) selectIter_ (self & iter)
    fun selectPath self path = (GtkTreeSelectionClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> I) selectPath_ (self & path)
    fun selectRange self (startPath, endPath) =
      (
        GtkTreeSelectionClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         ---> I
      )
        selectRange_
        (
          self
           & startPath
           & endPath
        )
    fun setMode self type' = (GtkTreeSelectionClass.FFI.withPtr &&&> GtkSelectionMode.FFI.withVal ---> I) setMode_ (self & type')
    fun unselectAll self = (GtkTreeSelectionClass.FFI.withPtr ---> I) unselectAll_ self
    fun unselectIter self iter = (GtkTreeSelectionClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> I) unselectIter_ (self & iter)
    fun unselectPath self path = (GtkTreeSelectionClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> I) unselectPath_ (self & path)
    fun unselectRange self (startPath, endPath) =
      (
        GtkTreeSelectionClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
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
