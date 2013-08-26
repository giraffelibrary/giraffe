signature G_I_REPOSITORY_V_FUNC_INFO =
  sig
    type 'a class_t
    type 'a functioninfoclass_t
    type 'a signalinfoclass_t
    type vfuncinfoflags_t
    val getFlags : 'a class_t -> vfuncinfoflags_t
    val getOffset : 'a class_t -> LargeInt.int
    val getSignal : 'a class_t -> base signalinfoclass_t
    val getInvoker : 'a class_t -> base functioninfoclass_t
  end
