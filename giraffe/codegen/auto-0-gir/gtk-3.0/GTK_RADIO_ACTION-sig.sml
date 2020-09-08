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
    val currentValueProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val groupProp : ('a class, unit, 'b class option -> unit, 'b class option -> unit) Property.t
    val valueProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
