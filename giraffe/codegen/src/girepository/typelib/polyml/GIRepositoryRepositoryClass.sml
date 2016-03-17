structure GIRepositoryRepositoryClass :>
  G_I_REPOSITORY_REPOSITORY_CLASS
    where type 'a object_class = 'a GObjectObjectClass.class
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a repository = unit
    type 'a object_class = 'a GObjectObjectClass.class
    type 'a class = 'a repository object_class
    fun toBase obj = obj
    structure C = GObjectObjectClass.C
  end
