signature GTK_CELL_RENDERER_TOGGLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getActivatable : 'a class -> bool
    val getActive : 'a class -> bool
    val getRadio : 'a class -> bool
    val setActivatable :
      'a class
       -> bool
       -> unit
    val setActive :
      'a class
       -> bool
       -> unit
    val setRadio :
      'a class
       -> bool
       -> unit
    val toggledSig : (string -> unit) -> 'a class Signal.t
    val activatableProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val activeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val inconsistentProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val indicatorSizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val radioProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
