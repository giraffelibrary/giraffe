signature GTK_CELL_RENDERER_COMBO =
  sig
    type 'a class
    type tree_iter_t
    type 'a tree_model_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val changedSig :
      (string
        -> tree_iter_t
        -> unit)
       -> 'a class Signal.signal
    val hasEntryProp : ('a class, bool, bool) Property.readwrite
    val modelProp : ('a class, base tree_model_class option, 'b tree_model_class option) Property.readwrite
    val textColumnProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
