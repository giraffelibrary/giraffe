signature GTK_TREE_MODEL =
  sig
    type 'a class_t
    type treepathrecord_t
    type treeiterrecord_t
    type treemodelflags_t
    val getType : unit -> GObject.Type.t
    val filterNew :
      'a class_t
       -> treepathrecord_t option
       -> base class_t
    val getFlags : 'a class_t -> treemodelflags_t
    val getIter :
      'a class_t
       -> treepathrecord_t
       -> treeiterrecord_t option
    val getIterFirst : 'a class_t -> treeiterrecord_t option
    val getIterFromString :
      'a class_t
       -> string
       -> treeiterrecord_t option
    val getNColumns : 'a class_t -> LargeInt.int
    val getPath :
      'a class_t
       -> treeiterrecord_t
       -> treepathrecord_t
    val getStringFromIter :
      'a class_t
       -> treeiterrecord_t
       -> string
    val getValue :
      'a class_t
       -> treeiterrecord_t
       -> LargeInt.int
       -> GObject.ValueRecord.t
    val iterChildren :
      'a class_t
       -> treeiterrecord_t option
       -> treeiterrecord_t option
    val iterHasChild :
      'a class_t
       -> treeiterrecord_t
       -> bool
    val iterNChildren :
      'a class_t
       -> treeiterrecord_t option
       -> LargeInt.int
    val iterNext :
      'a class_t
       -> treeiterrecord_t
       -> bool
    val iterNthChild :
      'a class_t
       -> treeiterrecord_t option
       -> LargeInt.int
       -> treeiterrecord_t option
    val iterParent :
      'a class_t
       -> treeiterrecord_t
       -> treeiterrecord_t option
    val iterPrevious :
      'a class_t
       -> treeiterrecord_t
       -> bool
    val refNode :
      'a class_t
       -> treeiterrecord_t
       -> unit
    val rowChanged :
      'a class_t
       -> treepathrecord_t
       -> treeiterrecord_t
       -> unit
    val rowDeleted :
      'a class_t
       -> treepathrecord_t
       -> unit
    val rowHasChildToggled :
      'a class_t
       -> treepathrecord_t
       -> treeiterrecord_t
       -> unit
    val rowInserted :
      'a class_t
       -> treepathrecord_t
       -> treeiterrecord_t
       -> unit
    val sortNewWithModel : 'a class_t -> base class_t
    val unrefNode :
      'a class_t
       -> treeiterrecord_t
       -> unit
    val rowChangedSig :
      (treepathrecord_t
        -> treeiterrecord_t
        -> unit)
       -> 'a class_t Signal.signal
    val rowDeletedSig : (treepathrecord_t -> unit) -> 'a class_t Signal.signal
    val rowHasChildToggledSig :
      (treepathrecord_t
        -> treeiterrecord_t
        -> unit)
       -> 'a class_t Signal.signal
    val rowInsertedSig :
      (treepathrecord_t
        -> treeiterrecord_t
        -> unit)
       -> 'a class_t Signal.signal
  end
