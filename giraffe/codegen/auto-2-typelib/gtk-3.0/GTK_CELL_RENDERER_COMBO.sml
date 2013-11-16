signature GTK_CELL_RENDERER_COMBO =
  sig
    type 'a class_t
    type 'a treemodelclass_t
    type treeiterrecord_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val changedSig :
      (string
        -> treeiterrecord_t
        -> unit)
       -> 'a class_t Signal.signal
    val hasEntryProp : ('a class_t, bool, bool) Property.readwrite
    val modelProp : ('a class_t, base treemodelclass_t option, 'b treemodelclass_t option) Property.readwrite
    val textColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
