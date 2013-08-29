signature G_I_REPOSITORY_BASE_INFO =
  sig
    type 'a class_t
    type typelibtype_t
    val getName : 'a class_t -> string option
    val getNamespace : 'a class_t -> string
    val isDeprecated : 'a class_t -> bool
    val getAttribute : 'a class_t -> string -> string option
    val getContainer : 'a class_t -> base class_t
    val getTypelib : 'a class_t -> typelibtype_t
    val equal : 'a class_t -> 'b class_t -> bool
  end
