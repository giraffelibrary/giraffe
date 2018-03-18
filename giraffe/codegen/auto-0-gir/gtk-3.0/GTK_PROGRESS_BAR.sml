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
    val ellipsizeProp :
      {
        get : 'a class -> Pango.EllipsizeMode.t,
        set :
          Pango.EllipsizeMode.t
           -> 'a class
           -> unit,
        new : Pango.EllipsizeMode.t -> 'a class Property.t
      }
    val fractionProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val invertedProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val pulseStepProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val showTextProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val textProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
