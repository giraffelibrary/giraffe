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


    val getNPrerequisites =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNPrerequisites_ info

    val getPrerequisite =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryBaseInfoClass.FFI.fromPtr true
        )
          getPrerequisite_
          (info & n)

    val getNProperties =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNProperties_ info

    val getProperty =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryPropertyInfoClass.FFI.fromPtr true
        )
          getProperty_
          (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true
        )
          getMethod_
          (info & n)

    val findMethod =
      fn info => fn name =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> Utf8.FFI.withPtr
           ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true
        )
          findMethod_
          (info & name)

    val getNSignals =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNSignals_ info

    val getSignal =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> GInt32.FFI.withVal
           ---> GIRepositorySignalInfoClass.FFI.fromPtr true
        )
          getSignal_
          (info & n)

    val getNVfuncs =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNVfuncs_ info

    val getVfunc =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryVFuncInfoClass.FFI.fromPtr true
        )
          getVfunc_
          (info & n)

    val getNConstants =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNConstants_ info

    val getConstant =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryConstantInfoClass.FFI.fromPtr true
        )
          getConstant_
          (info & n)

    val getIfaceStruct =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GIRepositoryStructInfoClass.FFI.fromOptPtr true)
        getIfaceStruct_
        info

    val findVfunc =
      fn info => fn name =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> Utf8.FFI.withPtr
           ---> GIRepositoryVFuncInfoClass.FFI.fromPtr true
        )
          findVfunc_
          (info & name)
  end
