signature G_I_REPOSITORY_V_FUNC_INFO =
  sig
    type 'a class_t
    type 'a functioninfoclass_t
    type 'a signalinfoclass_t
    type vfuncinfoflags_t
    val getFlags : 'a class_t -> vfuncinfoflags_t
    val getSignal : 'a class_t -> base signalinfoclass_t option
    val getInvoker : 'a class_t -> base functioninfoclass_t option
  end
