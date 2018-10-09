signature ATK_SELECTION =
  sig
    type 'a class
    type 'a object_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val addSelection :
      'a class
       -> LargeInt.int
       -> bool
    val clearSelection : 'a class -> bool
    val getSelectionCount : 'a class -> LargeInt.int
    val isChildSelected :
      'a class
       -> LargeInt.int
       -> bool
    val refSelection :
      'a class
       -> LargeInt.int
       -> base object_class option
    val removeSelection :
      'a class
       -> LargeInt.int
       -> bool
    val selectAllSelection : 'a class -> bool
    val selectionChangedSig : (unit -> unit) -> 'a class Signal.t
  end
