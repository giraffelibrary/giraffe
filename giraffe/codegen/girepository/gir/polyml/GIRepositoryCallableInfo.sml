structure GIRepositoryCallableInfo :>
  G_I_REPOSITORY_CALLABLE_INFO
    where type 'a class_t = 'a GIRepositoryCallableInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    where type transfer_t = GIRepositoryTransfer.t
    where type 'a arginfoclass_t = 'a GIRepositoryArgInfoClass.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromCallable f = (I && f) o GIRepositoryCallableInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toType f = GIRepositoryTypeInfoClass.Obj.pack o (I && f)
    fun toArg f = GIRepositoryArgInfoClass.Obj.pack o (I && f)


    type 'a class_t = 'a GIRepositoryCallableInfoClass.t
    type 'a arginfoclass_t = 'a GIRepositoryArgInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
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

    fun mayReturnNull _ = false

    fun getReturnAttribute info name =
      let
        val _ & {returnValue, ...} & _ = (fromBase o fromCallable) I info
        val _ = returnValue
      in
        NONE
      end

    fun getNArgs info =
      let
        val _ & {parameter, ...} & _ = (fromBase o fromCallable) I info
      in
        List.length parameter
      end

    fun getArg info n =
      let
        val _ & {parameter, ...} & _ = (fromBase o fromCallable) I info
        val base = List.nth (parameter, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.ARG x => ((toBase o toArg) I (base & x))
        | _          => raise Fail "internal error: expected ARG info"
      end
  end
