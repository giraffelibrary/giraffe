signature GTK_ORIENTABLE =
  sig
    type 'a class
    type orientation_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getOrientation : 'a class -> orientation_t
    val setOrientation :
      'a class
       -> orientation_t
       -> unit
    val orientationProp : ('a class, unit -> orientation_t, orientation_t -> unit, orientation_t -> unit) Property.t
  end
