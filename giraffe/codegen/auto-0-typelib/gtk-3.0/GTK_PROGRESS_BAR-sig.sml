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
    val getText : 'a class -> string option
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
    val ellipsizeProp : ('a class, unit -> Pango.EllipsizeMode.t, Pango.EllipsizeMode.t -> unit, Pango.EllipsizeMode.t -> unit) Property.t
    val fractionProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val invertedProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val pulseStepProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val showTextProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val textProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
