structure GIRepositoryVFuncInfo :>
  G_I_REPOSITORY_V_FUNC_INFO
    where type 'a class = 'a GIRepositoryVFuncInfoClass.class
    where type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    where type 'a signalinfo_class = 'a GIRepositorySignalInfoClass.class
    where type vfuncinfoflags_t = GIRepositoryVFuncInfoFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (getSymbol "g_vfunc_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryVFuncInfoFlags.PolyML.cVal);

      val getOffset_ =
        call
          (getSymbol "g_vfunc_info_get_offset")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getSignal_ =
        call
          (getSymbol "g_vfunc_info_get_signal")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val getInvoker_ =
        call
          (getSymbol "g_vfunc_info_get_invoker")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);
    end


    type 'a class = 'a GIRepositoryVFuncInfoClass.class
    type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    type 'a signalinfo_class = 'a GIRepositorySignalInfoClass.class
    type vfuncinfoflags_t = GIRepositoryVFuncInfoFlags.t


    val getFlags =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryVFuncInfoFlags.FFI.fromVal)
        getFlags_
        info

    val getOffset =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getOffset_ info

    val getSignal =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositorySignalInfoClass.FFI.fromOptPtr true)
          getSignal_
          info

    val getInvoker =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryFunctionInfoClass.FFI.fromOptPtr true)
          getInvoker_
          info
  end
