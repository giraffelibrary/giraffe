signature GTK_TREE_SELECTION =
  sig
    type 'a class
    type 'a tree_model_class
    type 'a tree_view_class
    type tree_iter_t
    type tree_path_t
    type selection_mode_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val countSelectedRows : 'a class -> LargeInt.int
    val getMode : 'a class -> selection_mode_t
    val getSelected : 'a class -> (base tree_model_class * tree_iter_t) option
    val getTreeView : 'a class -> base tree_view_class
    val iterIsSelected :
      'a class
       -> tree_iter_t
       -> bool
    val pathIsSelected :
      'a class
       -> tree_path_t
       -> bool
    val selectAll : 'a class -> unit
    val selectIter :
      'a class
       -> tree_iter_t
       -> unit
    val selectPath :
      'a class
       -> tree_path_t
       -> unit
    val selectRange :
      'a class
       -> tree_path_t * tree_path_t
       -> unit
    val setMode :
      'a class
       -> selection_mode_t
       -> unit
    val unselectAll : 'a class -> unit
    val unselectIter :
      'a class
       -> tree_iter_t
       -> unit
    val unselectPath :
      'a class
       -> tree_path_t
       -> unit
    val unselectRange :
      'a class
       -> tree_path_t * tree_path_t
       -> unit
    val changedSig : (unit -> unit) -> 'a class Signal.signal
    val modeProp : ('a class, selection_mode_t, selection_mode_t) Property.readwrite
  end
