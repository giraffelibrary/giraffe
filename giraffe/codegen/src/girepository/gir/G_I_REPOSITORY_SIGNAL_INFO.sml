signature G_I_REPOSITORY_SIGNAL_INFO =
  sig
    type 'a class
    type 'a vfuncinfo_class
    val getFlags : 'a class -> GObjectSignalFlags.flags
    val getClassClosure : 'a class -> base vfuncinfo_class option
    val trueStopsEmit : 'a class -> bool
  end
