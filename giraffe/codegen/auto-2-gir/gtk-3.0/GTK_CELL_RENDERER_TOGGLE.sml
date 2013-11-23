signature GTK_CELL_RENDERER_TOGGLE =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getActivatable : 'a class_t -> bool
    val getActive : 'a class_t -> bool
    val getRadio : 'a class_t -> bool
    val setActivatable :
      'a class_t
       -> bool
       -> unit
    val setActive :
      'a class_t
       -> bool
       -> unit
    val setRadio :
      'a class_t
       -> bool
       -> unit
    val toggledSig : (string -> unit) -> 'a class_t Signal.signal
    val activatableProp : ('a class_t, bool, bool) Property.readwrite
    val activeProp : ('a class_t, bool, bool) Property.readwrite
    val inconsistentProp : ('a class_t, bool, bool) Property.readwrite
    val indicatorSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val radioProp : ('a class_t, bool, bool) Property.readwrite
  end
