signature GTK_GESTURE_PAN =
  sig
    type 'a class
    type 'a widget_class
    type pan_direction_t
    type orientation_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a widget_class * orientation_t -> base class
    val getOrientation : 'a class -> orientation_t
    val setOrientation :
      'a class
       -> orientation_t
       -> unit
    val panSig : (pan_direction_t * real -> unit) -> 'a class Signal.t
    val orientationProp :
      {
        get : 'a class -> orientation_t,
        set :
          orientation_t
           -> 'a class
           -> unit,
        new : orientation_t -> 'a class Property.t
      }
  end
