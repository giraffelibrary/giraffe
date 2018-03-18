signature GTK_RADIO_ACTION =
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
       * LargeInt.int
       -> base class
    val getCurrentValue : 'a class -> LargeInt.int
    val joinGroup :
      'a class
       -> 'b class option
       -> unit
    val setCurrentValue :
      'a class
       -> LargeInt.int
       -> unit
    val changedSig : (base class -> unit) -> 'a class Signal.t
    val currentValueProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val groupProp :
      {
        set :
          'b class option
           -> 'a class
           -> unit,
        new : 'b class option -> 'a class Property.t
      }
    val valueProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end
