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
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryVFuncInfoFlags.PolyML.VAL);

      val getOffset_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_offset")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getSignal_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_signal")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getInvoker_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_invoker")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);
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
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getOffset_ info

    val getSignal =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositorySignalInfoClass.C.fromPtr true)
          getSignal_
          info

    val getInvoker =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
          getInvoker_
          info
  end
