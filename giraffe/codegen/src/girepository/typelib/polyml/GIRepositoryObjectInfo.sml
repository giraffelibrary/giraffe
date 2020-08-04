structure GIRepositoryObjectInfo :>
  G_I_REPOSITORY_OBJECT_INFO
    where type 'a class = 'a GIRepositoryObjectInfoClass.class
    where type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    where type 'a interfaceinfo_class = 'a GIRepositoryInterfaceInfoClass.class
    where type 'a fieldinfo_class = 'a GIRepositoryFieldInfoClass.class
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
      val getTypeName_ =
        call
          (getSymbol "g_object_info_get_type_name")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getTypeInit_ =
        call
          (getSymbol "g_object_info_get_type_init")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getAbstract_ =
        call
          (getSymbol "g_object_info_get_abstract")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val getFundamental_ =
        call
          (getSymbol "g_object_info_get_fundamental")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val getParent_ =
        call
          (getSymbol "g_object_info_get_parent")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val getNInterfaces_ =
        call
          (getSymbol "g_object_info_get_n_interfaces")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getInterface_ =
        call
          (getSymbol "g_object_info_get_interface")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNFields_ =
        call
          (getSymbol "g_object_info_get_n_fields")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getField_ =
        call
          (getSymbol "g_object_info_get_field")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNProperties_ =
        call
          (getSymbol "g_object_info_get_n_properties")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getProperty_ =
        call
          (getSymbol "g_object_info_get_property")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNMethods_ =
        call
          (getSymbol "g_object_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getMethod_ =
        call
          (getSymbol "g_object_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val findMethod_ =
        call
          (getSymbol "g_object_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNSignals_ =
        call
          (getSymbol "g_object_info_get_n_signals")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getSignal_ =
        call
          (getSymbol "g_object_info_get_signal")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNVfuncs_ =
        call
          (getSymbol "g_object_info_get_n_vfuncs")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getVfunc_ =
        call
          (getSymbol "g_object_info_get_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNConstants_ =
        call
          (getSymbol "g_object_info_get_n_constants")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getConstant_ =
        call
          (getSymbol "g_object_info_get_constant")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getClassStruct_ =
        call
          (getSymbol "g_object_info_get_class_struct")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val findVfunc_ =
        call
          (getSymbol "g_object_info_find_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getUnrefFunction_ =
        call
          (getSymbol "g_object_info_get_unref_function")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getRefFunction_ =
        call
          (getSymbol "g_object_info_get_ref_function")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getSetValueFunction_ =
        call
          (getSymbol "g_object_info_get_set_value_function")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getGetValueFunction_ =
        call
          (getSymbol "g_object_info_get_get_value_function")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);
    end


    type 'a class = 'a GIRepositoryObjectInfoClass.class
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    type 'a interfaceinfo_class = 'a GIRepositoryInterfaceInfoClass.class
    type 'a fieldinfo_class = 'a GIRepositoryFieldInfoClass.class
    type 'a propertyinfo_class = 'a GIRepositoryPropertyInfoClass.class
    type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    type 'a signalinfo_class = 'a GIRepositorySignalInfoClass.class
    type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class
    type 'a constantinfo_class = 'a GIRepositoryConstantInfoClass.class
    type 'a structinfo_class = 'a GIRepositoryStructInfoClass.class


    val getTypeName =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0)
          getTypeName_
          info

    val getTypeInit =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0)
          getTypeInit_
          info

    val getAbstract =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAbstract_ info

    val getFundamental =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFundamental_ info

    val getParent =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryObjectInfoClass.FFI.fromOptPtr true)
          getParent_
          info

    val getNInterfaces =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNInterfaces_ info

    val getInterface =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryInterfaceInfoClass.FFI.fromPtr true
        )
          getInterface_
          (info & n)

    val getNFields =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNFields_ info

    val getField =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryFieldInfoClass.FFI.fromPtr true
        )
          getField_
          (info & n)

    val getNProperties =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNProperties_ info

    val getProperty =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryPropertyInfoClass.FFI.fromPtr true
        )
          getProperty_
          (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true
        )
          getMethod_
          (info & n)

    val findMethod =
      fn info => fn name =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> Utf8.FFI.withPtr 0
           ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true
        )
          findMethod_
          (info & name)

    val getNSignals =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNSignals_ info

    val getSignal =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> GInt32.FFI.withVal
           ---> GIRepositorySignalInfoClass.FFI.fromPtr true
        )
          getSignal_
          (info & n)

    val getNVfuncs =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNVfuncs_ info

    val getVfunc =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryVFuncInfoClass.FFI.fromPtr true
        )
          getVfunc_
          (info & n)

    val getNConstants =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNConstants_ info

    val getConstant =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryConstantInfoClass.FFI.fromPtr true
        )
          getConstant_
          (info & n)

    val getClassStruct =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryStructInfoClass.FFI.fromOptPtr true)
          getClassStruct_
          info

    val findVfunc =
      fn info => fn name =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> Utf8.FFI.withPtr 0
           ---> GIRepositoryVFuncInfoClass.FFI.fromPtr true
        )
          findVfunc_
          (info & name)

    val getUnrefFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0)
          getUnrefFunction_
          info

    val getRefFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0)
          getRefFunction_
          info

    val getSetValueFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0)
          getSetValueFunction_
          info

    val getGetValueFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0)
          getGetValueFunction_
          info
  end
