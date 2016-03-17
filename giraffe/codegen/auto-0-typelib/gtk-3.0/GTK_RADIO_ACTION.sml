signature GTK_RADIO_ACTION =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> string option
       -> string option
       -> string option
       -> LargeInt.int
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
    val changedSig : (base class -> unit) -> 'a class Signal.signal
    val currentValueProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val groupProp : ('a class, 'b class option) Property.writeonly
    val valueProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
