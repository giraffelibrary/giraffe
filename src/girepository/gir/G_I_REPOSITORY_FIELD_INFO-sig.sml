signature G_I_REPOSITORY_FIELD_INFO =
  sig
    type 'a class
    type 'a typeinfo_class
    type fieldinfoflags_t
    val getFlags : 'a class -> fieldinfoflags_t
    val getBits : 'a class -> LargeInt.int option
    val getType : 'a class -> base typeinfo_class
  end
