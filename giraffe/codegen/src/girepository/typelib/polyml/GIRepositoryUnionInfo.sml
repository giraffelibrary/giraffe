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
          (getSymbol "g_union_info_get_n_fields")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getField_ =
        call
          (getSymbol "g_union_info_get_field")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNMethods_ =
        call
          (getSymbol "g_union_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getMethod_ =
        call
          (getSymbol "g_union_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val isDiscriminated_ =
        call
          (getSymbol "g_union_info_is_discriminated")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val getDiscriminatorOffset_ =
        call
          (getSymbol "g_union_info_get_discriminator_offset")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getDiscriminatorType_ =
        call
          (getSymbol "g_union_info_get_discriminator_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getDiscriminator_ =
        call
          (getSymbol "g_union_info_get_discriminator")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val findMethod_ =
        call
          (getSymbol "g_union_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getSize_ =
        call
          (getSymbol "g_union_info_get_size")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GULong.PolyML.cVal);

      val getAlignment_ =
        call
          (getSymbol "g_union_info_get_alignment")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GULong.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryUnionInfoClass.class
    type 'a fieldinfo_class = 'a GIRepositoryFieldInfoClass.class
    type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type 'a constantinfo_class = 'a GIRepositoryConstantInfoClass.class


    val getNFields =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNFields_ info

    val getField =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryFieldInfoClass.FFI.fromPtr true
        )
          getField_
          (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true
        )
          getMethod_
          (info & n)

    val isDiscriminated =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) isDiscriminated_ info

    val getDiscriminatorOffset =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getDiscriminatorOffset_ info

    val getDiscriminatorType =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GIRepositoryTypeInfoClass.FFI.fromPtr true)
        getDiscriminatorType_
        info

    val getDiscriminator =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryConstantInfoClass.FFI.fromPtr true
        )
          getDiscriminator_
          (info & n)

    val findMethod =
      fn info => fn name =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr
           &&&> Utf8.FFI.withPtr
           ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true
        )
          findMethod_
          (info & name)

    val getSize = fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GULong.FFI.fromVal) getSize_ info

    val getAlignment =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr ---> GULong.FFI.fromVal) getAlignment_ info
  end
