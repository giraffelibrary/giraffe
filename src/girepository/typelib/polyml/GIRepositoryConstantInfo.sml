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
          (getSymbol "g_constant_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getValue_ =
        call
          (getSymbol "g_constant_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GIRepositoryArgument.PolyML.cPtr
            --> GInt32.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryConstantInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type argument_t = GIRepositoryArgument.t


    local
      val call = GIRepositoryBaseInfoClass.FFI.withPtr false ---> GIRepositoryTypeInfoClass.FFI.fromPtr true
    in
      fun getType info = call getType_ (GIRepositoryBaseInfoClass.toBase info)
    end

    local
      val call =
        GIRepositoryBaseInfoClass.FFI.withPtr false
         &&&> GIRepositoryArgument.FFI.withNewPtr
         ---> GIRepositoryArgument.FFI.fromPtr && I
    in
      fun getValue info =
        let
          val tag = GIRepositoryTypeInfo.getTag (getType info)
          val value & _ = call getValue_ (GIRepositoryBaseInfoClass.toBase info & ())
        in
          value tag
        end
    end
  end
