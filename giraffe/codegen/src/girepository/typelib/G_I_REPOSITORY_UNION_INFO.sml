signature G_I_REPOSITORY_UNION_INFO =
  sig
    type 'a class
    type 'a fieldinfo_class
    type 'a functioninfo_class
    type 'a typeinfo_class
    type 'a constantinfo_class
    val getNFields : 'a class -> LargeInt.int
    val getField : 'a class -> LargeInt.int -> base fieldinfo_class
    val getNMethods : 'a class -> LargeInt.int
    val getMethod : 'a class -> LargeInt.int -> base functioninfo_class
    val isDiscriminated : 'a class -> bool
    val getDiscriminatorOffset : 'a class -> LargeInt.int
    val getDiscriminatorType : 'a class -> base typeinfo_class
    val getDiscriminator : 'a class -> LargeInt.int -> base constantinfo_class
    val findMethod : 'a class -> string -> base functioninfo_class
    val getSize : 'a class -> LargeInt.int
    val getAlignment : 'a class -> LargeInt.int
  end
