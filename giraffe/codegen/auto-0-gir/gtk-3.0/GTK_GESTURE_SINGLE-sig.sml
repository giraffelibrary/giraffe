signature GTK_GESTURE_SINGLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getButton : 'a class -> LargeInt.int
    val getCurrentButton : 'a class -> LargeInt.int
    val getCurrentSequence : 'a class -> Gdk.EventSequenceRecord.t option
    val getExclusive : 'a class -> bool
    val getTouchOnly : 'a class -> bool
    val setButton :
      'a class
       -> LargeInt.int
       -> unit
    val setExclusive :
      'a class
       -> bool
       -> unit
    val setTouchOnly :
      'a class
       -> bool
       -> unit
    val buttonProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val exclusiveProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val touchOnlyProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
