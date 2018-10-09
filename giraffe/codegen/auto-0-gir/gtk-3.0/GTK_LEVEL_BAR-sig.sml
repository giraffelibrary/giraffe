signature GTK_LEVEL_BAR =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type level_bar_mode_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newForInterval : real * real -> base class
    val addOffsetValue :
      'a class
       -> string * real
       -> unit
    val getInverted : 'a class -> bool
    val getMaxValue : 'a class -> real
    val getMinValue : 'a class -> real
    val getMode : 'a class -> level_bar_mode_t
    val getOffsetValue :
      'a class
       -> string option
       -> real option
    val getValue : 'a class -> real
    val removeOffsetValue :
      'a class
       -> string option
       -> unit
    val setInverted :
      'a class
       -> bool
       -> unit
    val setMaxValue :
      'a class
       -> real
       -> unit
    val setMinValue :
      'a class
       -> real
       -> unit
    val setMode :
      'a class
       -> level_bar_mode_t
       -> unit
    val setValue :
      'a class
       -> real
       -> unit
    val offsetChangedSig : (string -> unit) -> 'a class Signal.t
    val invertedProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val maxValueProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val minValueProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val modeProp :
      {
        get : 'a class -> level_bar_mode_t,
        set :
          level_bar_mode_t
           -> 'a class
           -> unit,
        new : level_bar_mode_t -> 'a class Property.t
      }
    val valueProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
  end
