structure GIRepositoryConstantInfo :>
  G_I_REPOSITORY_CONSTANT_INFO
    where type 'a class = 'a GIRepositoryConstantInfoClass.class
    where type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    where type argument_t = GIRepositoryArgument.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromConstant f = (I && f) o GIRepositoryConstantInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toType f = GIRepositoryTypeInfoClass.Obj.pack o (I && f)


    type 'a class = 'a GIRepositoryConstantInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type argument_t = GIRepositoryArgument.t


    fun getCType info =
      let
        val _ & {cType, ...} & _ = (fromBase o fromConstant) I info
      in
        cType
      end

    fun getType info =
      let
        val _ & {type_, ...} & _ = (fromBase o fromConstant) I info
        val Info.BASE (ref {instance, ...}) = type_
      in
        case instance of
          Info.TYPE x => ((toBase o toType) I (type_ & x))
        | _           => raise Fail "internal error: expected TYPE info"
      end

    fun getValue info =
      let
        val _ & {value, ...} & _ = (fromBase o fromConstant) I info
      in
        value
      end
  end
