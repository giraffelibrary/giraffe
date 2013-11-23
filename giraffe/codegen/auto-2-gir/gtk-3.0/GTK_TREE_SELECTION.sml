signature GTK_TREE_SELECTION =
  sig
    type 'a class_t
    type selectionmode_t
    type treepathrecord_t
    type treeiterrecord_t
    type 'a treeviewclass_t
    type 'a treemodelclass_t
    val getType : unit -> GObject.Type.t
    val countSelectedRows : 'a class_t -> LargeInt.int
    val getMode : 'a class_t -> selectionmode_t
    val getSelected : 'a class_t -> (base treemodelclass_t * treeiterrecord_t) option
    val getTreeView : 'a class_t -> base treeviewclass_t
    val iterIsSelected :
      'a class_t
       -> treeiterrecord_t
       -> bool
    val pathIsSelected :
      'a class_t
       -> treepathrecord_t
       -> bool
    val selectAll : 'a class_t -> unit
    val selectIter :
      'a class_t
       -> treeiterrecord_t
       -> unit
    val selectPath :
      'a class_t
       -> treepathrecord_t
       -> unit
    val selectRange :
      'a class_t
       -> treepathrecord_t
       -> treepathrecord_t
       -> unit
    val setMode :
      'a class_t
       -> selectionmode_t
       -> unit
    val unselectAll : 'a class_t -> unit
    val unselectIter :
      'a class_t
       -> treeiterrecord_t
       -> unit
    val unselectPath :
      'a class_t
       -> treepathrecord_t
       -> unit
    val unselectRange :
      'a class_t
       -> treepathrecord_t
       -> treepathrecord_t
       -> unit
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val modeProp : ('a class_t, selectionmode_t, selectionmode_t) Property.readwrite
  end
