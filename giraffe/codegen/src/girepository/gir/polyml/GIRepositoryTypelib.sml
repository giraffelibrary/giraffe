structure GIRepositoryTypelib :>
  G_I_REPOSITORY_TYPELIB
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    type typelibtype_t = GIRepositoryTypelibType.t

    fun getNamespace (ref {namespace, ...}) = #name namespace
  end
