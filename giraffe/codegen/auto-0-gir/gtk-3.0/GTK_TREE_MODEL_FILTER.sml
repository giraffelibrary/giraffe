signature GTK_TREE_MODEL_FILTER =
  sig
    type 'a class
    type 'a tree_drag_source_class
    type tree_iter_t
    type 'a tree_model_class
    type tree_path_t
    type t = base class
    val asTreeDragSource : 'a class -> base tree_drag_source_class
    val asTreeModel : 'a class -> base tree_model_class
    val getType : unit -> GObject.Type.t
    val clearCache : 'a class -> unit
    val convertChildIterToIter :
      'a class
       -> tree_iter_t
       -> tree_iter_t option
    val convertChildPathToPath :
      'a class
       -> tree_path_t
       -> tree_path_t option
    val convertIterToChildIter :
      'a class
       -> tree_iter_t
       -> tree_iter_t
    val convertPathToChildPath :
      'a class
       -> tree_path_t
       -> tree_path_t option
    val getModel : 'a class -> base tree_model_class
    val refilter : 'a class -> unit
    val setVisibleColumn :
      'a class
       -> LargeInt.int
       -> unit
    val childModelProp : ('a class, base tree_model_class option, 'b tree_model_class option) Property.readwrite
    val virtualRootProp : ('a class, tree_path_t option, tree_path_t option) Property.readwrite
  end
