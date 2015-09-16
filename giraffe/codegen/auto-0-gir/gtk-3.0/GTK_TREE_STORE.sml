signature GTK_TREE_STORE =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a tree_drag_dest_class_t
    type 'a tree_drag_source_class_t
    type 'a tree_model_class_t
    type 'a tree_sortable_class_t
    type tree_iter_record_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asTreeDragDest : 'a class_t -> base tree_drag_dest_class_t
    val asTreeDragSource : 'a class_t -> base tree_drag_source_class_t
    val asTreeModel : 'a class_t -> base tree_model_class_t
    val asTreeSortable : 'a class_t -> base tree_sortable_class_t
    val getType : unit -> GObject.Type.t
    val append :
      'a class_t
       -> tree_iter_record_t option
       -> tree_iter_record_t
    val clear : 'a class_t -> unit
    val insert :
      'a class_t
       -> tree_iter_record_t option
       -> LargeInt.int
       -> tree_iter_record_t
    val insertAfter :
      'a class_t
       -> tree_iter_record_t option
       -> tree_iter_record_t option
       -> tree_iter_record_t
    val insertBefore :
      'a class_t
       -> tree_iter_record_t option
       -> tree_iter_record_t option
       -> tree_iter_record_t
    val isAncestor :
      'a class_t
       -> tree_iter_record_t
       -> tree_iter_record_t
       -> bool
    val iterDepth :
      'a class_t
       -> tree_iter_record_t
       -> LargeInt.int
    val iterIsValid :
      'a class_t
       -> tree_iter_record_t
       -> bool
    val moveAfter :
      'a class_t
       -> tree_iter_record_t
       -> tree_iter_record_t option
       -> unit
    val moveBefore :
      'a class_t
       -> tree_iter_record_t
       -> tree_iter_record_t option
       -> unit
    val prepend :
      'a class_t
       -> tree_iter_record_t option
       -> tree_iter_record_t
    val remove :
      'a class_t
       -> tree_iter_record_t
       -> bool
    val setValue :
      'a class_t
       -> tree_iter_record_t
       -> LargeInt.int
       -> GObject.ValueRecord.t
       -> unit
    val swap :
      'a class_t
       -> tree_iter_record_t
       -> tree_iter_record_t
       -> unit
  end
