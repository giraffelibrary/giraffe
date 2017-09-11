signature GTK_SWITCH =
  sig
    type 'a class
    type 'a activatable_class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getActive : 'a class -> bool
    val setActive :
      'a class
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val activeProp : ('a class, bool, bool) Property.readwrite
  end
