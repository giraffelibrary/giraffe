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


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryDirection.FFI.fromVal
    in
      fun getDirection info = call getDirection_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isCallerAllocates info = call isCallerAllocates_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isReturnValue info = call isReturnValue_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isOptional info = call isOptional_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun mayBeNull info = call mayBeNull_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTransfer.FFI.fromVal
    in
      fun getOwnershipTransfer info = call getOwnershipTransfer_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryScopeType.FFI.fromVal
    in
      fun getScope info = call getScope_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> (fn ~1 => NONE | n => SOME n) o GInt32.FFI.fromVal
    in
      fun getClosure info = call getClosure_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> (fn ~1 => NONE | n => SOME n) o GInt32.FFI.fromVal
    in
      fun getDestroy info = call getDestroy_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTypeInfoClass.FFI.fromPtr true
    in
      fun getType info = call getType_ (GIRepositoryBaseInfoClass.toBase info)
    end
  end
