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


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getNValues info = call getNValues_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryValueInfoClass.FFI.fromPtr true
    in
      fun getValue info n = call getValue_ (GIRepositoryBaseInfoClass.toBase info & n)
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
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTypeTag.FFI.fromVal
    in
      fun getStorageType info = call getStorageType_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getErrorDomain info = call getErrorDomain_ (GIRepositoryBaseInfoClass.toBase info)
    end
  end
