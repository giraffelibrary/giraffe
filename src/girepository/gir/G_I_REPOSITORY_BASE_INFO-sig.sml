signature G_I_REPOSITORY_BASE_INFO =
  sig
    type 'a class
    type typelibtype_t
    val getName : 'a class -> string option
    val getNamespace : 'a class -> string
    val isDeprecated : 'a class -> bool
    val getVersion : 'a class -> (string * string * string) option
    val getAttribute : 'a class -> string -> string option
    val getContainer : 'a class -> base class option
    val getTypelib : 'a class -> typelibtype_t
    val equal : 'a class -> 'b class -> bool
  end
