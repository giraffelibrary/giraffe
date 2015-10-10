structure GIRepositorySignalInfo :>
  G_I_REPOSITORY_SIGNAL_INFO
    where type 'a class_t = 'a GIRepositorySignalInfoClass.t
    where type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromCallable f = (I && f) o GIRepositoryCallableInfoClass.Obj.unpack
    fun fromSignal f = (I && f) o GIRepositorySignalInfoClass.Obj.unpack


    type 'a class_t = 'a GIRepositorySignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t


    fun getFlags info =
      let
        val _ & _ & {flags, ...} & _ = (fromBase o fromCallable o fromSignal) I info
      in
        flags
      end

    fun getClassClosure _ = raise Fail "getClassClosure not suppored"

    fun trueStopsEmit _ = raise Fail "trueStopsEmit not suppored"
  end
