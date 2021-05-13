structure GIRepositoryFunctionInfo :>
  G_I_REPOSITORY_FUNCTION_INFO
    where type 'a class = 'a GIRepositoryFunctionInfoClass.class
    where type 'a propertyinfo_class = 'a GIRepositoryPropertyInfoClass.class
    where type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class
    where type functioninfoflags_t = GIRepositoryFunctionInfoFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getSymbol_ =
        call
          (getSymbol "g_function_info_get_symbol")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getFlags_ =
        call
          (getSymbol "g_function_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryFunctionInfoFlags.PolyML.cVal);

      val getProperty_ =
        call
          (getSymbol "g_function_info_get_property")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val getVfunc_ =
        call
          (getSymbol "g_function_info_get_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);
    end


    type 'a class = 'a GIRepositoryFunctionInfoClass.class
    type 'a propertyinfo_class = 'a GIRepositoryPropertyInfoClass.class
    type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class
    type functioninfoflags_t = GIRepositoryFunctionInfoFlags.t


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getSymbol info = call getSymbol_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryFunctionInfoFlags.FFI.fromVal
    in
      fun getFlags info = call getFlags_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryPropertyInfoClass.FFI.fromOptPtr true
    in
      fun getProperty info = call getProperty_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryVFuncInfoClass.FFI.fromOptPtr true
    in
      fun getVfunc info = call getVfunc_ (GIRepositoryBaseInfoClass.toBase info)
    end
  end
