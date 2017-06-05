structure GIRepositoryTypelib :>
  G_I_REPOSITORY_TYPELIB
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    local
      open PolyMLFFI
    in
      val getNamespace_ =
        call
          (load_sym libgirepository "g_typelib_get_namespace")
          (GIRepositoryTypelibType.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end

    type typelibtype_t = GIRepositoryTypelibType.t

    val getNamespace =
      fn typelib =>
        (GIRepositoryTypelibType.FFI.withPtr ---> Utf8.FFI.fromPtr 0)
          getNamespace_
          typelib
  end
