structure GIRepositoryBaseInfo :>
  G_I_REPOSITORY_BASE_INFO
    where type 'a class_t = 'a GIRepositoryBaseInfoClass.t
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    local
      open PolyMLFFI
    in
      val getName_ =
        call
          (load_sym libgirepository "g_base_info_get_name")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val getNamespace_ =
        call
          (load_sym libgirepository "g_base_info_get_namespace")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr);

      val isDeprecated_ =
        call
          (load_sym libgirepository "g_base_info_is_deprecated")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val getAttribute_ =
        call
          (load_sym libgirepository "g_base_info_get_attribute")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> Utf8.PolyML.cOutOptPtr);

      val getContainer_ =
        call
          (load_sym libgirepository "g_base_info_get_container")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val getTypelib_ =
        call
          (load_sym libgirepository "g_base_info_get_typelib")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryTypelibType.PolyML.cPtr);

      val equal_ =
        call
          (load_sym libgirepository "g_base_info_equal")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GIRepositoryBaseInfoClass.PolyML.cPtr
            --> FFI.Bool.PolyML.cVal);
    end


    type 'a class_t = 'a GIRepositoryBaseInfoClass.t
    type typelibtype_t = GIRepositoryTypelibType.t


    val getName =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> Utf8.C.fromOptPtr false)
          getName_ info

    val getNamespace =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> Utf8.C.fromPtr false)
          getNamespace_
          info

    val isDeprecated =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal)
          isDeprecated_
          info

    val getAttribute =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> Utf8.C.withPtr
          ---> Utf8.C.fromOptPtr false)
          getAttribute_
          (info & name)

    val getContainer =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryBaseInfoClass.C.fromOptPtr false)
          getContainer_
          info

    val getTypelib =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypelibType.C.fromPtr false)
          getTypelib_
          info

    val equal =
      fn info1 => fn info2 =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal)
        equal_
        (info1 & info2)
  end
