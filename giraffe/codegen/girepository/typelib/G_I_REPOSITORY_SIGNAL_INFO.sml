signature G_I_REPOSITORY_SIGNAL_INFO =
  sig
    type 'a class_t
    type 'a vfuncinfoclass_t
    val getFlags : 'a class_t -> GObject.SignalFlags.flags
    val getClassClosure : 'a class_t -> base vfuncinfoclass_t option
    val trueStopsEmit : 'a class_t -> bool
  end
