structure GIRepositoryArgInfo :>
  G_I_REPOSITORY_ARG_INFO
    where type 'a class = 'a GIRepositoryArgInfoClass.class
    where type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    where type direction_t = GIRepositoryDirection.t
    where type scopetype_t = GIRepositoryScopeType.t
    where type transfer_t = GIRepositoryTransfer.t =
  struct
    local
      open PolyMLFFI
    in
      val getDirection_ =
        call
          (getSymbol "g_arg_info_get_direction")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryDirection.PolyML.cVal);

      val isCallerAllocates_ =
        call
          (getSymbol "g_arg_info_is_caller_allocates")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val isReturnValue_ =
        call
          (getSymbol "g_arg_info_is_return_value")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val isOptional_ =
        call
          (getSymbol "g_arg_info_is_optional")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val mayBeNull_ =
        call
          (getSymbol "g_arg_info_may_be_null")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val getOwnershipTransfer_ =
        call
          (getSymbol "g_arg_info_get_ownership_transfer")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal);

      val getScope_ =
        call
          (getSymbol "g_arg_info_get_scope")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryScopeType.PolyML.cVal);

      val getClosure_ =
        call
          (getSymbol "g_arg_info_get_closure")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getDestroy_ =
        call
          (getSymbol "g_arg_info_get_destroy")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getType_ =
        call
          (getSymbol "g_arg_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cPtr);
    end


    type 'a class = 'a GIRepositoryArgInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type direction_t = GIRepositoryDirection.t
    type scopetype_t = GIRepositoryScopeType.t
    type transfer_t = GIRepositoryTransfer.t


    val getDirection =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GIRepositoryDirection.FFI.fromVal) getDirection_ info

    val isCallerAllocates =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) isCallerAllocates_ info

    val isReturnValue =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) isReturnValue_ info

    val isOptional =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) isOptional_ info

    val mayBeNull =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) mayBeNull_ info

    val getOwnershipTransfer =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GIRepositoryTransfer.FFI.fromVal)
          getOwnershipTransfer_
          info

    val getScope =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GIRepositoryScopeType.FFI.fromVal) getScope_ info

    val getClosure =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> (fn ~1 => NONE | n => SOME n) o GInt32.FFI.fromVal)
          getClosure_
          info

    val getDestroy =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> (fn ~1 => NONE | n => SOME n) o GInt32.FFI.fromVal)
          getDestroy_
          info

    val getType =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr ---> GIRepositoryTypeInfoClass.FFI.fromPtr true)
          getType_
          info
  end
