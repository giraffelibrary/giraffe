structure GIRepositoryConstantInfoClass :>
  G_I_REPOSITORY_CONSTANT_INFO_CLASS
    where type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    where type C.notnull = GIRepositoryBaseInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a constantinfo = unit
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    type 'a class = 'a constantinfo baseinfo_class
    fun toBase obj = obj
    structure C = GIRepositoryBaseInfoClass.C
  end
