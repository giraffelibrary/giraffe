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
          (load_sym libgirepository "g_callable_info_get_return_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getCallerOwns_ =
        call
          (load_sym libgirepository "g_callable_info_get_caller_owns")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal);

      val mayReturnNull_ =
        call
          (load_sym libgirepository "g_callable_info_may_return_null")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val getReturnAttribute_ =
        call
          (load_sym libgirepository "g_callable_info_get_return_attribute")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> Utf8.PolyML.cOutPtr);

      val getNArgs_ =
        call
          (load_sym libgirepository "g_callable_info_get_n_args")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);

      val getArg_ =
        call
          (load_sym libgirepository "g_callable_info_get_arg")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> FFI.Int32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);
    end


    type 'a class = 'a GIRepositoryCallableInfoClass.class
    type 'a arginfo_class = 'a GIRepositoryArgInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type transfer_t = GIRepositoryTransfer.t


    val getReturnType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getReturnType_
          info

    val getCallerOwns =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTransfer.C.fromVal)
          getCallerOwns_
          info

    val mayReturnNull =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) mayReturnNull_ info

    val getReturnAttribute =
      fn info => fn name =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> Utf8.C.withPtr
           ---> Utf8.C.fromOptPtr false
        )
          getReturnAttribute_
          (info & name)

    val getNArgs =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getNArgs_ info

    val getArg =
      fn info => fn n =>
        (
          GIRepositoryBaseInfoClass.C.withPtr
           &&&> FFI.Int32.C.withVal
           ---> GIRepositoryArgInfoClass.C.fromPtr true
        )
          getArg_
          (info & n)
  end
