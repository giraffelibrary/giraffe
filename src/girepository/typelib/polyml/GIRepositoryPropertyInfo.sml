structure GIRepositoryPropertyInfo :>
  G_I_REPOSITORY_PROPERTY_INFO
    where type 'a class = 'a GIRepositoryPropertyInfoClass.class
    where type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    where type transfer_t = GIRepositoryTransfer.t =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (getSymbol "g_property_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GObjectParamFlags.PolyML.cVal);

      val getType_ =
        call
          (getSymbol "g_property_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getOwnershipTransfer_ =
        call
          (getSymbol "g_property_info_get_ownership_transfer")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryPropertyInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type transfer_t = GIRepositoryTransfer.t


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GObjectParamFlags.FFI.fromVal
    in
      fun getFlags info = call getFlags_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTypeInfoClass.FFI.fromPtr true
    in
      fun getType info = call getType_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTransfer.FFI.fromVal
    in
      fun getOwnershipTransfer info = call getOwnershipTransfer_ (GIRepositoryBaseInfoClass.toBase info)
    end
  end
