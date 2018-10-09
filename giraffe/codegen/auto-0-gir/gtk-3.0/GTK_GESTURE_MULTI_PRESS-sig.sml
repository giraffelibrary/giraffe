signature GTK_GESTURE_MULTI_PRESS =
  sig
    type 'a class
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a widget_class -> base class
    val getArea : 'a class -> Gdk.RectangleRecord.t option
    val setArea :
      'a class
       -> Gdk.RectangleRecord.t option
       -> unit
    val pressedSig :
      (LargeInt.int
        * real
        * real
        -> unit)
       -> 'a class Signal.t
    val releasedSig :
      (LargeInt.int
        * real
        * real
        -> unit)
       -> 'a class Signal.t
    val stoppedSig : (unit -> unit) -> 'a class Signal.t
  end
