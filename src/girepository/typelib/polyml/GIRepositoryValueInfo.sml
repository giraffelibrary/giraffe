structure GIRepositoryValueInfo :>
  G_I_REPOSITORY_VALUE_INFO
    where type 'a class = 'a GIRepositoryValueInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getValueInt_ =
        call
          (getSymbol "g_value_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getValueWord_ =
        call
          (getSymbol "g_value_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GUInt32.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryValueInfoClass.class


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal
    in
      fun getValueInt info = call getValueInt_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GUInt32.FFI.fromVal
    in
      fun getValueWord info = call getValueWord_ (GIRepositoryBaseInfoClass.toBase info)
    end
  end
