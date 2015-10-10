signature G_I_REPOSITORY_STRUCT_INFO =
  sig
    type 'a class_t
    type 'a fieldinfoclass_t
    type 'a functioninfoclass_t
    val getNFields : 'a class_t -> LargeInt.int
    val getField : 'a class_t -> LargeInt.int -> base fieldinfoclass_t
    val getNMethods : 'a class_t -> LargeInt.int
    val getMethod : 'a class_t -> LargeInt.int -> base functioninfoclass_t
    val findMethod : 'a class_t -> string -> base functioninfoclass_t
    val isGtypeStruct : 'a class_t -> bool
    val isForeign : 'a class_t -> bool
  end
