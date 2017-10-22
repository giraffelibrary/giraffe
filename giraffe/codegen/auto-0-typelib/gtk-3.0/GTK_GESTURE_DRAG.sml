signature GTK_GESTURE_DRAG =
  sig
    type 'a class
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a widget_class -> base class
    val getOffset : 'a class -> (real * real) option
    val getStartPoint : 'a class -> (real * real) option
    val dragBeginSig : (real * real -> unit) -> 'a class Signal.t
    val dragEndSig : (real * real -> unit) -> 'a class Signal.t
    val dragUpdateSig : (real * real -> unit) -> 'a class Signal.t
  end
