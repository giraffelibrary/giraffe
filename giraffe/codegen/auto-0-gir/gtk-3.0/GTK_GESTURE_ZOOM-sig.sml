signature GTK_GESTURE_ZOOM =
  sig
    type 'a class
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a widget_class -> base class
    val getScaleDelta : 'a class -> real
    val scaleChangedSig : (real -> unit) -> 'a class Signal.t
  end
