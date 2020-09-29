structure GIRepositoryValueInfo :>
  G_I_REPOSITORY_VALUE_INFO
    where type 'a class = 'a GIRepositoryValueInfoClass.class =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromValue f = (I && f) o GIRepositoryValueInfoClass.Obj.unpack


    type 'a class = 'a GIRepositoryValueInfoClass.class


    fun getValueInt info =
      let
        val _ & {value, ...} & _ = (fromBase o fromValue) I info
      in
        value
      end

    fun getValueWord info =
      let
        val _ & {value, ...} & _ = (fromBase o fromValue) I info
      in
        value
      end
  end
