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
          (GIRepositoryTypelibType.PolyML.PTR --> FFI.PolyML.String.RETPTR)
    end

    type typelibtype_t = GIRepositoryTypelibType.t

    val getNamespace =
      fn typelib =>
        (GIRepositoryTypelibType.C.withPtr ---> FFI.String.fromPtr false)
          getNamespace_
          typelib
  end
