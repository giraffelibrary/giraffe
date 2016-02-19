structure GIRepositoryObjectInfo :>
  G_I_REPOSITORY_OBJECT_INFO
    where type 'a class_t = 'a GIRepositoryObjectInfoClass.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type 'a interfaceinfoclass_t = 'a GIRepositoryInterfaceInfoClass.t
    where type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    where type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    where type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    where type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    where type 'a constantinfoclass_t = 'a GIRepositoryConstantInfoClass.t
    where type 'a structinfoclass_t = 'a GIRepositoryStructInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getTypeName_ =
        call
          (load_sym libgirepository "g_object_info_get_type_name")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> Utf8.PolyML.RETPTR);

      val getTypeInit_ =
        call
          (load_sym libgirepository "g_object_info_get_type_init")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> Utf8.PolyML.RETPTR);

      val getAbstract_ =
        call
          (load_sym libgirepository "g_object_info_get_abstract")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Bool.PolyML.VAL);

      val getFundamental_ =
        call
          (load_sym libgirepository "g_object_info_get_fundamental")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Bool.PolyML.VAL);

      val getParent_ =
        call
          (load_sym libgirepository "g_object_info_get_parent")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.OPTPTR);

      val getNInterfaces_ =
        call
          (load_sym libgirepository "g_object_info_get_n_interfaces")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Int32.PolyML.VAL);

      val getInterface_ =
        call
          (load_sym libgirepository "g_object_info_get_interface")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNFields_ =
        call
          (load_sym libgirepository "g_object_info_get_n_fields")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Int32.PolyML.VAL);

      val getField_ =
        call
          (load_sym libgirepository "g_object_info_get_field")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNProperties_ =
        call
          (load_sym libgirepository "g_object_info_get_n_properties")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Int32.PolyML.VAL);

      val getProperty_ =
        call
          (load_sym libgirepository "g_object_info_get_property")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_object_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Int32.PolyML.VAL);

      val getMethod_ =
        call
          (load_sym libgirepository "g_object_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val findMethod_ =
        call
          (load_sym libgirepository "g_object_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> Utf8.PolyML.INPTR
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNSignals_ =
        call
          (load_sym libgirepository "g_object_info_get_n_signals")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Int32.PolyML.VAL);

      val getSignal_ =
        call
          (load_sym libgirepository "g_object_info_get_signal")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNVfuncs_ =
        call
          (load_sym libgirepository "g_object_info_get_n_vfuncs")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Int32.PolyML.VAL);

      val getVfunc_ =
        call
          (load_sym libgirepository "g_object_info_get_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNConstants_ =
        call
          (load_sym libgirepository "g_object_info_get_n_constants")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Int32.PolyML.VAL);

      val getConstant_ =
        call
          (load_sym libgirepository "g_object_info_get_constant")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getClassStruct_ =
        call
          (load_sym libgirepository "g_object_info_get_class_struct")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.OPTPTR);

      val findVfunc_ =
        call
          (load_sym libgirepository "g_object_info_find_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> Utf8.PolyML.INPTR
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getUnrefFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_unref_function")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> Utf8.PolyML.RETPTR);

      val getRefFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_ref_function")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> Utf8.PolyML.RETPTR);

      val getSetValueFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_set_value_function")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> Utf8.PolyML.RETPTR);

      val getGetValueFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_get_value_function")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> Utf8.PolyML.RETPTR);
    end


    type 'a class_t = 'a GIRepositoryObjectInfoClass.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a interfaceinfoclass_t = 'a GIRepositoryInterfaceInfoClass.t
    type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    type 'a constantinfoclass_t = 'a GIRepositoryConstantInfoClass.t
    type 'a structinfoclass_t = 'a GIRepositoryStructInfoClass.t


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
