signature GIO_SIMPLE_ACTION_GROUP =
  sig
    type 'a class_t
    type 'a actionclass_t
    type actionentryrecord_t
    type 'a actiongroupclass_t
    val asActionGroup : 'a class_t -> base actiongroupclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addEntries :
      'a class_t
       -> actionentryrecord_t
       -> LargeInt.int
       -> unit
    val insert :
      'a class_t
       -> 'b actionclass_t
       -> unit
    val lookup :
      'a class_t
       -> string
       -> base actionclass_t
    val remove :
      'a class_t
       -> string
       -> unit
  end
