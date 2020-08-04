structure GIRepositoryCallableInfo :>
  G_I_REPOSITORY_CALLABLE_INFO
    where type 'a class = 'a GIRepositoryCallableInfoClass.class
    where type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    where type transfer_t = GIRepositoryTransfer.t
    where type 'a arginfo_class = 'a GIRepositoryArgInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getReturnType_ =
        call
          (getSymbol "g_callable_info_get_return_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getCallerOwns_ =
        call
          (getSymbol "g_callable_info_get_caller_owns")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal);

      val mayReturnNull_ =
        call
          (getSymbol "g_callable_info_may_return_null")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val getReturnAttribute_ =
        call
          (getSymbol "g_callable_info_get_return_attribute")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> Utf8.PolyML.cOutOptPtr);

      val getNArgs_ =
        call
          (getSymbol "g_callable_info_get_n_args")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getArg_ =
        call
          (getSymbol "g_callable_info_get_arg")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);
    end


    type 'a class = 'a GIRepositoryCallableInfoClass.class
    type 'a arginfo_class = 'a GIRepositoryArgInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type transfer_t = GIRepositoryTransfer.t


    val getReturnType =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTypeInfoClass.FFI.fromPtr true)
          getReturnType_
          info

    val getCallerOwns =
      fn info =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTransfer.FFI.fromVal)
          getCallerOwns_
          info

    val mayReturnNull =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) mayReturnNull_ info

    val getReturnAttribute =
      fn info => fn name =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> Utf8.FFI.withPtr 0
           ---> Utf8.FFI.fromOptPtr 0
        )
          getReturnAttribute_
          (info & name)

    val getNArgs =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNArgs_ info

    val getArg =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.FFI.withPtr false
           &&&> GInt32.FFI.withVal
           ---> GIRepositoryArgInfoClass.FFI.fromPtr true
        )
          getArg_
          (info & n)
  end
