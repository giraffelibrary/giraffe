signature G_I_REPOSITORY_CALLABLE_INFO =
  sig
    type 'a class_t
    type 'a arginfoclass_t
    type 'a typeinfoclass_t
    type transfer_t
    val getReturnType : 'a class_t -> base typeinfoclass_t
    val getCallerOwns : 'a class_t -> transfer_t
    val mayReturnNull : 'a class_t -> bool
    val getReturnAttribute : 'a class_t -> string -> string option
    val getNArgs : 'a class_t -> LargeInt.int
    val getArg : 'a class_t -> LargeInt.int -> base arginfoclass_t
  end
