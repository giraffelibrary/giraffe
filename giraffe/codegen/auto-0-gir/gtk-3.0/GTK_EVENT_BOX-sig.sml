signature GTK_EVENT_BOX =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getAboveChild : 'a class -> bool
    val getVisibleWindow : 'a class -> bool
    val setAboveChild :
      'a class
       -> bool
       -> unit
    val setVisibleWindow :
      'a class
       -> bool
       -> unit
    val aboveChildProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val visibleWindowProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
