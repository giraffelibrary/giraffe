signature GTK_SWITCH =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getActive : 'a class -> bool
    val getState : 'a class -> bool
    val setActive :
      'a class
       -> bool
       -> unit
    val setState :
      'a class
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val stateSetSig : (bool -> bool) -> 'a class Signal.t
    val activeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val stateProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
