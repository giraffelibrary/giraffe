signature GTK_ICON_FACTORY =
  sig
    type 'a class
    type 'a buildable_class
    type icon_set_t
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val lookupDefault : string -> icon_set_t
    val add :
      'a class
       -> string
       -> icon_set_t
       -> unit
    val addDefault : 'a class -> unit
    val lookup :
      'a class
       -> string
       -> icon_set_t
    val removeDefault : 'a class -> unit
  end
