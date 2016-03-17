structure GIRepositoryPropertyInfoClass :>
  G_I_REPOSITORY_PROPERTY_INFO_CLASS
    where type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    where type C.notnull = GIRepositoryBaseInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a propertyinfo = unit
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    type 'a class = 'a propertyinfo baseinfo_class
    fun toBase obj = obj
    structure C = GIRepositoryBaseInfoClass.C
  end
