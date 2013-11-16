signature GTK_TREE_MODEL_FILTER =
  sig
    type 'a class_t
    type treepathrecord_t
    type 'a treemodelclass_t
    type treeiterrecord_t
    type 'a treedragsourceclass_t
    val asTreeDragSource : 'a class_t -> base treedragsourceclass_t
    val asTreeModel : 'a class_t -> base treemodelclass_t
    val getType : unit -> GObject.Type.t
    val clearCache : 'a class_t -> unit
    val convertChildIterToIter :
      'a class_t
       -> treeiterrecord_t
       -> treeiterrecord_t option
    val convertChildPathToPath :
      'a class_t
       -> treepathrecord_t
       -> treepathrecord_t
    val convertIterToChildIter :
      'a class_t
       -> treeiterrecord_t
       -> treeiterrecord_t
    val convertPathToChildPath :
      'a class_t
       -> treepathrecord_t
       -> treepathrecord_t
    val getModel : 'a class_t -> base treemodelclass_t
    val refilter : 'a class_t -> unit
    val setVisibleColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val childModelProp : ('a class_t, base treemodelclass_t option, 'b treemodelclass_t option) Property.readwrite
    val virtualRootProp : ('a class_t, treepathrecord_t option, treepathrecord_t option) Property.readwrite
  end
