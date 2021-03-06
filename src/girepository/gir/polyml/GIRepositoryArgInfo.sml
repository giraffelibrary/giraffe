structure GIRepositoryArgInfo :>
  G_I_REPOSITORY_ARG_INFO
    where type 'a class = 'a GIRepositoryArgInfoClass.class
    where type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    where type direction_t = GIRepositoryDirection.t
    where type scopetype_t = GIRepositoryScopeType.t
    where type transfer_t = GIRepositoryTransfer.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromArg f = (I && f) o GIRepositoryArgInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toType f = GIRepositoryTypeInfoClass.Obj.pack o (I && f)


    type 'a class = 'a GIRepositoryArgInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type direction_t = GIRepositoryDirection.t
    type scopetype_t = GIRepositoryScopeType.t
    type transfer_t = GIRepositoryTransfer.t


    fun getDirection info =
      let
        val _ & {direction, ...} & _ = (fromBase o fromArg) I info
      in
        direction
      end

    fun isCallerAllocates info =
      let
        val _ & {callerAllocates, ...} & _ = (fromBase o fromArg) I info
      in
        callerAllocates
      end

    fun isReturnValue _ = raise Fail "isReturnValue not implemented"

    fun isOptional info =
      let
        val _ & {optional, ...} & _ = (fromBase o fromArg) I info
      in
        optional
      end

    fun mayBeNull info =
      let
        val _ & {nullable, ...} & _ = (fromBase o fromArg) I info
      in
        nullable
      end

    fun getOwnershipTransfer info =
      let
        val _ & {transferOwnership, ...} & _ = (fromBase o fromArg) I info
      in
        transferOwnership
      end

    fun getScope info =
      let
        val _ & {scope, ...} & _ = (fromBase o fromArg) I info
      in
        scope
      end

    fun getClosure info =
      let
        val _ & {closure, ...} & _ = (fromBase o fromArg) I info
      in
        closure
      end

    fun getDestroy info =
      let
        val _ & {destroy, ...} & _ = (fromBase o fromArg) I info
      in
        destroy
      end

    fun getType info =
      let
        val _ & {type_, ...} & _ = (fromBase o fromArg) I info
        val Info.BASE (ref {instance, ...}) = type_
      in
        case instance of
          Info.TYPE x => ((toBase o toType) I (type_ & x))
        | _           => raise Fail "internal error: expected TYPE info"
      end
  end
