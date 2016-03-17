structure GtkTreeSelection :>
  GTK_TREE_SELECTION
    where type 'a class = 'a GtkTreeSelectionClass.class
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type 'a tree_view_class = 'a GtkTreeViewClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type tree_path_t = GtkTreePathRecord.t
    where type selection_mode_t = GtkSelectionMode.t =
  struct
    val getType_ = _import "gtk_tree_selection_get_type" : unit -> GObjectType.C.val_;
    val countSelectedRows_ = _import "gtk_tree_selection_count_selected_rows" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getMode_ = _import "gtk_tree_selection_get_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkSelectionMode.C.val_;
    val getSelected_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_selection_get_selected" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getTreeView_ = _import "gtk_tree_selection_get_tree_view" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val iterIsSelected_ = fn x1 & x2 => (_import "gtk_tree_selection_iter_is_selected" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val pathIsSelected_ = fn x1 & x2 => (_import "gtk_tree_selection_path_is_selected" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val selectAll_ = _import "gtk_tree_selection_select_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val selectIter_ = fn x1 & x2 => (_import "gtk_tree_selection_select_iter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> unit;) (x1, x2)
    val selectPath_ = fn x1 & x2 => (_import "gtk_tree_selection_select_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> unit;) (x1, x2)
    val selectRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_selection_select_range" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMode_ = fn x1 & x2 => (_import "gtk_tree_selection_set_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkSelectionMode.C.val_ -> unit;) (x1, x2)
    val unselectAll_ = _import "gtk_tree_selection_unselect_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val unselectIter_ = fn x1 & x2 => (_import "gtk_tree_selection_unselect_iter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> unit;) (x1, x2)
    val unselectPath_ = fn x1 & x2 => (_import "gtk_tree_selection_unselect_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> unit;) (x1, x2)
    val unselectRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_selection_unselect_range" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkTreeSelectionClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type 'a tree_view_class = 'a GtkTreeViewClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type tree_path_t = GtkTreePathRecord.t
    type selection_mode_t = GtkSelectionMode.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun countSelectedRows self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) countSelectedRows_ self
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
