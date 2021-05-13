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


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GObjectSignalFlags.FFI.fromVal
    in
      fun getFlags info = call getFlags_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryVFuncInfoClass.FFI.fromOptPtr true
    in
      fun getClassClosure info = call getClassClosure_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun trueStopsEmit info = call trueStopsEmit_ (GIRepositoryBaseInfoClass.toBase info)
    end
  end
