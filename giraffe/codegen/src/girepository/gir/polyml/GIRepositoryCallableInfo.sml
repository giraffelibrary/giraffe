structure GIRepositoryCallableInfo :>
  G_I_REPOSITORY_CALLABLE_INFO
    where type 'a class = 'a GIRepositoryCallableInfoClass.class
    where type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    where type transfer_t = GIRepositoryTransfer.t
    where type 'a arginfo_class = 'a GIRepositoryArgInfoClass.class =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromCallable f = (I && f) o GIRepositoryCallableInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toType f = GIRepositoryTypeInfoClass.Obj.pack o (I && f)
    fun toArg f = GIRepositoryArgInfoClass.Obj.pack o (I && f)


    type 'a class = 'a GIRepositoryCallableInfoClass.class
    type 'a arginfo_class = 'a GIRepositoryArgInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type transfer_t = GIRepositoryTransfer.t


    fun getReturnType info =
      let
        val _ & {returnValue, ...} & _ = (fromBase o fromCallable) I info
        val {type_, ...} = returnValue
        val Info.BASE (ref {instance, ...}) = type_
      in
        case instance of
          Info.TYPE x => ((toBase o toType) I (type_ & x))
        | _           => raise Fail "internal error: expected TYPE info"
      end

    fun getCallerOwns info =
      let
        val _ & {returnValue, ...} & _ = (fromBase o fromCallable) I info
        val {transferOwnership, ...} = returnValue
      in
        transferOwnership
      end

    fun mayReturnNull info =
      let
        val _ & {returnValue, ...} & _ = (fromBase o fromCallable) I info
        val {nullable, ...} = returnValue
      in
        nullable
      end

    fun getReturnAttribute info name =
      let
        val _ & {returnValue, ...} & _ = (fromBase o fromCallable) I info
        val _ = returnValue
        val _ = name
      in
        NONE
      end

    fun getNArgs info =
      let
        val _ & {parameter, ...} & _ = (fromBase o fromCallable) I info
      in
        LargeInt.fromInt (List.length parameter)
      end

    fun getArg info n =
      let
        val _ & {parameter, ...} & _ = (fromBase o fromCallable) I info
        val base = List.nth (parameter, LargeInt.toInt n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.ARG x => ((toBase o toArg) I (base & x))
        | _          => raise Fail "internal error: expected ARG info"
      end
  end
