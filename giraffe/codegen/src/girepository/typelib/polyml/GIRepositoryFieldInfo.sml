structure GIRepositoryFieldInfo :>
  G_I_REPOSITORY_FIELD_INFO
    where type 'a class = 'a GIRepositoryFieldInfoClass.class
    where type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    where type fieldinfoflags_t = GIRepositoryFieldInfoFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (load_sym libgirepository "g_field_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryFieldInfoFlags.PolyML.cVal);

      val getSize_ =
        call
          (load_sym libgirepository "g_field_info_get_size")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getOffset_ =
        call
          (load_sym libgirepository "g_field_info_get_offset")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getType_ =
        call
          (load_sym libgirepository "g_field_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cPtr);
    end


    type 'a class = 'a GIRepositoryFieldInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type fieldinfoflags_t = GIRepositoryFieldInfoFlags.t


    val getFlags =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryFieldInfoFlags.C.fromVal) getFlags_ info

    val getSize = fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getSize_ info

    val getOffset = fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getOffset_ info

    val getType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getType_
          info
  end
