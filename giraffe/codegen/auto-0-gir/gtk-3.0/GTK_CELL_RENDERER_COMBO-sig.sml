signature GTK_CELL_RENDERER_COMBO =
  sig
    type 'a class
    type tree_iter_t
    type 'a tree_model_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val changedSig : (string * tree_iter_t -> unit) -> 'a class Signal.t
    val hasEntryProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val modelProp : ('a class, unit -> base tree_model_class option, 'b tree_model_class option -> unit, 'b tree_model_class option -> unit) Property.t
    val textColumnProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
