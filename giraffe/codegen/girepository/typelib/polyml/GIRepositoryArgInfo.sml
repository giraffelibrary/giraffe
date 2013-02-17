structure GIRepositoryArgInfo :>
  G_I_REPOSITORY_ARG_INFO
    where type 'a class_t = 'a GIRepositoryArgInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    where type direction_t = GIRepositoryDirection.t
    where type scopetype_t = GIRepositoryScopeType.t
    where type transfer_t = GIRepositoryTransfer.t =
  struct
    local
      open PolyMLFFI
    in
      val getDirection_ =
        call
          (load_sym libgirepository "g_arg_info_get_direction")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryDirection.PolyML.VAL);

      val isCallerAllocates_ =
        call
          (load_sym libgirepository "g_arg_info_is_caller_allocates")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val isReturnValue_ =
        call
          (load_sym libgirepository "g_arg_info_is_return_value")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val isOptional_ =
        call
          (load_sym libgirepository "g_arg_info_is_optional")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val mayBeNull_ =
        call
          (load_sym libgirepository "g_arg_info_may_be_null")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getOwnershipTransfer_ =
        call
          (load_sym libgirepository "g_arg_info_get_ownership_transfer")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL);

      val getScope_ =
        call
          (load_sym libgirepository "g_arg_info_get_scope")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryScopeType.PolyML.VAL);

      val getClosure_ =
        call
          (load_sym libgirepository "g_arg_info_get_closure")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getDestroy_ =
        call
          (load_sym libgirepository "g_arg_info_get_destroy")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getType_ =
        call
          (load_sym libgirepository "g_arg_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);
    end


    type 'a class_t = 'a GIRepositoryArgInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    type direction_t = GIRepositoryDirection.t
    type scopetype_t = GIRepositoryScopeType.t
    type transfer_t = GIRepositoryTransfer.t


    val getDirection =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryDirection.C.fromVal) getDirection_ info

    val isCallerAllocates =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> I) isCallerAllocates_ info

    val isReturnValue =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> I) isReturnValue_ info

    val isOptional =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> I) isOptional_ info

    val mayBeNull =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> I) mayBeNull_ info

    val getOwnershipTransfer =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTransfer.C.fromVal)
          getOwnershipTransfer_
          info

    val getScope =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryScopeType.C.fromVal) getScope_ info

    val getClosure =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> (fn ~1 => NONE | n => SOME n))
          getClosure_
          info

    val getDestroy =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> (fn ~1 => NONE | n => SOME n))
          getDestroy_
          info

    val getType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getType_
          info
  end
