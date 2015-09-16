signature GTK_TOGGLE_BUTTON =
  sig
    type 'a class_t
    type 'a activatable_class_t
    type 'a buildable_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatable_class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithLabel : string -> base class_t
    val newWithMnemonic : string -> base class_t
    val getActive : 'a class_t -> bool
    val getInconsistent : 'a class_t -> bool
    val getMode : 'a class_t -> bool
    val setActive :
      'a class_t
       -> bool
       -> unit
    val setInconsistent :
      'a class_t
       -> bool
       -> unit
    val setMode :
      'a class_t
       -> bool
       -> unit
    val toggled : 'a class_t -> unit
    val toggledSig : (unit -> unit) -> 'a class_t Signal.signal
    val activeProp : ('a class_t, bool, bool) Property.readwrite
    val drawIndicatorProp : ('a class_t, bool, bool) Property.readwrite
    val inconsistentProp : ('a class_t, bool, bool) Property.readwrite
  end
