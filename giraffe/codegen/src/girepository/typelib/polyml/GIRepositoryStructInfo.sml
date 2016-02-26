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
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getField_ =
        call
          (load_sym libgirepository "g_struct_info_get_field")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_struct_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getMethod_ =
        call
          (load_sym libgirepository "g_struct_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val findMethod_ =
        call
          (load_sym libgirepository "g_struct_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getSize_ =
        call
          (load_sym libgirepository "g_struct_info_get_size")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.ULong.PolyML.cVal);

      val getAlignment_ =
        call
          (load_sym libgirepository "g_struct_info_get_alignment")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.ULong.PolyML.cVal);

      val isGtypeStruct_ =
        call
          (load_sym libgirepository "g_struct_info_is_gtype_struct")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val isForeign_ =
        call
          (load_sym libgirepository "g_struct_info_is_foreign")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);
    end


    type 'a class_t = 'a GIRepositoryStructInfoClass.t
    type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t


    val getNFields =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNFields_ info

    val getField =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryFieldInfoClass.C.fromPtr true)
        getField_
        (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        getMethod_
        (info & n)

    val findMethod =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> Utf8.C.withPtr
          ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        findMethod_
        (info & name)

    val getSize = fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.ULong.C.fromVal) getSize_ info

    val getAlignment =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.ULong.C.fromVal) getAlignment_ info

    val isGtypeStruct =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) isGtypeStruct_ info

    val isForeign =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) isForeign_ info
  end
