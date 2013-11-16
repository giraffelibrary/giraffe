structure GIRepositoryCallableInfo :>
  G_I_REPOSITORY_CALLABLE_INFO
    where type 'a class_t = 'a GIRepositoryCallableInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    where type transfer_t = GIRepositoryTransfer.t
    where type 'a arginfoclass_t = 'a GIRepositoryArgInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getReturnType_ =
        call
          (load_sym libgirepository "g_callable_info_get_return_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getCallerOwns_ =
        call
          (load_sym libgirepository "g_callable_info_get_caller_owns")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL);

      val mayReturnNull_ =
        call
          (load_sym libgirepository "g_callable_info_may_return_null")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Bool.PolyML.VAL);

      val getReturnAttribute_ =
        call
          (load_sym libgirepository "g_callable_info_get_return_attribute")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.String.PolyML.INPTR
            --> FFI.String.PolyML.RETPTR);

      val getNArgs_ =
        call
          (load_sym libgirepository "g_callable_info_get_n_args")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.Int32.PolyML.VAL);

      val getArg_ =
        call
          (load_sym libgirepository "g_callable_info_get_arg")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);
    end


    type 'a class_t = 'a GIRepositoryCallableInfoClass.t
    type 'a arginfoclass_t = 'a GIRepositoryArgInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
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
           &&&> FFI.String.C.withConstPtr
           ---> FFI.String.C.fromOptPtr false
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
