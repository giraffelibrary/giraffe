structure GIRepositorySignalInfo :>
  G_I_REPOSITORY_SIGNAL_INFO
    where type 'a class = 'a GIRepositorySignalInfoClass.class
    where type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (load_sym libgirepository "g_signal_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GObjectSignalFlags.PolyML.cVal);

      val getClassClosure_ =
        call
          (load_sym libgirepository "g_signal_info_get_class_closure")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val trueStopsEmit_ =
        call
          (load_sym libgirepository "g_signal_info_true_stops_emit")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);
    end


    type 'a class = 'a GIRepositorySignalInfoClass.class
    type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class


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
