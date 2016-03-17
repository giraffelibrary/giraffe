structure GIRepositoryConstantInfo :>
  G_I_REPOSITORY_CONSTANT_INFO
    where type 'a class = 'a GIRepositoryConstantInfoClass.class
    where type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    where type argument_t = GIRepositoryArgument.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ =
        call
          (load_sym libgirepository "g_constant_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getValue_ =
        call
          (load_sym libgirepository "g_constant_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GIRepositoryArgument.PolyML.cPtr
            --> FFI.Int32.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryConstantInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
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
