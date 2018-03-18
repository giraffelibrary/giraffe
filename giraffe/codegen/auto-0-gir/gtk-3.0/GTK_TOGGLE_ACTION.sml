signature GTK_TOGGLE_ACTION =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       * string option
       * string option
       * string option
       -> base class
    val getActive : 'a class -> bool
    val getDrawAsRadio : 'a class -> bool
    val setActive :
      'a class
       -> bool
       -> unit
    val setDrawAsRadio :
      'a class
       -> bool
       -> unit
    val toggled : 'a class -> unit
    val toggledSig : (unit -> unit) -> 'a class Signal.t
    val activeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val drawAsRadioProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
