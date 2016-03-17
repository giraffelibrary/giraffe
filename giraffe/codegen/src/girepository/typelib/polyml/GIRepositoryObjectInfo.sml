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
          (load_sym libgirepository "g_object_info_get_type_name")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getTypeInit_ =
        call
          (load_sym libgirepository "g_object_info_get_type_init")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getAbstract_ =
        call
          (load_sym libgirepository "g_object_info_get_abstract")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val getFundamental_ =
        call
          (load_sym libgirepository "g_object_info_get_fundamental")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val getParent_ =
        call
          (load_sym libgirepository "g_object_info_get_parent")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val getNInterfaces_ =
        call
          (load_sym libgirepository "g_object_info_get_n_interfaces")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getInterface_ =
        call
          (load_sym libgirepository "g_object_info_get_interface")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNFields_ =
        call
          (load_sym libgirepository "g_object_info_get_n_fields")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getField_ =
        call
          (load_sym libgirepository "g_object_info_get_field")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNProperties_ =
        call
          (load_sym libgirepository "g_object_info_get_n_properties")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getProperty_ =
        call
          (load_sym libgirepository "g_object_info_get_property")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_object_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getMethod_ =
        call
          (load_sym libgirepository "g_object_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val findMethod_ =
        call
          (load_sym libgirepository "g_object_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNSignals_ =
        call
          (load_sym libgirepository "g_object_info_get_n_signals")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getSignal_ =
        call
          (load_sym libgirepository "g_object_info_get_signal")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNVfuncs_ =
        call
          (load_sym libgirepository "g_object_info_get_n_vfuncs")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getVfunc_ =
        call
          (load_sym libgirepository "g_object_info_get_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNConstants_ =
        call
          (load_sym libgirepository "g_object_info_get_n_constants")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getConstant_ =
        call
          (load_sym libgirepository "g_object_info_get_constant")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getClassStruct_ =
        call
          (load_sym libgirepository "g_object_info_get_class_struct")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val findVfunc_ =
        call
          (load_sym libgirepository "g_object_info_find_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getUnrefFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_unref_function")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getRefFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_ref_function")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getSetValueFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_set_value_function")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getGetValueFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_get_value_function")
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
        (GIRepositoryBaseInfoClass.C.withPtr ---> Utf8.C.fromPtr false)
          getTypeName_
          info

    val getTypeInit =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> Utf8.C.fromPtr false)
          getTypeInit_
          info

    val getAbstract =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) getAbstract_ info

    val getFundamental =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) getFundamental_ info

    val getParent =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryObjectInfoClass.C.fromOptPtr true)
          getParent_
          info

    val getNInterfaces =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNInterfaces_ info

    val getInterface =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositoryInterfaceInfoClass.C.fromPtr true
        )
          getInterface_
          (info & n)

    val getNFields =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNFields_ info

    val getField =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositoryFieldInfoClass.C.fromPtr true
        )
          getField_
          (info & n)

    val getNProperties =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNProperties_ info

    val getProperty =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositoryPropertyInfoClass.C.fromPtr true
        )
          getProperty_
          (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositoryFunctionInfoClass.C.fromPtr true
        )
          getMethod_
          (info & n)

    val findMethod =
      fn info => fn name =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> Utf8.C.withPtr
           ---> GIRepositoryFunctionInfoClass.C.fromPtr true
        )
          findMethod_
          (info & name)

    val getNSignals =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNSignals_ info

    val getSignal =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositorySignalInfoClass.C.fromPtr true
        )
          getSignal_
          (info & n)

    val getNVfuncs =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNVfuncs_ info

    val getVfunc =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositoryVFuncInfoClass.C.fromPtr true
        )
          getVfunc_
          (info & n)

    val getNConstants =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNConstants_ info

    val getConstant =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositoryConstantInfoClass.C.fromPtr true
        )
          getConstant_
          (info & n)

    val getClassStruct =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryStructInfoClass.C.fromOptPtr true)
          getClassStruct_
          info

    val findVfunc =
      fn info => fn name =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> Utf8.C.withPtr
           ---> GIRepositoryVFuncInfoClass.C.fromPtr true
        )
          findVfunc_
          (info & name)

    val getUnrefFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> Utf8.C.fromPtr false)
          getUnrefFunction_
          info

    val getRefFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> Utf8.C.fromPtr false)
          getRefFunction_
          info

    val getSetValueFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> Utf8.C.fromPtr false)
          getSetValueFunction_
          info

    val getGetValueFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> Utf8.C.fromPtr false)
          getGetValueFunction_
          info
  end
