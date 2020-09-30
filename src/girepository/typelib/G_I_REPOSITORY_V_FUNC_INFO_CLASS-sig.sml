signature G_I_REPOSITORY_V_FUNC_INFO_CLASS =
  sig
    type 'a vfuncinfo
    type 'a callableinfo_class
    include CLASS where type 'a class = 'a vfuncinfo callableinfo_class
  end
