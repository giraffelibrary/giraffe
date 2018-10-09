signature GTK_STACK =
  sig
    type 'a class
    type 'a buildable_class
    type stack_transition_type_t
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addNamed :
      'a class
       -> 'b widget_class * string
       -> unit
    val addTitled :
      'a class
       -> 'b widget_class
           * string
           * string
       -> unit
    val getChildByName :
      'a class
       -> string
       -> base widget_class option
    val getHhomogeneous : 'a class -> bool
    val getHomogeneous : 'a class -> bool
    val getInterpolateSize : 'a class -> bool
    val getTransitionDuration : 'a class -> LargeInt.int
    val getTransitionRunning : 'a class -> bool
    val getTransitionType : 'a class -> stack_transition_type_t
    val getVhomogeneous : 'a class -> bool
    val getVisibleChild : 'a class -> base widget_class option
    val getVisibleChildName : 'a class -> string option
    val setHhomogeneous :
      'a class
       -> bool
       -> unit
    val setHomogeneous :
      'a class
       -> bool
       -> unit
    val setInterpolateSize :
      'a class
       -> bool
       -> unit
    val setTransitionDuration :
      'a class
       -> LargeInt.int
       -> unit
    val setTransitionType :
      'a class
       -> stack_transition_type_t
       -> unit
    val setVhomogeneous :
      'a class
       -> bool
       -> unit
    val setVisibleChild :
      'a class
       -> 'b widget_class
       -> unit
    val setVisibleChildFull :
      'a class
       -> string * stack_transition_type_t
       -> unit
    val setVisibleChildName :
      'a class
       -> string
       -> unit
    val hhomogeneousProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val homogeneousProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val interpolateSizeProp :
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
    val transitionRunningProp : {get : 'a class -> bool}
    val transitionTypeProp :
      {
        get : 'a class -> stack_transition_type_t,
        set :
          stack_transition_type_t
           -> 'a class
           -> unit,
        new : stack_transition_type_t -> 'a class Property.t
      }
    val vhomogeneousProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val visibleChildProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
    val visibleChildNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
