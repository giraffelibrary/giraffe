signature G_I_REPOSITORY_SIGNAL_INFO_CLASS =
  sig
    type 'a signalinfo
    type 'a callableinfo_class
    include CLASS where type 'a class = 'a signalinfo callableinfo_class
  end
