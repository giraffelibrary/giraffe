signature GTK_LINK_BUTTON =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a activatableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val newWithLabel :
      string
       -> string option
       -> base class_t
    val getUri : 'a class_t -> string
    val getVisited : 'a class_t -> bool
    val setUri :
      'a class_t
       -> string
       -> unit
    val setVisited :
      'a class_t
       -> bool
       -> unit
    val activateLinkSig : (unit -> bool) -> 'a class_t Signal.signal
    val uriProp : ('a class_t, string option, string option) Property.readwrite
    val visitedProp : ('a class_t, bool, bool) Property.readwrite
  end
