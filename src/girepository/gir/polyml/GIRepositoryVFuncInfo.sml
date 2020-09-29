structure GIRepositoryVFuncInfo :>
  G_I_REPOSITORY_V_FUNC_INFO
    where type 'a class = 'a GIRepositoryVFuncInfoClass.class
    where type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    where type 'a signalinfo_class = 'a GIRepositorySignalInfoClass.class
    where type vfuncinfoflags_t = GIRepositoryVFuncInfoFlags.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromCallable f = (I && f) o GIRepositoryCallableInfoClass.Obj.unpack
    fun fromVFunc f = (I && f) o GIRepositoryVFuncInfoClass.Obj.unpack


    type 'a class = 'a GIRepositoryVFuncInfoClass.class
    type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    type 'a signalinfo_class = 'a GIRepositorySignalInfoClass.class
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
