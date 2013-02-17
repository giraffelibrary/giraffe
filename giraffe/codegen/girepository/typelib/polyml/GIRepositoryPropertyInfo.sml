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
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GObjectParamFlags.PolyML.VAL);

      val getType_ =
        call
          (load_sym libgirepository "g_property_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getOwnershipTransfer_ =
        call
          (load_sym
             libgirepository
             "g_property_info_get_ownership_transfer")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL);
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
