structure GIRepositorySignalInfo :>
  G_I_REPOSITORY_SIGNAL_INFO
    where type 'a class = 'a GIRepositorySignalInfoClass.class
    where type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromCallable f = (I && f) o GIRepositoryCallableInfoClass.Obj.unpack
    fun fromSignal f = (I && f) o GIRepositorySignalInfoClass.Obj.unpack


    type 'a class = 'a GIRepositorySignalInfoClass.class
    type 'a vfuncinfo_class = 'a GIRepositoryVFuncInfoClass.class


    fun getFlags info =
      let
        val _ & _ & {flags, ...} & _ = (fromBase o fromCallable o fromSignal) I info
      in
        flags
      end

    fun getClassClosure _ = raise Fail "getClassClosure not suppored"

    fun trueStopsEmit _ = raise Fail "trueStopsEmit not suppored"
  end
