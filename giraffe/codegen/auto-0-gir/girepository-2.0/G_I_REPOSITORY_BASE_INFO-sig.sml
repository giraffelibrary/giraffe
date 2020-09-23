signature G_I_REPOSITORY_BASE_INFO =
  sig
    type t
    type info_type_t
    val getType : unit -> GObject.Type.t
    val equal :
      t
       -> t
       -> bool
    val getAttribute :
      t
       -> string
       -> string
    val getContainer : t -> t
    val getName : t -> string
    val getNamespace : t -> string
    val getType : t -> info_type_t
    val isDeprecated : t -> bool
  end
