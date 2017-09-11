signature GTK_LINK_BUTTON =
  sig
    type 'a class
    type 'a activatable_class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
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
    val uriProp : ('a class, string option, string option) Property.readwrite
    val visitedProp : ('a class, bool, bool) Property.readwrite
  end
