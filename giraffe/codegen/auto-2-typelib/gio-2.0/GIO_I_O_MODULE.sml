signature GIO_I_O_MODULE =
  sig
    type 'a class_t
    val asTypePlugin : 'a class_t -> base GObject.TypePluginClass.t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val load : 'a class_t -> unit
    val unload : 'a class_t -> unit
  end
