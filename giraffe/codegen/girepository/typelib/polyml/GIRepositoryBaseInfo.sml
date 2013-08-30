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
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val getNamespace_ =
        call
          (load_sym libgirepository "g_base_info_get_namespace")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val isDeprecated_ =
        call
          (load_sym libgirepository "g_base_info_is_deprecated")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getAttribute_ =
        call
          (load_sym libgirepository "g_base_info_get_attribute")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.String.RETOPTPTR);

      val getContainer_ =
        call
          (load_sym libgirepository "g_base_info_get_container")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.OPTPTR);

      val getTypelib_ =
        call
          (load_sym libgirepository "g_base_info_get_typelib")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryTypelibType.PolyML.PTR);

      val equal_ =
        call
          (load_sym libgirepository "g_base_info_equal")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> GIRepositoryBaseInfoClass.PolyML.PTR
            --> FFI.PolyML.Bool.VAL);
    end


    type 'a class_t = 'a GIRepositoryBaseInfoClass.t
    type typelibtype_t = GIRepositoryTypelibType.t


    val getName =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromOptPtr false)
          getName_ info

    val getNamespace =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
          getNamespace_
          info

    val isDeprecated =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> I)
          isDeprecated_
          info

    val getAttribute =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> FFI.String.fromOptPtr false)
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
        (GIRepositoryBaseInfoClass.C.withPtr &&&> GIRepositoryBaseInfoClass.C.withPtr ---> I)
        equal_
        (info1 & info2)
  end
