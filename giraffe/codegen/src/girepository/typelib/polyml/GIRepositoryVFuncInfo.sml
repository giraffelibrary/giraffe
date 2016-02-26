structure GIRepositoryVFuncInfo :>
  G_I_REPOSITORY_V_FUNC_INFO
    where type 'a class_t = 'a GIRepositoryVFuncInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    where type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    where type vfuncinfoflags_t = GIRepositoryVFuncInfoFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryVFuncInfoFlags.PolyML.cVal);

      val getOffset_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_offset")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getSignal_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_signal")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val getInvoker_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_invoker")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);
    end


    type 'a class_t = 'a GIRepositoryVFuncInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    type vfuncinfoflags_t = GIRepositoryVFuncInfoFlags.t


    val getFlags =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryVFuncInfoFlags.C.fromVal)
        getFlags_
        info

    val getOffset =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getOffset_ info

    val getSignal =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositorySignalInfoClass.C.fromOptPtr true)
          getSignal_
          info

    val getInvoker =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryFunctionInfoClass.C.fromOptPtr true)
          getInvoker_
          info
  end
