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
    val buttonProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val exclusiveProp : ('a class, bool, bool) Property.readwrite
    val touchOnlyProp : ('a class, bool, bool) Property.readwrite
  end
