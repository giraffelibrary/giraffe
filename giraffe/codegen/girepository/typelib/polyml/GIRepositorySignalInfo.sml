structure GIRepositorySignalInfo :>
  G_I_REPOSITORY_SIGNAL_INFO
    where type 'a class_t = 'a GIRepositorySignalInfoClass.t
    where type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (load_sym libgirepository "g_signal_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GObjectSignalFlags.PolyML.VAL);

      val getClassClosure_ =
        call
          (load_sym libgirepository "g_signal_info_get_class_closure")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val trueStopsEmit_ =
        call
          (load_sym libgirepository "g_signal_info_true_stops_emit")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);
    end


    type 'a class_t = 'a GIRepositorySignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t


    val getFlags =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GObjectSignalFlags.C.fromVal)
          getFlags_
          info

    val getClassClosure =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryVFuncInfoClass.C.fromPtr true)
          getClassClosure_
          info

    val trueStopsEmit =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) trueStopsEmit_ info
  end
