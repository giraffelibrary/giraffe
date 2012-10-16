structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class_t = 'a GIRepositoryRepositoryClass.t
    where type baseinforecord_t = GIRepositoryBaseInfoRecord.t
    where type typelibrecord_t = GIRepositoryTypelibRecord.t
    where type repositoryloadflags_t = GIRepositoryRepositoryLoadFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgirepository "g_irepository_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val dump_ = call (load_sym libgirepository "g_irepository_dump") (FFI.PolyML.String.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.Bool.VAL)
      val getDefault_ = call (load_sym libgirepository "g_irepository_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val prependSearchPath_ = call (load_sym libgirepository "g_irepository_prepend_search_path") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val findByErrorDomain_ = call (load_sym libgirepository "g_irepository_find_by_error_domain") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val findByName_ =
        call (load_sym libgirepository "g_irepository_find_by_name")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> GIRepositoryBaseInfoRecord.PolyML.PTR
          )
      val getCPrefix_ = call (load_sym libgirepository "g_irepository_get_c_prefix") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val getInfo_ =
        call (load_sym libgirepository "g_irepository_get_info")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             --> GIRepositoryBaseInfoRecord.PolyML.PTR
          )
      val getNInfos_ = call (load_sym libgirepository "g_irepository_get_n_infos") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val getSharedLibrary_ = call (load_sym libgirepository "g_irepository_get_shared_library") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val getTypelibPath_ = call (load_sym libgirepository "g_irepository_get_typelib_path") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val getVersion_ = call (load_sym libgirepository "g_irepository_get_version") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val isRegistered_ =
        call (load_sym libgirepository "g_irepository_is_registered")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INOPTPTR
             --> FFI.PolyML.Bool.VAL
          )
      val loadTypelib_ =
        call (load_sym libgirepository "g_irepository_load_typelib")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GIRepositoryTypelibRecord.PolyML.PTR
             &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.String.RETPTR
          )
      val require_ =
        call (load_sym libgirepository "g_irepository_require")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GIRepositoryTypelibRecord.PolyML.PTR
          )
      val requirePrivate_ =
        call (load_sym libgirepository "g_irepository_require_private")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GIRepositoryTypelibRecord.PolyML.PTR
          )
    end
    type 'a class_t = 'a GIRepositoryRepositoryClass.t
    type baseinforecord_t = GIRepositoryBaseInfoRecord.t
    type typelibrecord_t = GIRepositoryTypelibRecord.t
    type repositoryloadflags_t = GIRepositoryRepositoryLoadFlags.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dump arg = (FFI.String.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.fromVal) dump_ (arg & [])
    fun getDefault () = (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()
    fun prependSearchPath directory = (FFI.String.withConstPtr ---> I) prependSearchPath_ directory
    fun findByErrorDomain self domain = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) findByErrorDomain_ (self & domain)
    fun findByName self namespace name =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        findByName_
        (
          self
           & namespace
           & name
        )
    fun getCPrefix self namespace = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) getCPrefix_ (self & namespace)
    fun getInfo self namespace index =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        getInfo_
        (
          self
           & namespace
           & index
        )
    fun getNInfos self namespace = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Int32.fromVal) getNInfos_ (self & namespace)
    fun getSharedLibrary self namespace = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) getSharedLibrary_ (self & namespace)
    fun getTypelibPath self namespace = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) getTypelibPath_ (self & namespace)
    fun getVersion self namespace = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) getVersion_ (self & namespace)
    fun isRegistered self namespace version =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstOptPtr
         ---> FFI.Bool.fromVal
      )
        isRegistered_
        (
          self
           & namespace
           & version
        )
    fun loadTypelib self typelib flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GIRepositoryTypelibRecord.C.withPtr
         &&&> GIRepositoryRepositoryLoadFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.fromPtr false
      )
        loadTypelib_
        (
          self
           & typelib
           & flags
           & []
        )
    fun require self namespace version flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstOptPtr
         &&&> GIRepositoryRepositoryLoadFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GIRepositoryTypelibRecord.C.fromPtr false
      )
        require_
        (
          self
           & namespace
           & version
           & flags
           & []
        )
    fun requirePrivate self typelibDir namespace version flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstOptPtr
         &&&> GIRepositoryRepositoryLoadFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GIRepositoryTypelibRecord.C.fromPtr false
      )
        requirePrivate_
        (
          self
           & typelibDir
           & namespace
           & version
           & flags
           & []
        )
  end
