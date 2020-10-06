structure GIRepositoryRegisteredTypeInfo :>
  G_I_REPOSITORY_REGISTERED_TYPE_INFO
    where type 'a class = 'a GIRepositoryRegisteredTypeInfoClass.class =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromRegisteredType f = (I && f) o GIRepositoryRegisteredTypeInfoClass.Obj.unpack


    type 'a class = 'a GIRepositoryRegisteredTypeInfoClass.class


    fun getCType info =
      let
        val _ & {cType, ...} & _ = (fromBase o fromRegisteredType) I info
      in
        cType
      end

    fun getTypeName info =
      let
        val _ & {typeName, ...} & _ = (fromBase o fromRegisteredType) I info
      in
        typeName
      end

    fun getTypeInit info =
      let
        val _ & {getType, ...} & _ = (fromBase o fromRegisteredType) I info
      in
        getType
      end
  end
