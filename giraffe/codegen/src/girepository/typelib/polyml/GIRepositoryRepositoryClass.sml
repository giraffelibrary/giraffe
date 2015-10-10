structure GIRepositoryRepositoryClass :>
  G_I_REPOSITORY_REPOSITORY_CLASS
    where type 'a objectclass_t = 'a GObjectObjectClass.t
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a repository = unit
    type 'a objectclass_t = 'a GObjectObjectClass.t
    type 'a t = 'a repository objectclass_t
    fun toBase obj = obj
    structure C = GObjectObjectClass.C
  end
