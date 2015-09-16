signature GTK_RADIO_ACTION =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> string option
       -> string option
       -> string option
       -> LargeInt.int
       -> base class_t
    val getCurrentValue : 'a class_t -> LargeInt.int
    val joinGroup :
      'a class_t
       -> 'b class_t option
       -> unit
    val setCurrentValue :
      'a class_t
       -> LargeInt.int
       -> unit
    val changedSig : (base class_t -> unit) -> 'a class_t Signal.signal
    val currentValueProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val groupProp : ('a class_t, 'b class_t option) Property.writeonly
    val valueProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
