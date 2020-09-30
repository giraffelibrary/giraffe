signature G_I_REPOSITORY_FIELD_INFO =
  sig
    type 'a class
    type 'a typeinfo_class
    type fieldinfoflags_t
    val getFlags : 'a class -> fieldinfoflags_t
    val getSize : 'a class -> LargeInt.int
    val getOffset : 'a class -> LargeInt.int
    val getType : 'a class -> base typeinfo_class
  end
