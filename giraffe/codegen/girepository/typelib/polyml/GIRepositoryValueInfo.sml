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
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getValueWord_ =
        call
          (load_sym libgirepository "g_value_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Word32.VAL);
    end


    type 'a class_t = 'a GIRepositoryValueInfoClass.t


    fun getValueInt info =
      (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.fromVal) getValueInt_ info

    fun getValueWord info =
      (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Word32.fromVal) getValueWord_ info
  end
