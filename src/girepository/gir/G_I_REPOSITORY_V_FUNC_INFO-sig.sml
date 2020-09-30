signature G_I_REPOSITORY_V_FUNC_INFO =
  sig
    type 'a class
    type 'a functioninfo_class
    type 'a signalinfo_class
    type vfuncinfoflags_t
    val getFlags : 'a class -> vfuncinfoflags_t
    val getSignal : 'a class -> base signalinfo_class option
    val getInvoker : 'a class -> base functioninfo_class option
  end
