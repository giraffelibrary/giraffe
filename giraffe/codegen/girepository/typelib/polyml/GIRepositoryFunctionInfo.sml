structure GIRepositoryFunctionInfo :>
  G_I_REPOSITORY_FUNCTION_INFO
    where type 'a class_t = 'a GIRepositoryFunctionInfoClass.t
    where type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    where type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    where type functioninfoflags_t = GIRepositoryFunctionInfoFlags.flags =
  struct
    local
      open PolyMLFFI
    in
      val getSymbol_ =
        call
          (load_sym libgirepository "g_function_info_get_symbol")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val getFlags_ =
        call
          (load_sym libgirepository "g_function_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryFunctionInfoFlags.PolyML.VAL);

      val getProperty_ =
        call
          (load_sym libgirepository "g_function_info_get_property")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getVfunc_ =
        call
          (load_sym libgirepository "g_function_info_get_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);
    end


    type 'a class_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    type functioninfoflags_t = GIRepositoryFunctionInfoFlags.flags


    val getSymbol =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
          getSymbol_
          info

    val getFlags =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryFunctionInfoFlags.C.fromVal)
        getFlags_
        info

    val getProperty =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryPropertyInfoClass.C.fromPtr true)
          getProperty_
          info

    val getVfunc =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryVFuncInfoClass.C.fromPtr true)
          getVfunc_
          info
  end
