signature GTK_CELL_RENDERER_SPINNER =
  sig
    type 'a class
    type icon_size_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val activeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val pulseProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val sizeProp : ('a class, unit -> icon_size_t, icon_size_t -> unit, icon_size_t -> unit) Property.t
  end
