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
    val buttonProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val exclusiveProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val touchOnlyProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
