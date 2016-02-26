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
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryDirection.PolyML.cVal);

      val isCallerAllocates_ =
        call
          (load_sym libgirepository "g_arg_info_is_caller_allocates")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val isReturnValue_ =
        call
          (load_sym libgirepository "g_arg_info_is_return_value")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val isOptional_ =
        call
          (load_sym libgirepository "g_arg_info_is_optional")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val mayBeNull_ =
        call
          (load_sym libgirepository "g_arg_info_may_be_null")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val getOwnershipTransfer_ =
        call
          (load_sym libgirepository "g_arg_info_get_ownership_transfer")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal);

      val getScope_ =
        call
          (load_sym libgirepository "g_arg_info_get_scope")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryScopeType.PolyML.cVal);

      val getClosure_ =
        call
          (load_sym libgirepository "g_arg_info_get_closure")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getDestroy_ =
        call
          (load_sym libgirepository "g_arg_info_get_destroy")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getType_ =
        call
          (load_sym libgirepository "g_arg_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cPtr);
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
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) isCallerAllocates_ info

    val isReturnValue =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) isReturnValue_ info

    val isOptional =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) isOptional_ info

    val mayBeNull =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) mayBeNull_ info

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
        (GIRepositoryBaseInfoClass.C.withPtr ---> (fn ~1 => NONE | n => SOME n) o FFI.Int32.C.fromVal)
          getClosure_
          info

    val getDestroy =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> (fn ~1 => NONE | n => SOME n) o FFI.Int32.C.fromVal)
          getDestroy_
          info

    val getType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getType_
          info
  end
