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
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

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


    val getName =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0)
          getName_ info

    val getNamespace =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0)
          getNamespace_
          info

    val isDeprecated =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GBool.FFI.fromVal)
          isDeprecated_
          info

    val getAttribute =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.FFI.withPtr
          &&&> Utf8.FFI.withPtr
          ---> Utf8.FFI.fromOptPtr 0)
          getAttribute_
          (info & name)

    val getContainer =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GIRepositoryBaseInfoClass.FFI.fromOptPtr false)
          getContainer_
          info

    val getTypelib =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GIRepositoryTypelibType.FFI.fromPtr false)
          getTypelib_
          info

    val equal =
      fn info1 => fn info2 =>
        (GIRepositoryBaseInfoClass.FFI.withPtr &&&> GIRepositoryBaseInfoClass.FFI.withPtr ---> GBool.FFI.fromVal)
        equal_
        (info1 & info2)
  end
