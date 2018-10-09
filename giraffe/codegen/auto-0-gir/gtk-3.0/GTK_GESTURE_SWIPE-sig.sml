signature GTK_GESTURE_SWIPE =
  sig
    type 'a class
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a widget_class -> base class
    val getVelocity : 'a class -> (real * real) option
    val swipeSig : (real * real -> unit) -> 'a class Signal.t
  end
