structure GIRepositoryInterfaceInfo :>
  G_I_REPOSITORY_INTERFACE_INFO
    where type 'a class_t = 'a GIRepositoryInterfaceInfoClass.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
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
      val getNPrerequisites_ =
        call
          (load_sym libgirepository
             "g_interface_info_get_n_prerequisites")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getPrerequisite_ =
        call
          (load_sym libgirepository "g_interface_info_get_prerequisite")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNProperties_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_properties")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getProperty_ =
        call
          (load_sym libgirepository "g_interface_info_get_property")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getMethod_ =
        call
          (load_sym libgirepository "g_interface_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val findMethod_ =
        call
          (load_sym libgirepository "g_interface_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNSignals_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_signals")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getSignal_ =
        call
          (load_sym libgirepository "g_interface_info_get_signal")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNVfuncs_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_vfuncs")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getVfunc_ =
        call
          (load_sym libgirepository "g_interface_info_get_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNConstants_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_constants")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getConstant_ =
        call
          (load_sym libgirepository "g_interface_info_get_constant")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getIfaceStruct_ =
        call
          (load_sym libgirepository "g_interface_info_get_iface_struct")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.OPTPTR);

      val findVfunc_ =
        call
          (load_sym libgirepository "g_interface_info_find_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIRepositoryBaseInfoClass.PolyML.PTR);
    end


    type 'a class_t = 'a GIRepositoryInterfaceInfoClass.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    type 'a constantinfoclass_t = 'a GIRepositoryConstantInfoClass.t
    type 'a structinfoclass_t = 'a GIRepositoryStructInfoClass.t


    val getNPrerequisites =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNPrerequisites_ info

    val getPrerequisite =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryBaseInfoClass.C.fromPtr true)
        getPrerequisite_
        (info & n)

    val getNProperties =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNProperties_ info

    val getProperty =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryPropertyInfoClass.C.fromPtr true)
        getProperty_
        (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        getMethod_
        (info & n)

    val findMethod =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        findMethod_
        (info & name)

    val getNSignals =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNSignals_ info

    val getSignal =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositorySignalInfoClass.C.fromPtr true)
        getSignal_
        (info & n)

    val getNVfuncs =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNVfuncs_ info

    val getVfunc =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryVFuncInfoClass.C.fromPtr true)
        getVfunc_
        (info & n)

    val getNConstants =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNConstants_ info

    val getConstant =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryConstantInfoClass.C.fromPtr true)
        getConstant_
        (info & n)

    val getIfaceStruct =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryStructInfoClass.C.fromOptPtr true)
        getIfaceStruct_
        info

    val findVfunc =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIRepositoryVFuncInfoClass.C.fromPtr true)
        findVfunc_
        (info & name)
  end
