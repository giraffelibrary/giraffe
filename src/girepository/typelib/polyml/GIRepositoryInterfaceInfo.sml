structure GIRepositoryInterfaceInfo :>
  G_I_REPOSITORY_INTERFACE_INFO
    where type 'a class = 'a GIRepositoryInterfaceInfoClass.class
    where type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    where type 'a propertyinfo_class = 'a GIRepositoryPropertyInfoClass.class
    where type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    where type 'a signalinfo_class = 'a GIRepositorySignalInfoClass.class
    where type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class
    where type 'a constantinfo_class = 'a GIRepositoryConstantInfoClass.class
    where type 'a structinfo_class = 'a GIRepositoryStructInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getNPrerequisites_ =
        call
          (getSymbol
             "g_interface_info_get_n_prerequisites")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getPrerequisite_ =
        call
          (getSymbol "g_interface_info_get_prerequisite")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNProperties_ =
        call
          (getSymbol "g_interface_info_get_n_properties")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getProperty_ =
        call
          (getSymbol "g_interface_info_get_property")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNMethods_ =
        call
          (getSymbol "g_interface_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getMethod_ =
        call
          (getSymbol "g_interface_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val findMethod_ =
        call
          (getSymbol "g_interface_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNSignals_ =
        call
          (getSymbol "g_interface_info_get_n_signals")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getSignal_ =
        call
          (getSymbol "g_interface_info_get_signal")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNVfuncs_ =
        call
          (getSymbol "g_interface_info_get_n_vfuncs")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getVfunc_ =
        call
          (getSymbol "g_interface_info_get_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNConstants_ =
        call
          (getSymbol "g_interface_info_get_n_constants")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getConstant_ =
        call
          (getSymbol "g_interface_info_get_constant")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getIfaceStruct_ =
        call
          (getSymbol "g_interface_info_get_iface_struct")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val findVfunc_ =
        call
          (getSymbol "g_interface_info_find_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);
    end


    type 'a class = 'a GIRepositoryInterfaceInfoClass.class
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    type 'a propertyinfo_class = 'a GIRepositoryPropertyInfoClass.class
    type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    type 'a signalinfo_class = 'a GIRepositorySignalInfoClass.class
    type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class
    type 'a constantinfo_class = 'a GIRepositoryConstantInfoClass.class
    type 'a structinfo_class = 'a GIRepositoryStructInfoClass.class


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getNPrerequisites info = call getNPrerequisites_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryBaseInfoClass.FFI.fromPtr true
    in
      fun getPrerequisite info n = call getPrerequisite_ (GIRepositoryBaseInfoClass.toBase info & n)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getNProperties info = call getNProperties_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryPropertyInfoClass.FFI.fromPtr true
    in
      fun getProperty info n = call getProperty_ (GIRepositoryBaseInfoClass.toBase info & n)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getNMethods info = call getNMethods_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true
    in
      fun getMethod info n = call getMethod_ (GIRepositoryBaseInfoClass.toBase info & n)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true
    in
      fun findMethod info name = call findMethod_ (GIRepositoryBaseInfoClass.toBase info & name)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getNSignals info = call getNSignals_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GIRepositorySignalInfoClass.FFI.fromPtr true
    in
      fun getSignal info n = call getSignal_ (GIRepositoryBaseInfoClass.toBase info & n)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getNVfuncs info = call getNVfuncs_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryVFuncInfoClass.FFI.fromPtr true
    in
      fun getVfunc info n = call getVfunc_ (GIRepositoryBaseInfoClass.toBase info & n)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getNConstants info = call getNConstants_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryConstantInfoClass.FFI.fromPtr true
    in
      fun getConstant info n = call getConstant_ (GIRepositoryBaseInfoClass.toBase info & n)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryStructInfoClass.FFI.fromOptPtr true
    in
      fun getIfaceStruct info = call getIfaceStruct_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> GIRepositoryVFuncInfoClass.FFI.fromPtr true
    in
      fun findVfunc info name = call findVfunc_ (GIRepositoryBaseInfoClass.toBase info & name)
    end
  end
