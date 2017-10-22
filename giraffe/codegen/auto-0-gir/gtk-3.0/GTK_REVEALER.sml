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
    val childRevealedProp : ('a class, bool) Property.readonly
    val revealChildProp : ('a class, bool, bool) Property.readwrite
    val transitionDurationProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val transitionTypeProp : ('a class, revealer_transition_type_t, revealer_transition_type_t) Property.readwrite
  end
