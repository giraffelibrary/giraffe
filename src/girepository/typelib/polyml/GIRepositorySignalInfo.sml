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
          (getSymbol "g_signal_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GObjectSignalFlags.PolyML.cVal);

      val getClassClosure_ =
        call
          (getSymbol "g_signal_info_get_class_closure")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val trueStopsEmit_ =
        call
          (getSymbol "g_signal_info_true_stops_emit")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);
    end


    type 'a class = 'a GIRepositorySignalInfoClass.class
    type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class


    val getFlags =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GObjectSignalFlags.FFI.fromVal)
          getFlags_
          info

    val getClassClosure =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryVFuncInfoClass.FFI.fromOptPtr true)
          getClassClosure_
          info

    val trueStopsEmit =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) trueStopsEmit_ info
  end
