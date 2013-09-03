structure GIRepositoryStructInfo :>
  G_I_REPOSITORY_STRUCT_INFO
    where type 'a class_t = 'a GIRepositoryStructInfoClass.t
    where type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getNFields_ =
        call
          (load_sym libgirepository "g_struct_info_get_n_fields")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getField_ =
        call
          (load_sym libgirepository "g_struct_info_get_field")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_struct_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getMethod_ =
        call
          (load_sym libgirepository "g_struct_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val findMethod_ =
        call
          (load_sym libgirepository "g_struct_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getSize_ =
        call
          (load_sym libgirepository "g_struct_info_get_size")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.ULong.VAL);

      val getAlignment_ =
        call
          (load_sym libgirepository "g_struct_info_get_alignment")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.ULong.VAL);

      val isGtypeStruct_ =
        call
          (load_sym libgirepository "g_struct_info_is_gtype_struct")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val isForeign_ =
        call
          (load_sym libgirepository "g_struct_info_is_foreign")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);
    end


    type 'a class_t = 'a GIRepositoryStructInfoClass.t
    type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t


    val getNFields =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNFields_ info

    val getField =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryFieldInfoClass.C.fromPtr true)
        getField_
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

    val getSize = fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getSize_ info

    val getAlignment =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getAlignment_ info

    val isGtypeStruct =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) isGtypeStruct_ info

    val isForeign =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) isForeign_ info
  end
