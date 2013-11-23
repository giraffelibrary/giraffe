signature G_I_REPOSITORY_ARG_INFO =
  sig
    type 'a class_t
    type 'a typeinfoclass_t
    type direction_t
    type scopetype_t
    type transfer_t
    val getDirection : 'a class_t -> direction_t
    val isCallerAllocates : 'a class_t -> bool
    val isReturnValue : 'a class_t -> bool
    val isOptional : 'a class_t -> bool
    val mayBeNull : 'a class_t -> bool
    val getOwnershipTransfer : 'a class_t -> transfer_t
    val getScope : 'a class_t -> scopetype_t
    val getClosure : 'a class_t -> LargeInt.int option
    val getDestroy : 'a class_t -> LargeInt.int option
    val getType : 'a class_t -> base typeinfoclass_t
  end
