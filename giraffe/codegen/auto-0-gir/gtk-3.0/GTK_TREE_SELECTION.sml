signature GTK_TREE_SELECTION =
  sig
    type 'a class_t
    type 'a tree_model_class_t
    type 'a tree_view_class_t
    type tree_iter_record_t
    type tree_path_record_t
    type selection_mode_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val countSelectedRows : 'a class_t -> LargeInt.int
    val getMode : 'a class_t -> selection_mode_t
    val getSelected : 'a class_t -> (base tree_model_class_t * tree_iter_record_t) option
    val getTreeView : 'a class_t -> base tree_view_class_t
    val iterIsSelected :
      'a class_t
       -> tree_iter_record_t
       -> bool
    val pathIsSelected :
      'a class_t
       -> tree_path_record_t
       -> bool
    val selectAll : 'a class_t -> unit
    val selectIter :
      'a class_t
       -> tree_iter_record_t
       -> unit
    val selectPath :
      'a class_t
       -> tree_path_record_t
       -> unit
    val selectRange :
      'a class_t
       -> tree_path_record_t
       -> tree_path_record_t
       -> unit
    val setMode :
      'a class_t
       -> selection_mode_t
       -> unit
    val unselectAll : 'a class_t -> unit
    val unselectIter :
      'a class_t
       -> tree_iter_record_t
       -> unit
    val unselectPath :
      'a class_t
       -> tree_path_record_t
       -> unit
    val unselectRange :
      'a class_t
       -> tree_path_record_t
       -> tree_path_record_t
       -> unit
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val modeProp : ('a class_t, selection_mode_t, selection_mode_t) Property.readwrite
  end
