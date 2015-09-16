signature GTK_TREE_MODEL_FILTER =
  sig
    type 'a class_t
    type 'a tree_drag_source_class_t
    type tree_iter_record_t
    type 'a tree_model_class_t
    type tree_path_record_t
    type t = base class_t
    val asTreeDragSource : 'a class_t -> base tree_drag_source_class_t
    val asTreeModel : 'a class_t -> base tree_model_class_t
    val getType : unit -> GObject.Type.t
    val clearCache : 'a class_t -> unit
    val convertChildIterToIter :
      'a class_t
       -> tree_iter_record_t
       -> tree_iter_record_t option
    val convertChildPathToPath :
      'a class_t
       -> tree_path_record_t
       -> tree_path_record_t
    val convertIterToChildIter :
      'a class_t
       -> tree_iter_record_t
       -> tree_iter_record_t
    val convertPathToChildPath :
      'a class_t
       -> tree_path_record_t
       -> tree_path_record_t
    val getModel : 'a class_t -> base tree_model_class_t
    val refilter : 'a class_t -> unit
    val setVisibleColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val childModelProp : ('a class_t, base tree_model_class_t option, 'b tree_model_class_t option) Property.readwrite
    val virtualRootProp : ('a class_t, tree_path_record_t option, tree_path_record_t option) Property.readwrite
  end
