structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class_t = 'a GIRepositoryRepositoryClass.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    local
      open PolyMLFFI
    in
      val getDefault_ =
        call
          (load_sym libgirepository "g_irepository_get_default")
          (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)

      val loadTypelib_ =
        call
          (load_sym libgirepository "g_irepository_load_typelib")
          (GObjectObjectClass.PolyML.PTR
            &&> GIRepositoryTypelibType.PolyML.PTR
            &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
            &&> GLibErrorRecord.PolyML.OUTOPTREF
            --> FFI.PolyML.String.RETPTR)

      val require_ =
        call
          (load_sym libgirepository "g_irepository_require")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            &&> FFI.PolyML.String.INPTR
            &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
            &&> GLibErrorRecord.PolyML.OUTOPTREF
            --> GIRepositoryTypelibType.PolyML.PTR)

      val getDependencies_ =
        call
          (load_sym libgirepository "g_irepository_get_dependencies")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.StringVector.RETOPTPTR)

      val getNInfos_ =
        call
          (load_sym libgirepository "g_irepository_get_n_infos")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.Int32.VAL)

      val getInfo_ =
        call
          (load_sym libgirepository "g_irepository_get_info")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR)

      val getSharedLibrary_ =
        call
          (load_sym libgirepository "g_irepository_get_shared_library")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.String.RETOPTPTR)

      val getCPrefix_ =
        call
          (load_sym libgirepository "g_irepository_get_c_prefix")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.String.RETPTR)
    end


    type 'a class_t = 'a GIRepositoryRepositoryClass.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    type typelibtype_t = GIRepositoryTypelibType.t


    val getDefault =
      fn () => (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()

    val loadTypelib =
      fn repository => fn typelib => fn flags =>
        (GObjectObjectClass.C.withPtr
          &&&> GIRepositoryTypelibType.C.withPtr
          &&&> GIRepositoryRepositoryLoadFlags.C.withVal
          &&&> GLibErrorRecord.C.handleError
          ---> FFI.String.fromPtr false)
        loadTypelib_
        (repository & typelib & flags & [])

    val require =
      fn repository => fn namespace_ => fn version => fn flags =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          &&&> FFI.String.withConstPtr
          &&&> GIRepositoryRepositoryLoadFlags.C.withVal
          &&&> GLibErrorRecord.C.handleError
          ---> GIRepositoryTypelibType.C.fromPtr)
        require_
        (repository & namespace_ & version & flags & [])

    val getDependencies =
      fn repository => fn namespace_ =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> FFI.StringVector.fromOptPtr true)
        getDependencies_
        (repository & namespace_)

    val getNInfos =
      fn repository => fn namespace_ =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> I)
        getNInfos_
        (repository & namespace_)

    val getInfo =
      fn repository => fn namespace_ => fn index =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          &&&> I
          ---> GIRepositoryBaseInfoClass.C.fromPtr true)
        getInfo_
        (repository & namespace_ & index)

    fun getSharedLibrary self namespace =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         ---> FFI.String.fromOptPtr false
      )
        getSharedLibrary_
        (self & namespace)

    val getCPrefix =
      fn repository => fn namespace_ =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> FFI.String.fromOptPtr false)
        getCPrefix_
        (repository & namespace_)
  end
