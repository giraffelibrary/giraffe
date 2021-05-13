structure GIRepositoryBaseInfo :>
  G_I_REPOSITORY_BASE_INFO
    where type 'a class = 'a GIRepositoryBaseInfoClass.class
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    local
      open PolyMLFFI
    in
      val getName_ =
        call
          (getSymbol "g_base_info_get_name")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr);

      val getNamespace_ =
        call
          (getSymbol "g_base_info_get_namespace")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val isDeprecated_ =
        call
          (getSymbol "g_base_info_is_deprecated")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val getAttribute_ =
        call
          (getSymbol "g_base_info_get_attribute")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> Utf8.PolyML.cOutOptPtr);

      val getContainer_ =
        call
          (getSymbol "g_base_info_get_container")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val getTypelib_ =
        call
          (getSymbol "g_base_info_get_typelib")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryTypelibType.PolyML.cPtr);

      val equal_ =
        call
          (getSymbol "g_base_info_equal")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GIRepositoryBaseInfoClass.PolyML.cPtr
            --> GBool.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryBaseInfoClass.class
    type typelibtype_t = GIRepositoryTypelibType.t


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getName info = call getName_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getNamespace info = call getNamespace_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isDeprecated info = call isDeprecated_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call =
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> Utf8.FFI.fromOptPtr 0
    in
      fun getAttribute info name = call getAttribute_ (GIRepositoryBaseInfoClass.toBase info & name)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryBaseInfoClass.FFI.fromOptPtr false
    in
      fun getContainer info = call getContainer_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTypelibType.FFI.fromPtr false
    in
      fun getTypelib info = call getTypelib_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call =
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GIRepositoryBaseInfoClass.FFI.withPtr false
         ---> GBool.FFI.fromVal
    in
      fun equal info1 info2 = call equal_ (GIRepositoryBaseInfoClass.toBase info1 & GIRepositoryBaseInfoClass.toBase info2)
    end
  end
