signature GTK_PROGRESS_BAR =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getEllipsize : 'a class -> Pango.EllipsizeMode.t
    val getFraction : 'a class -> real
    val getInverted : 'a class -> bool
    val getPulseStep : 'a class -> real
    val getShowText : 'a class -> bool
    val getText : 'a class -> string
    val pulse : 'a class -> unit
    val setEllipsize :
      'a class
       -> Pango.EllipsizeMode.t
       -> unit
    val setFraction :
      'a class
       -> real
       -> unit
    val setInverted :
      'a class
       -> bool
       -> unit
    val setPulseStep :
      'a class
       -> real
       -> unit
    val setShowText :
      'a class
       -> bool
       -> unit
    val setText :
      'a class
       -> string option
       -> unit
    val ellipsizeProp : ('a class, Pango.EllipsizeMode.t, Pango.EllipsizeMode.t) Property.readwrite
    val fractionProp : ('a class, real, real) Property.readwrite
    val invertedProp : ('a class, bool, bool) Property.readwrite
    val pulseStepProp : ('a class, real, real) Property.readwrite
    val showTextProp : ('a class, bool, bool) Property.readwrite
    val textProp : ('a class, string option, string option) Property.readwrite
  end
