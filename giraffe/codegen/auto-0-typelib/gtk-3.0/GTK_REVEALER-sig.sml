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
    val childRevealedProp : {get : 'a class -> bool}
    val revealChildProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val transitionDurationProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val transitionTypeProp :
      {
        get : 'a class -> revealer_transition_type_t,
        set :
          revealer_transition_type_t
           -> 'a class
           -> unit,
        new : revealer_transition_type_t -> 'a class Property.t
      }
  end
