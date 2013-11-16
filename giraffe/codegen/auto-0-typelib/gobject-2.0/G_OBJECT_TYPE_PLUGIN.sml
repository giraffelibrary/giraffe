signature G_OBJECT_TYPE_PLUGIN =
  sig
    type 'a class_t
    type type_t
    val getType : unit -> type_t
    val unuse : 'a class_t -> unit
    val use : 'a class_t -> unit
  end
