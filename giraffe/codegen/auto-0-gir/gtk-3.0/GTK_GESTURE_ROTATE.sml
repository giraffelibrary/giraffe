signature GTK_GESTURE_ROTATE =
  sig
    type 'a class
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a widget_class -> base class
    val getAngleDelta : 'a class -> real
    val angleChangedSig : (real * real -> unit) -> 'a class Signal.t
  end
