signature G_I_REPOSITORY_CONSTANT_INFO =
  sig
    type 'a class
    type 'a typeinfo_class
    type argument_t
    val getType : 'a class -> base typeinfo_class
    val getValue : 'a class -> argument_t
  end
