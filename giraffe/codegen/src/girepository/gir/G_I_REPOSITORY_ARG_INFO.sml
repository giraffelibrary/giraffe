signature G_I_REPOSITORY_ARG_INFO =
  sig
    type 'a class
    type 'a typeinfo_class
    type direction_t
    type scopetype_t
    type transfer_t
    val getDirection : 'a class -> direction_t
    val isCallerAllocates : 'a class -> bool
    val isReturnValue : 'a class -> bool
    val isOptional : 'a class -> bool
    val mayBeNull : 'a class -> bool
    val getOwnershipTransfer : 'a class -> transfer_t
    val getScope : 'a class -> scopetype_t
    val getClosure : 'a class -> LargeInt.int option
    val getDestroy : 'a class -> LargeInt.int option
    val getType : 'a class -> base typeinfo_class
  end
