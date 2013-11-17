signature GTK_TREE_STORE =
  sig
    type 'a class_t
    type treeiterrecord_t
    type 'a treesortableclass_t
    type 'a treemodelclass_t
    type 'a treedragsourceclass_t
    type 'a treedragdestclass_t
    type 'a buildableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asTreeDragDest : 'a class_t -> base treedragdestclass_t
    val asTreeDragSource : 'a class_t -> base treedragsourceclass_t
    val asTreeModel : 'a class_t -> base treemodelclass_t
    val asTreeSortable : 'a class_t -> base treesortableclass_t
    val getType : unit -> GObject.Type.t
    val append :
      'a class_t
       -> treeiterrecord_t option
       -> treeiterrecord_t
    val clear : 'a class_t -> unit
    val insert :
      'a class_t
       -> treeiterrecord_t option
       -> LargeInt.int
       -> treeiterrecord_t
    val insertAfter :
      'a class_t
       -> treeiterrecord_t option
       -> treeiterrecord_t option
       -> treeiterrecord_t
    val insertBefore :
      'a class_t
       -> treeiterrecord_t option
       -> treeiterrecord_t option
       -> treeiterrecord_t
    val isAncestor :
      'a class_t
       -> treeiterrecord_t
       -> treeiterrecord_t
       -> bool
    val iterDepth :
      'a class_t
       -> treeiterrecord_t
       -> LargeInt.int
    val iterIsValid :
      'a class_t
       -> treeiterrecord_t
       -> bool
    val moveAfter :
      'a class_t
       -> treeiterrecord_t
       -> treeiterrecord_t option
       -> unit
    val moveBefore :
      'a class_t
       -> treeiterrecord_t
       -> treeiterrecord_t option
       -> unit
    val prepend :
      'a class_t
       -> treeiterrecord_t option
       -> treeiterrecord_t
    val remove :
      'a class_t
       -> treeiterrecord_t
       -> bool
    val setValue :
      'a class_t
       -> treeiterrecord_t
       -> LargeInt.int
       -> GObject.ValueRecord.t
       -> unit
    val swap :
      'a class_t
       -> treeiterrecord_t
       -> treeiterrecord_t
       -> unit
  end
