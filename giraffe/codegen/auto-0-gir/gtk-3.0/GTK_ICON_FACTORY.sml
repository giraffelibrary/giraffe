signature GTK_ICON_FACTORY =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type icon_set_record_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val lookupDefault : string -> icon_set_record_t
    val add :
      'a class_t
       -> string
       -> icon_set_record_t
       -> unit
    val addDefault : 'a class_t -> unit
    val lookup :
      'a class_t
       -> string
       -> icon_set_record_t
    val removeDefault : 'a class_t -> unit
  end
