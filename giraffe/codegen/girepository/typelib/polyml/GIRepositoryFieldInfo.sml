structure GIRepositoryFieldInfo :>
  G_I_REPOSITORY_FIELD_INFO
    where type 'a class_t = 'a GIRepositoryFieldInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    where type fieldinfoflags_t = GIRepositoryFieldInfoFlags.flags =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (load_sym libgirepository "g_field_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryFieldInfoFlags.PolyML.VAL);

      val getSize_ =
        call
          (load_sym libgirepository "g_field_info_get_size")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getOffset_ =
        call
          (load_sym libgirepository "g_field_info_get_offset")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getType_ =
        call
          (load_sym libgirepository "g_field_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);
    end


    type 'a class_t = 'a GIRepositoryFieldInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    type fieldinfoflags_t = GIRepositoryFieldInfoFlags.flags


    val getFlags =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryFieldInfoFlags.C.fromVal) getFlags_ info

    val getSize = fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getSize_ info

    val getOffset = fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getOffset_ info

    val getType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getType_
          info
  end
