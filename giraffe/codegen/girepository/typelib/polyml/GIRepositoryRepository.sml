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
            --> FFI.String.PolyML.RETPTR)

      val require_ =
        call
          (load_sym libgirepository "g_irepository_require")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.String.PolyML.INPTR
            &&> FFI.String.PolyML.INPTR
            &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
            &&> GLibErrorRecord.PolyML.OUTOPTREF
            --> GIRepositoryTypelibType.PolyML.PTR)

      val getDependencies_ =
        call
          (load_sym libgirepository "g_irepository_get_dependencies")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.String.PolyML.INPTR
            --> FFI.StringVector.PolyML.RETOPTPTR)

      val getNInfos_ =
        call
          (load_sym libgirepository "g_irepository_get_n_infos")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.String.PolyML.INPTR
            --> FFI.Int32.PolyML.VAL)

      val getInfo_ =
        call
          (load_sym libgirepository "g_irepository_get_info")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.String.PolyML.INPTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR)

      val getSharedLibrary_ =
        call
          (load_sym libgirepository "g_irepository_get_shared_library")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.String.PolyML.INPTR
            --> FFI.String.PolyML.RETOPTPTR)

      val getCPrefix_ =
        call
          (load_sym libgirepository "g_irepository_get_c_prefix")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.String.PolyML.INPTR
            --> FFI.String.PolyML.RETPTR)
    end


    type 'a class_t = 'a GIRepositoryRepositoryClass.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    type typelibtype_t = GIRepositoryTypelibType.t


    val getDefault =
      fn () => (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()

    fun loadTypelib repository typelib flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GIRepositoryTypelibType.C.withPtr
         &&&> GIRepositoryRepositoryLoadFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr false
      )
        loadTypelib_
        (repository & typelib & flags & [])

    fun require repository namespace_ version flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GIRepositoryRepositoryLoadFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GIRepositoryTypelibType.C.fromPtr false
      )
        require_
        (repository & namespace_ & version & flags & [])

    fun getDependencies repository namespace_ =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         ---> FFI.StringVector.C.fromOptPtr true
      )
        getDependencies_
        (repository & namespace_)

    fun getNInfos repository namespace_ =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         ---> FFI.Int32.C.fromVal
      )
        getNInfos_
        (repository & namespace_)

    fun getInfo repository namespace_ index =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         ---> GIRepositoryBaseInfoClass.C.fromPtr true
      )
        getInfo_
        (repository & namespace_ & index)

    fun getSharedLibrary self namespace =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         ---> FFI.String.C.fromOptPtr false
      )
        getSharedLibrary_
        (self & namespace)

    fun getCPrefix repository namespace_ =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         ---> FFI.String.C.fromOptPtr false
      )
        getCPrefix_
        (repository & namespace_)
  end
