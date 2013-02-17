structure GIRepositoryTypeInfo :>
  G_I_REPOSITORY_TYPE_INFO
    where type 'a class_t = 'a GIRepositoryTypeInfoClass.t
    where type typetag_t = GIRepositoryTypeTag.t
    where type arraytype_t = GIRepositoryArrayType.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val isPointer_ =
        call
          (load_sym libgirepository "g_type_info_is_pointer")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getTag_ =
        call
          (load_sym libgirepository "g_type_info_get_tag")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryTypeTag.PolyML.VAL);

      val getParamType_ =
        call
          (load_sym libgirepository "g_type_info_get_param_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.OPTPTR);

      val getInterface_ =
        call
          (load_sym libgirepository "g_type_info_get_interface")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.OPTPTR);

      val getArrayLength_ =
        call
          (load_sym libgirepository "g_type_info_get_array_length")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getArrayFixedSize_ =
        call
          (load_sym libgirepository "g_type_info_get_array_fixed_size")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val isZeroTerminated_ =
        call
          (load_sym libgirepository "g_type_info_is_zero_terminated")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getArrayType_ =
        call
          (load_sym libgirepository "g_type_info_get_array_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryArrayType.PolyML.VAL);
    end


    type 'a class_t = 'a GIRepositoryTypeInfoClass.t
    type typetag_t = GIRepositoryTypeTag.t
    type arraytype_t = GIRepositoryArrayType.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t


    val isPointer =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) isPointer_ info

    val getTag =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeTag.C.fromVal) getTag_ info

    val getParamType =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> I
          ---> GIRepositoryTypeInfoClass.C.fromOptPtr true)
          getParamType_
          (info & n)

    val getInterface =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryBaseInfoClass.C.fromOptPtr true)
          getInterface_
          info

    val getArrayLength =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getArrayLength_ info

    val getArrayFixedSize =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getArrayFixedSize_ info

    val isZeroTerminated =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) isZeroTerminated_ info

    val getArrayType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryArrayType.C.fromVal)
          getArrayType_
          info
  end
