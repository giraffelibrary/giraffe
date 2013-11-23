structure GIRepositoryVFuncInfo :>
  G_I_REPOSITORY_V_FUNC_INFO
    where type 'a class_t = 'a GIRepositoryVFuncInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    where type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    where type vfuncinfoflags_t = GIRepositoryVFuncInfoFlags.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromCallable f = (I && f) o GIRepositoryCallableInfoClass.Obj.unpack
    fun fromVFunc f = (I && f) o GIRepositoryVFuncInfoClass.Obj.unpack


    type 'a class_t = 'a GIRepositoryVFuncInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    type vfuncinfoflags_t = GIRepositoryVFuncInfoFlags.t


    fun getFlags info =
      let
        val _ & _ & {flags, ...} & _ = (fromBase o fromCallable o fromVFunc) I info
      in
        flags
      end

    fun getSignal _ = raise Fail "getSignal not supported"

    fun getInvoker _ = raise Fail "getInvoker not supported"
  end
