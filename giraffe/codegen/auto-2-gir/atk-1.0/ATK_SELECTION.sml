signature ATK_SELECTION =
  sig
    type 'a class_t
    type 'a objectclass_t
    val getType : unit -> GObject.Type.t
    val addSelection :
      'a class_t
       -> LargeInt.int
       -> bool
    val clearSelection : 'a class_t -> bool
    val getSelectionCount : 'a class_t -> LargeInt.int
    val isChildSelected :
      'a class_t
       -> LargeInt.int
       -> bool
    val refSelection :
      'a class_t
       -> LargeInt.int
       -> base objectclass_t
    val removeSelection :
      'a class_t
       -> LargeInt.int
       -> bool
    val selectAllSelection : 'a class_t -> bool
    val selectionChangedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
