structure GIRepositoryRegisteredTypeInfo :>
  G_I_REPOSITORY_REGISTERED_TYPE_INFO
    where type 'a class = 'a GIRepositoryRegisteredTypeInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getTypeName_ =
        call
          (load_sym libgirepository "g_registered_type_info_get_type_name")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr);

      val getTypeInit_ =
        call
          (load_sym libgirepository "g_registered_type_info_get_type_init")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr);

      val getGType_ =
        call
          (load_sym libgirepository "g_registered_type_info_get_g_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GObjectType.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryRegisteredTypeInfoClass.class


    val getTypeName =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> Utf8.C.fromOptPtr false)
          getTypeName_
          info

    val getTypeInit =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> Utf8.C.fromOptPtr false)
          getTypeInit_
          info

    val getGType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GObjectType.C.fromVal) getGType_ info
  end
