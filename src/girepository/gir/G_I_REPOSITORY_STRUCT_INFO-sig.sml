signature G_I_REPOSITORY_STRUCT_INFO =
  sig
    type 'a class
    type 'a fieldinfo_class
    type 'a functioninfo_class
    val getNFields : 'a class -> LargeInt.int
    val getField : 'a class -> LargeInt.int -> base fieldinfo_class
    val getNMethods : 'a class -> LargeInt.int
    val getMethod : 'a class -> LargeInt.int -> base functioninfo_class
    val findMethod : 'a class -> string -> base functioninfo_class
    val isGtypeStruct : 'a class -> bool
    val isForeign : 'a class -> bool
  end
