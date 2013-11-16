structure GIRepositoryConstantInfo :>
  G_I_REPOSITORY_CONSTANT_INFO
    where type 'a class_t = 'a GIRepositoryConstantInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    where type argument_t = GIRepositoryArgument.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ =
        call
          (load_sym libgirepository "g_constant_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getValue_ =
        call
          (load_sym libgirepository "g_constant_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> GIRepositoryArgument.PolyML.PTR
            --> FFI.Int32.PolyML.VAL);
    end


    type 'a class_t = 'a GIRepositoryConstantInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    type argument_t = GIRepositoryArgument.t


    val getType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getType_
          info

    val getValue =
      fn info =>
        let
          val tag = GIRepositoryTypeInfo.getTag (getType info)
          val value & _ =
            (GIRepositoryBaseInfoClass.C.withPtr
              &&&> GIRepositoryArgument.C.withNewPtr
              ---> GIRepositoryArgument.C.fromPtr tag && I)
              getValue_
              (info & ())
        in
          value
        end
  end
