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
       -> base widget_class
    val getHhomogeneous : 'a class -> bool
    val getHomogeneous : 'a class -> bool
    val getInterpolateSize : 'a class -> bool
    val getTransitionDuration : 'a class -> LargeInt.int
    val getTransitionRunning : 'a class -> bool
    val getTransitionType : 'a class -> stack_transition_type_t
    val getVhomogeneous : 'a class -> bool
    val getVisibleChild : 'a class -> base widget_class
    val getVisibleChildName : 'a class -> string
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
    val hhomogeneousProp : ('a class, bool, bool) Property.readwrite
    val homogeneousProp : ('a class, bool, bool) Property.readwrite
    val interpolateSizeProp : ('a class, bool, bool) Property.readwrite
    val transitionDurationProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val transitionRunningProp : ('a class, bool) Property.readonly
    val transitionTypeProp : ('a class, stack_transition_type_t, stack_transition_type_t) Property.readwrite
    val vhomogeneousProp : ('a class, bool, bool) Property.readwrite
    val visibleChildProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val visibleChildNameProp : ('a class, string option, string option) Property.readwrite
  end
