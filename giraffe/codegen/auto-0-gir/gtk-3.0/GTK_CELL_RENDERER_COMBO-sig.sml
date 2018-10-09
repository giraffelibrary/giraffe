signature GTK_CELL_RENDERER_COMBO =
  sig
    type 'a class
    type tree_iter_t
    type 'a tree_model_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val changedSig : (string * tree_iter_t -> unit) -> 'a class Signal.t
    val hasEntryProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val modelProp :
      {
        get : 'a class -> base tree_model_class option,
        set :
          'b tree_model_class option
           -> 'a class
           -> unit,
        new : 'b tree_model_class option -> 'a class Property.t
      }
    val textColumnProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end
