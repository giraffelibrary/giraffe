structure GIRepositoryPropertyInfo :>
  G_I_REPOSITORY_PROPERTY_INFO
    where type 'a class_t = 'a GIRepositoryPropertyInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    where type transfer_t = GIRepositoryTransfer.t =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (load_sym libgirepository "g_property_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GObjectParamFlags.PolyML.cVal);

      val getType_ =
        call
          (load_sym libgirepository "g_property_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getOwnershipTransfer_ =
        call
          (load_sym
             libgirepository
             "g_property_info_get_ownership_transfer")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal);
    end


    type 'a class_t = 'a GIRepositoryPropertyInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    type transfer_t = GIRepositoryTransfer.t


    val getFlags =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GObjectParamFlags.C.fromVal)
          getFlags_
          info

    val getType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getType_
          info

    val getOwnershipTransfer =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTransfer.C.fromVal)
        getOwnershipTransfer_
        info
  end
