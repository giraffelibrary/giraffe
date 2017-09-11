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
    val activatableProp : ('a class, bool, bool) Property.readwrite
    val activeProp : ('a class, bool, bool) Property.readwrite
    val inconsistentProp : ('a class, bool, bool) Property.readwrite
    val indicatorSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val radioProp : ('a class, bool, bool) Property.readwrite
  end
