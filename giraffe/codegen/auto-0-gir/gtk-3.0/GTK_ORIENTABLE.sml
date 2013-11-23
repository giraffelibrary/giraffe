signature GTK_ORIENTABLE =
  sig
    type 'a class_t
    type orientation_t
    val getType : unit -> GObject.Type.t
    val getOrientation : 'a class_t -> orientation_t
    val setOrientation :
      'a class_t
       -> orientation_t
       -> unit
    val orientationProp : ('a class_t, orientation_t, orientation_t) Property.readwrite
  end
