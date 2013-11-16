structure GIRepositoryEnumInfo :>
  G_I_REPOSITORY_ENUM_INFO
    where type 'a class_t = 'a GIRepositoryEnumInfoClass.t
    where type 'a valueinfoclass_t = 'a GIRepositoryValueInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    where type typetag_t = GIRepositoryTypeTag.t =
  struct
    local
      open PolyMLFFI
    in
      val getNValues_ =
        call
          (load_sym libgirepository "g_enum_info_get_n_values")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Int32.PolyML.VAL);

      val getValue_ =
        call
          (load_sym libgirepository "g_enum_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_enum_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Int32.PolyML.VAL);

      val getMethod_ =
        call
          (load_sym libgirepository "g_enum_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getStorageType_ =
        call
          (load_sym libgirepository "g_enum_info_get_storage_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryTypeTag.PolyML.VAL);

      val getErrorDomain_ =
        call
          (load_sym libgirepository "g_enum_info_get_error_domain")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.String.PolyML.RETOPTPTR);
    end


    type 'a class_t = 'a GIRepositoryEnumInfoClass.t
    type 'a valueinfoclass_t = 'a GIRepositoryValueInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type typetag_t = GIRepositoryTypeTag.t


    val getNValues =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNValues_ info

    val getValue =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositoryValueInfoClass.C.fromPtr true
        )
          getValue_
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

    val getStorageType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeTag.C.fromVal)
          getStorageType_
          info

    val getErrorDomain =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.C.fromOptPtr false)
          getErrorDomain_
          info
  end
