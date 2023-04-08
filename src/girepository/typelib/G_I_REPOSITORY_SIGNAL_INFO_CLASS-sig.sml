signature G_I_REPOSITORY_SIGNAL_INFO_CLASS =
  sig
    type 'a signalinfo
    type 'a callableinfo_class
    type 'a class = 'a signalinfo callableinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
