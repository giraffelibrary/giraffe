signature GTK_ADJUSTMENT =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new :
      real
       * real
       * real
       * real
       * real
       * real
       -> base class
    val changed : 'a class -> unit
    val clampPage :
      'a class
       -> real * real
       -> unit
    val configure :
      'a class
       -> real
           * real
           * real
           * real
           * real
           * real
       -> unit
    val getLower : 'a class -> real
    val getMinimumIncrement : 'a class -> real
    val getPageIncrement : 'a class -> real
    val getPageSize : 'a class -> real
    val getStepIncrement : 'a class -> real
    val getUpper : 'a class -> real
    val getValue : 'a class -> real
    val setLower :
      'a class
       -> real
       -> unit
    val setPageIncrement :
      'a class
       -> real
       -> unit
    val setPageSize :
      'a class
       -> real
       -> unit
    val setStepIncrement :
      'a class
       -> real
       -> unit
    val setUpper :
      'a class
       -> real
       -> unit
    val setValue :
      'a class
       -> real
       -> unit
    val valueChanged : 'a class -> unit
    val changedSig : (unit -> unit) -> 'a class Signal.t
    val valueChangedSig : (unit -> unit) -> 'a class Signal.t
    val lowerProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val pageIncrementProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val pageSizeProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val stepIncrementProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val upperProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
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
