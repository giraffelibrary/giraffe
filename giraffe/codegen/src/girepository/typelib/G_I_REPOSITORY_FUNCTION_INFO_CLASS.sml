signature G_I_REPOSITORY_FUNCTION_INFO_CLASS =
  sig
    type 'a functioninfo
    type 'a callableinfo_class
    include CLASS where type 'a class = 'a functioninfo callableinfo_class
  end
