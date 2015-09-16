signature GTK_CELL_RENDERER_COMBO =
  sig
    type 'a class_t
    type tree_iter_record_t
    type 'a tree_model_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val changedSig :
      (string
        -> tree_iter_record_t
        -> unit)
       -> 'a class_t Signal.signal
    val hasEntryProp : ('a class_t, bool, bool) Property.readwrite
    val modelProp : ('a class_t, base tree_model_class_t option, 'b tree_model_class_t option) Property.readwrite
    val textColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
