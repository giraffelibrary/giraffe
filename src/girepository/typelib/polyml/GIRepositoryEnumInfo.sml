structure GIRepositoryEnumInfo :>
  G_I_REPOSITORY_ENUM_INFO
    where type 'a class = 'a GIRepositoryEnumInfoClass.class
    where type 'a valueinfo_class = 'a GIRepositoryValueInfoClass.class
    where type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    where type typetag_t = GIRepositoryTypeTag.t =
  struct
    local
      open PolyMLFFI
    in
      val getNValues_ =
        call
          (getSymbol "g_enum_info_get_n_values")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getValue_ =
        call
          (getSymbol "g_enum_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNMethods_ =
        call
          (getSymbol "g_enum_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getMethod_ =
        call
          (getSymbol "g_enum_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getStorageType_ =
        call
          (getSymbol "g_enum_info_get_storage_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryTypeTag.PolyML.cVal);

      val getErrorDomain_ =
        call
          (getSymbol "g_enum_info_get_error_domain")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr);
    end


    type 'a class = 'a GIRepositoryEnumInfoClass.class
    type 'a valueinfo_class = 'a GIRepositoryValueInfoClass.class
    type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    type typetag_t = GIRepositoryTypeTag.t


    val getNValues =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNValues_ info

    val getValue =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryValueInfoClass.FFI.fromPtr true
        )
          getValue_
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

    val getStorageType =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTypeTag.FFI.fromVal)
          getStorageType_
          info

    val getErrorDomain =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0)
          getErrorDomain_
          info
  end
