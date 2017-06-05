structure GIRepositoryValueInfo :>
  G_I_REPOSITORY_VALUE_INFO
    where type 'a class = 'a GIRepositoryValueInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getValueInt_ =
        call
          (load_sym libgirepository "g_value_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getValueWord_ =
        call
          (load_sym libgirepository "g_value_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GUInt32.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryValueInfoClass.class


    fun getValueInt info =
      (GIRepositoryBaseInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getValueInt_ info

    fun getValueWord info =
      (GIRepositoryBaseInfoClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getValueWord_ info
  end
