signature GTK_TOGGLE_BUTTON =
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
    val newWithLabel : string -> base class
    val newWithMnemonic : string -> base class
    val getActive : 'a class -> bool
    val getInconsistent : 'a class -> bool
    val getMode : 'a class -> bool
    val setActive :
      'a class
       -> bool
       -> unit
    val setInconsistent :
      'a class
       -> bool
       -> unit
    val setMode :
      'a class
       -> bool
       -> unit
    val toggled : 'a class -> unit
    val toggledSig : (unit -> unit) -> 'a class Signal.t
    val activeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val drawIndicatorProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val inconsistentProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
