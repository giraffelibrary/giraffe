structure GtkTreeSelection :>
  GTK_TREE_SELECTION
    where type 'a class = 'a GtkTreeSelectionClass.class
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type 'a tree_view_class = 'a GtkTreeViewClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type tree_path_t = GtkTreePathRecord.t
    where type selection_mode_t = GtkSelectionMode.t =
  struct
    val getType_ = _import "gtk_tree_selection_get_type" : unit -> GObjectType.FFI.val_;
    val countSelectedRows_ = _import "gtk_tree_selection_count_selected_rows" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p -> GInt.FFI.val_;
    val getMode_ = _import "gtk_tree_selection_get_mode" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p -> GtkSelectionMode.FFI.val_;
    val getSelected_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_selection_get_selected" :
              GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p
               * (GtkTreeModelClass.FFI.opt, GtkTreeModelClass.FFI.non_opt) GtkTreeModelClass.FFI.r
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getTreeView_ = _import "gtk_tree_selection_get_tree_view" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p -> GtkTreeViewClass.FFI.non_opt GtkTreeViewClass.FFI.p;
    val iterIsSelected_ = fn x1 & x2 => (_import "gtk_tree_selection_iter_is_selected" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val pathIsSelected_ = fn x1 & x2 => (_import "gtk_tree_selection_path_is_selected" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val selectAll_ = _import "gtk_tree_selection_select_all" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p -> unit;
    val selectIter_ = fn x1 & x2 => (_import "gtk_tree_selection_select_iter" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> unit;) (x1, x2)
    val selectPath_ = fn x1 & x2 => (_import "gtk_tree_selection_select_path" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> unit;) (x1, x2)
    val selectRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_selection_select_range" :
              GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMode_ = fn x1 & x2 => (_import "gtk_tree_selection_set_mode" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p * GtkSelectionMode.FFI.val_ -> unit;) (x1, x2)
    val unselectAll_ = _import "gtk_tree_selection_unselect_all" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p -> unit;
    val unselectIter_ = fn x1 & x2 => (_import "gtk_tree_selection_unselect_iter" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> unit;) (x1, x2)
    val unselectPath_ = fn x1 & x2 => (_import "gtk_tree_selection_unselect_path" : GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> unit;) (x1, x2)
    val unselectRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_selection_unselect_range" :
              GtkTreeSelectionClass.FFI.non_opt GtkTreeSelectionClass.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun countSelectedRows self = (GtkTreeSelectionClass.FFI.withPtr false ---> GInt.FFI.fromVal) countSelectedRows_ self
    fun getMode self = (GtkTreeSelectionClass.FFI.withPtr false ---> GtkSelectionMode.FFI.fromVal) getMode_ self
    fun getSelected self =
      let
        val model
         & iter
         & retVal =
          (
            GtkTreeSelectionClass.FFI.withPtr false
             &&&> GtkTreeModelClass.FFI.withRefOptPtr false
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
    fun getTreeView self = (GtkTreeSelectionClass.FFI.withPtr false ---> GtkTreeViewClass.FFI.fromPtr false) getTreeView_ self
    fun iterIsSelected self iter = (GtkTreeSelectionClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) iterIsSelected_ (self & iter)
    fun pathIsSelected self path = (GtkTreeSelectionClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GBool.FFI.fromVal) pathIsSelected_ (self & path)
    fun selectAll self = (GtkTreeSelectionClass.FFI.withPtr false ---> I) selectAll_ self
    fun selectIter self iter = (GtkTreeSelectionClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> I) selectIter_ (self & iter)
    fun selectPath self path = (GtkTreeSelectionClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> I) selectPath_ (self & path)
    fun selectRange self (startPath, endPath) =
      (
        GtkTreeSelectionClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         ---> I
      )
        selectRange_
        (
          self
           & startPath
           & endPath
        )
    fun setMode self type' = (GtkTreeSelectionClass.FFI.withPtr false &&&> GtkSelectionMode.FFI.withVal ---> I) setMode_ (self & type')
    fun unselectAll self = (GtkTreeSelectionClass.FFI.withPtr false ---> I) unselectAll_ self
    fun unselectIter self iter = (GtkTreeSelectionClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> I) unselectIter_ (self & iter)
    fun unselectPath self path = (GtkTreeSelectionClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> I) unselectPath_ (self & path)
    fun unselectRange self (startPath, endPath) =
      (
        GtkTreeSelectionClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
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
          set = fn x => set "mode" GtkSelectionMode.t x,
          new = fn x => new "mode" GtkSelectionMode.t x
        }
    end
  end
