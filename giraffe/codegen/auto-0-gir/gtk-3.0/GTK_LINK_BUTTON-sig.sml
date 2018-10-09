signature GTK_LINK_BUTTON =
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
    val new : string -> base class
    val newWithLabel : string * string option -> base class
    val getUri : 'a class -> string
    val getVisited : 'a class -> bool
    val setUri :
      'a class
       -> string
       -> unit
    val setVisited :
      'a class
       -> bool
       -> unit
    val activateLinkSig : (unit -> bool) -> 'a class Signal.t
    val uriProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val visitedProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
