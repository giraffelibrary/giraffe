structure GIRepositoryTypelibType :> G_I_REPOSITORY_TYPELIB_TYPE =
  struct
    structure Record = PointerRecord (val name = "GIRepositoryTypelibType")
    open Record
  end
