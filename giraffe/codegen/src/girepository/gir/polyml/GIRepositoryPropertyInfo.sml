structure GIRepositoryPropertyInfo :>
  G_I_REPOSITORY_PROPERTY_INFO
    where type 'a class = 'a GIRepositoryPropertyInfoClass.class
    where type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    where type transfer_t = GIRepositoryTransfer.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromProperty f = (I && f) o GIRepositoryPropertyInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toType f = GIRepositoryTypeInfoClass.Obj.pack o (I && f)


    type 'a class = 'a GIRepositoryPropertyInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type transfer_t = GIRepositoryTransfer.t


    fun getFlags info =
      let
        val _ & {flags, ...} & _ = (fromBase o fromProperty) I info
      in
        flags
      end

    fun getType info =
      let
        val _ & {type_, ...} & _ = (fromBase o fromProperty) I info
        val Info.BASE (ref {instance, ...}) = type_
      in
        case instance of
          Info.TYPE x => ((toBase o toType) I (type_ & x))
        | _           => raise Fail "internal error: expected TYPE info"
      end

    fun getOwnershipTransfer info =
      let
        val _ & {transferOwnership, ...} & _ = (fromBase o fromProperty) I info
      in
        transferOwnership
      end
  end
