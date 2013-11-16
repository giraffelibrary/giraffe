signature GTK_ICON_FACTORY =
  sig
    type 'a class_t
    type iconsetrecord_t
    type 'a buildableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val lookupDefault : string -> iconsetrecord_t
    val add :
      'a class_t
       -> string
       -> iconsetrecord_t
       -> unit
    val addDefault : 'a class_t -> unit
    val lookup :
      'a class_t
       -> string
       -> iconsetrecord_t
    val removeDefault : 'a class_t -> unit
  end
