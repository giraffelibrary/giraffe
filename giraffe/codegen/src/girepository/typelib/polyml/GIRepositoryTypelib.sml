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
          (GIRepositoryTypelibType.PolyML.PTR --> FFI.String.PolyML.RETPTR)
    end

    type typelibtype_t = GIRepositoryTypelibType.t

    val getNamespace =
      fn typelib =>
        (GIRepositoryTypelibType.C.withPtr ---> FFI.String.C.fromPtr false)
          getNamespace_
          typelib
  end
