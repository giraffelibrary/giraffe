structure GIRepositoryFunctionInfoClass :>
  G_I_REPOSITORY_FUNCTION_INFO_CLASS
    where type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    where type C.notnull = GIRepositoryCallableInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryCallableInfoClass.C.p =
  struct
    type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    open GIRepositoryCallableInfoClass
    type 'a functioninfo = unit
    type 'a class = 'a functioninfo class
  end
