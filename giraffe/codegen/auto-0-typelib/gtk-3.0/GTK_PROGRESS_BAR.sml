signature GTK_PROGRESS_BAR =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getEllipsize : 'a class_t -> Pango.EllipsizeMode.t
    val getFraction : 'a class_t -> real
    val getInverted : 'a class_t -> bool
    val getPulseStep : 'a class_t -> real
    val getShowText : 'a class_t -> bool
    val getText : 'a class_t -> string
    val pulse : 'a class_t -> unit
    val setEllipsize :
      'a class_t
       -> Pango.EllipsizeMode.t
       -> unit
    val setFraction :
      'a class_t
       -> real
       -> unit
    val setInverted :
      'a class_t
       -> bool
       -> unit
    val setPulseStep :
      'a class_t
       -> real
       -> unit
    val setShowText :
      'a class_t
       -> bool
       -> unit
    val setText :
      'a class_t
       -> string option
       -> unit
    val ellipsizeProp : ('a class_t, Pango.EllipsizeMode.t, Pango.EllipsizeMode.t) Property.readwrite
    val fractionProp : ('a class_t, real, real) Property.readwrite
    val invertedProp : ('a class_t, bool, bool) Property.readwrite
    val pulseStepProp : ('a class_t, real, real) Property.readwrite
    val showTextProp : ('a class_t, bool, bool) Property.readwrite
    val textProp : ('a class_t, string option, string option) Property.readwrite
  end
