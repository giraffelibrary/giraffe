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


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getNFields info = call getNFields_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryFieldInfoClass.FFI.fromPtr true
    in
      fun getField info n = call getField_ (GIRepositoryBaseInfoClass.toBase info & n)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getNMethods info = call getNMethods_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true
    in
      fun getMethod info n = call getMethod_ (GIRepositoryBaseInfoClass.toBase info & n)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isDiscriminated info = call isDiscriminated_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getDiscriminatorOffset info = call getDiscriminatorOffset_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTypeInfoClass.FFI.fromPtr true
    in
      fun getDiscriminatorType info = call getDiscriminatorType_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryConstantInfoClass.FFI.fromPtr true
    in
      fun getDiscriminator info n = call getDiscriminator_ (GIRepositoryBaseInfoClass.toBase info & n)
    end

    local
      val call = 
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true
    in
      fun findMethod info name = call findMethod_ (GIRepositoryBaseInfoClass.toBase info & name)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GULong.FFI.fromVal
    in
      fun getSize info = call getSize_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GULong.FFI.fromVal
    in
      fun getAlignment info = call getAlignment_ (GIRepositoryBaseInfoClass.toBase info)
    end
  end
