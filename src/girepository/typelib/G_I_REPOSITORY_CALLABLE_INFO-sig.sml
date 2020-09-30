signature G_I_REPOSITORY_CALLABLE_INFO =
  sig
    type 'a class
    type 'a arginfo_class
    type 'a typeinfo_class
    type transfer_t
    val getReturnType : 'a class -> base typeinfo_class
    val getCallerOwns : 'a class -> transfer_t
    val mayReturnNull : 'a class -> bool
    val getReturnAttribute : 'a class -> string -> string option
    val getNArgs : 'a class -> LargeInt.int
    val getArg : 'a class -> LargeInt.int -> base arginfo_class
  end
