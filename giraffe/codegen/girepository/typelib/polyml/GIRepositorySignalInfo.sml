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
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.OPTPTR);

      val trueStopsEmit_ =
        call
          (load_sym libgirepository "g_signal_info_true_stops_emit")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Bool.PolyML.VAL);
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
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryVFuncInfoClass.C.fromOptPtr true)
          getClassClosure_
          info

    val trueStopsEmit =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) trueStopsEmit_ info
  end
