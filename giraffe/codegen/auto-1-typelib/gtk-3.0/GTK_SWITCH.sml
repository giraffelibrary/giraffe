signature GTK_SWITCH =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a activatableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getActive : 'a class_t -> bool
    val setActive :
      'a class_t
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class_t Signal.signal
    val activeProp : ('a class_t, bool, bool) Property.readwrite
  end
