signature GTK_CELL_RENDERER_TOGGLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getActivatable : 'a class -> bool
    val getActive : 'a class -> bool
    val getRadio : 'a class -> bool
    val setActivatable :
      'a class
       -> bool
       -> unit
    val setActive :
      'a class
       -> bool
       -> unit
    val setRadio :
      'a class
       -> bool
       -> unit
    val toggledSig : (string -> unit) -> 'a class Signal.t
    val activatableProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val activeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val inconsistentProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val indicatorSizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val radioProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
