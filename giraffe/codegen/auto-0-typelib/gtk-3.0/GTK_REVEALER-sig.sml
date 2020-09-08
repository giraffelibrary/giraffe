signature GTK_REVEALER =
  sig
    type 'a class
    type 'a buildable_class
    type revealer_transition_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getChildRevealed : 'a class -> bool
    val getRevealChild : 'a class -> bool
    val getTransitionDuration : 'a class -> LargeInt.int
    val getTransitionType : 'a class -> revealer_transition_type_t
    val setRevealChild :
      'a class
       -> bool
       -> unit
    val setTransitionDuration :
      'a class
       -> LargeInt.int
       -> unit
    val setTransitionType :
      'a class
       -> revealer_transition_type_t
       -> unit
    val childRevealedProp : ('a class, unit -> bool, unit, unit) Property.t
    val revealChildProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val transitionDurationProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val transitionTypeProp : ('a class, unit -> revealer_transition_type_t, revealer_transition_type_t -> unit, revealer_transition_type_t -> unit) Property.t
  end
