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
