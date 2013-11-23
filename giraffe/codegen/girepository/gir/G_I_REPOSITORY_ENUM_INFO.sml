signature G_I_REPOSITORY_ENUM_INFO =
  sig
    type 'a class_t
    type 'a valueinfoclass_t
    type 'a functioninfoclass_t
    type typetag_t
    val getNValues : 'a class_t -> LargeInt.int
    val getValue : 'a class_t -> LargeInt.int -> base valueinfoclass_t
    val getNMethods : 'a class_t -> LargeInt.int
    val getMethod : 'a class_t -> LargeInt.int -> base functioninfoclass_t
    val getStorageType : 'a class_t -> typetag_t
    val getErrorDomain : 'a class_t -> string option
  end
