structure GIRepositoryUnionInfo :>
  G_I_REPOSITORY_UNION_INFO
    where type 'a class = 'a GIRepositoryUnionInfoClass.class
    where type 'a fieldinfo_class = 'a GIRepositoryFieldInfoClass.class
    where type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getNFields_ =
        call
          (load_sym libgirepository "g_union_info_get_n_fields")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getField_ =
        call
          (load_sym libgirepository "g_union_info_get_field")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_union_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getMethod_ =
        call
          (load_sym libgirepository "g_union_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val isDiscriminated_ =
        call
          (load_sym libgirepository "g_union_info_is_discriminated")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val getDiscriminatorOffset_ =
        call
          (load_sym libgirepository "g_union_info_get_discriminator_offset")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getDiscriminatorType_ =
        call
          (load_sym libgirepository "g_union_info_get_discriminator_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getDiscriminator_ =
        call
          (load_sym libgirepository "g_union_info_get_discriminator")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val findMethod_ =
        call
          (load_sym libgirepository "g_union_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getSize_ =
        call
          (load_sym libgirepository "g_union_info_get_size")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.ULong.PolyML.cVal);

      val getAlignment_ =
        call
          (load_sym libgirepository "g_union_info_get_alignment")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.ULong.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryUnionInfoClass.class
    type 'a fieldinfo_class = 'a GIRepositoryFieldInfoClass.class
    type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type 'a constantinfo_class = 'a GIRepositoryConstantInfoClass.class


    val getNFields =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNFields_ info

    val getField =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositoryFieldInfoClass.C.fromPtr true
        )
          getField_
          (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositoryFunctionInfoClass.C.fromPtr true
        )
          getMethod_
          (info & n)

    val isDiscriminated =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) isDiscriminated_ info

    val getDiscriminatorOffset =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getDiscriminatorOffset_ info

    val getDiscriminatorType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
        getDiscriminatorType_
        info

    val getDiscriminator =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositoryConstantInfoClass.C.fromPtr true
        )
          getDiscriminator_
          (info & n)

    val findMethod =
      fn info => fn name =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> Utf8.C.withPtr
           ---> GIRepositoryFunctionInfoClass.C.fromPtr true
        )
          findMethod_
          (info & name)

    val getSize = fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.ULong.C.fromVal) getSize_ info

    val getAlignment =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.ULong.C.fromVal) getAlignment_ info
  end
