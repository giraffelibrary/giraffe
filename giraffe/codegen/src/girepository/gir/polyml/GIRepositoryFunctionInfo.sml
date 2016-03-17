structure GIRepositoryFunctionInfo :>
  G_I_REPOSITORY_FUNCTION_INFO
    where type 'a class = 'a GIRepositoryFunctionInfoClass.class
    where type 'a propertyinfo_class = 'a GIRepositoryPropertyInfoClass.class
    where type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class
    where type functioninfoflags_t = GIRepositoryFunctionInfoFlags.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromCallable f = (I && f) o GIRepositoryCallableInfoClass.Obj.unpack
    fun fromFunction f = (I && f) o GIRepositoryFunctionInfoClass.Obj.unpack


    type 'a class = 'a GIRepositoryFunctionInfoClass.class
    type 'a propertyinfo_class = 'a GIRepositoryPropertyInfoClass.class
    type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class
    type functioninfoflags_t = GIRepositoryFunctionInfoFlags.t


    fun getSymbol info =
      let
        val _ & _ & {symbol, ...} & _ = (fromBase o fromCallable o fromFunction) I info
      in
        symbol
      end

    fun getFlags info =
      let
        val _ & _ & {flags, ...} & _ = (fromBase o fromCallable o fromFunction) I info
      in
        flags
      end

    fun getProperty _ = raise Fail "getProperty not supported"

    fun getVfunc _ = raise Fail "getVfunc not supported"
  end
