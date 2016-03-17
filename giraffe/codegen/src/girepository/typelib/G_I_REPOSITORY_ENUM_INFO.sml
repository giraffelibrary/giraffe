signature G_I_REPOSITORY_ENUM_INFO =
  sig
    type 'a class
    type 'a valueinfo_class
    type 'a functioninfo_class
    type typetag_t
    val getNValues : 'a class -> LargeInt.int
    val getValue : 'a class -> LargeInt.int -> base valueinfo_class
    val getNMethods : 'a class -> LargeInt.int
    val getMethod : 'a class -> LargeInt.int -> base functioninfo_class
    val getStorageType : 'a class -> typetag_t
    val getErrorDomain : 'a class -> string option
  end
