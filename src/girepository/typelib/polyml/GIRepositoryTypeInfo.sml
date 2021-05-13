structure GIRepositoryTypeInfo :>
  G_I_REPOSITORY_TYPE_INFO
    where type 'a class = 'a GIRepositoryTypeInfoClass.class
    where type typetag_t = GIRepositoryTypeTag.t
    where type arraytype_t = GIRepositoryArrayType.t
    where type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val isPointer_ =
        call
          (getSymbol "g_type_info_is_pointer")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val getTag_ =
        call
          (getSymbol "g_type_info_get_tag")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryTypeTag.PolyML.cVal);

      val getParamType_ =
        call
          (getSymbol "g_type_info_get_param_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val getInterface_ =
        call
          (getSymbol "g_type_info_get_interface")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val getArrayLength_ =
        call
          (getSymbol "g_type_info_get_array_length")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getArrayFixedSize_ =
        call
          (getSymbol "g_type_info_get_array_fixed_size")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val isZeroTerminated_ =
        call
          (getSymbol "g_type_info_is_zero_terminated")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val getArrayType_ =
        call
          (getSymbol "g_type_info_get_array_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryArrayType.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryTypeInfoClass.class
    type typetag_t = GIRepositoryTypeTag.t
    type arraytype_t = GIRepositoryArrayType.t
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isPointer info = call isPointer_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTypeTag.FFI.fromVal
    in
      fun getTag info = call getTag_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call =
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryTypeInfoClass.FFI.fromOptPtr true
    in
      fun getParamType info n = call getParamType_ (GIRepositoryBaseInfoClass.toBase info & n)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryBaseInfoClass.FFI.fromOptPtr true
    in
      fun getInterface info = call getInterface_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getArrayLength info = call getArrayLength_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getArrayFixedSize info = call getArrayFixedSize_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isZeroTerminated info = call isZeroTerminated_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryArrayType.FFI.fromVal
    in
      fun getArrayType info = call getArrayType_ (GIRepositoryBaseInfoClass.toBase info)
    end
  end
