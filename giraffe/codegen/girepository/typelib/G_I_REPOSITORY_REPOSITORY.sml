signature G_I_REPOSITORY_REPOSITORY =
  sig
    type 'a class_t
    type 'a baseinfoclass_t
    type loadflags_t
    type typelibtype_t
    val getDefault : unit -> base class_t
    val loadTypelib : 'a class_t -> typelibtype_t -> loadflags_t -> string
    val require : 'a class_t -> string -> string -> loadflags_t -> typelibtype_t
    val getDependencies : 'a class_t -> string -> string list option
    val getNInfos : 'a class_t -> string -> LargeInt.int
    val getInfo : 'a class_t -> string -> LargeInt.int -> base baseinfoclass_t
    val getSharedLibrary : 'a class_t -> string -> string option
    val getCPrefix : 'a class_t -> string -> string option
  end
