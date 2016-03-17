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
          (load_sym libgirepository "g_type_info_is_pointer")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val getTag_ =
        call
          (load_sym libgirepository "g_type_info_get_tag")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryTypeTag.PolyML.cVal);

      val getParamType_ =
        call
          (load_sym libgirepository "g_type_info_get_param_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val getInterface_ =
        call
          (load_sym libgirepository "g_type_info_get_interface")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cOptPtr);

      val getArrayLength_ =
        call
          (load_sym libgirepository "g_type_info_get_array_length")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getArrayFixedSize_ =
        call
          (load_sym libgirepository "g_type_info_get_array_fixed_size")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val isZeroTerminated_ =
        call
          (load_sym libgirepository "g_type_info_is_zero_terminated")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val getArrayType_ =
        call
          (load_sym libgirepository "g_type_info_get_array_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryArrayType.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryTypeInfoClass.class
    type typetag_t = GIRepositoryTypeTag.t
    type arraytype_t = GIRepositoryArrayType.t
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class


    val isPointer =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) isPointer_ info

    val getTag =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeTag.C.fromVal) getTag_ info

    val getParamType =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.Int32.C.withVal
          ---> GIRepositoryTypeInfoClass.C.fromOptPtr true)
          getParamType_
          (info & n)

    val getInterface =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryBaseInfoClass.C.fromOptPtr true)
          getInterface_
          info

    val getArrayLength =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getArrayLength_ info

    val getArrayFixedSize =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getArrayFixedSize_ info

    val isZeroTerminated =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) isZeroTerminated_ info

    val getArrayType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryArrayType.C.fromVal)
          getArrayType_
          info
  end
