structure GIRepositoryValueInfo :>
  G_I_REPOSITORY_VALUE_INFO
    where type 'a class_t = 'a GIRepositoryValueInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getValueInt_ =
        call
          (load_sym libgirepository "g_value_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Int32.PolyML.VAL);

      val getValueWord_ =
        call
          (load_sym libgirepository "g_value_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.UInt32.PolyML.VAL);
    end


    type 'a class_t = 'a GIRepositoryValueInfoClass.t


    fun getValueInt info =
      (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getValueInt_ info

    fun getValueWord info =
      (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.UInt32.C.fromVal) getValueWord_ info
  end
