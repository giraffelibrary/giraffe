structure GIRepositoryFieldInfo :>
  G_I_REPOSITORY_FIELD_INFO
    where type 'a class = 'a GIRepositoryFieldInfoClass.class
    where type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    where type fieldinfoflags_t = GIRepositoryFieldInfoFlags.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromField f = (I && f) o GIRepositoryFieldInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toType f = GIRepositoryTypeInfoClass.Obj.pack o (I && f)


    type 'a class = 'a GIRepositoryFieldInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type fieldinfoflags_t = GIRepositoryFieldInfoFlags.t


    fun getFlags info =
      let
        val _ & {flags, ...} & _ = (fromBase o fromField) I info
      in
        flags
      end   

    fun getBits info =
      let
        val _ & {bits, ...} & _ = (fromBase o fromField) I info
      in
        bits
      end   

    fun getType info =
      let
        val _ & {type_, ...} & _ = (fromBase o fromField) I info
        val Info.BASE (ref {instance, ...}) = type_
      in
        case instance of
          Info.TYPE x => ((toBase o toType) I (type_ & x))
        | _           => raise Fail "internal error: expected TYPE info"
      end
  end
