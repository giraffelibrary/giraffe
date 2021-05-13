structure GIRepositoryRegisteredTypeInfo :>
  G_I_REPOSITORY_REGISTERED_TYPE_INFO
    where type 'a class = 'a GIRepositoryRegisteredTypeInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getTypeName_ =
        call
          (getSymbol "g_registered_type_info_get_type_name")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr);

      val getTypeInit_ =
        call
          (getSymbol "g_registered_type_info_get_type_init")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr);

      val getGType_ =
        call
          (getSymbol "g_registered_type_info_get_g_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GObjectType.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryRegisteredTypeInfoClass.class


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getTypeName info = call getTypeName_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getTypeInit info = call getTypeInit_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GObjectType.FFI.fromVal
    in
      fun getGType info = call getGType_ (GIRepositoryBaseInfoClass.toBase info)
    end
  end
