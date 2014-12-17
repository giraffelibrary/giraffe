structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class_t = 'a GIRepositoryRepositoryClass.t
    where type enuminforecord_t = GIRepositoryEnumInfoRecord.t
    where type baseinforecord_t = GIRepositoryBaseInfoRecord.t
    where type typelibrecord_t = GIRepositoryTypelibRecord.t
    where type repositoryloadflags_t = GIRepositoryRepositoryLoadFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgirepository "g_irepository_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val dump_ = call (load_sym libgirepository "g_irepository_dump") (FFI.String.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.Bool.PolyML.VAL)
      val getDefault_ = call (load_sym libgirepository "g_irepository_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val prependSearchPath_ = call (load_sym libgirepository "g_irepository_prepend_search_path") (FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val findByErrorDomain_ = call (load_sym libgirepository "g_irepository_find_by_error_domain") (GObjectObjectClass.PolyML.PTR &&> GLibQuark.PolyML.VAL --> GIRepositoryEnumInfoRecord.PolyML.PTR)
      val findByName_ =
        call (load_sym libgirepository "g_irepository_find_by_name")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             --> GIRepositoryBaseInfoRecord.PolyML.PTR
          )
      val getCPrefix_ = call (load_sym libgirepository "g_irepository_get_c_prefix") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val getInfo_ =
        call (load_sym libgirepository "g_irepository_get_info")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int.PolyML.VAL
             --> GIRepositoryBaseInfoRecord.PolyML.PTR
          )
      val getNInfos_ = call (load_sym libgirepository "g_irepository_get_n_infos") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Int.PolyML.VAL)
      val getSharedLibrary_ = call (load_sym libgirepository "g_irepository_get_shared_library") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val getTypelibPath_ = call (load_sym libgirepository "g_irepository_get_typelib_path") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val getVersion_ = call (load_sym libgirepository "g_irepository_get_version") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val isRegistered_ =
        call (load_sym libgirepository "g_irepository_is_registered")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INOPTPTR
             --> FFI.Bool.PolyML.VAL
          )
      val loadTypelib_ =
        call (load_sym libgirepository "g_irepository_load_typelib")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GIRepositoryTypelibRecord.PolyML.PTR
             &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.String.PolyML.RETPTR
          )
      val require_ =
        call (load_sym libgirepository "g_irepository_require")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GIRepositoryTypelibRecord.PolyML.PTR
          )
      val requirePrivate_ =
        call (load_sym libgirepository "g_irepository_require_private")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GIRepositoryTypelibRecord.PolyML.PTR
          )
    end
    type 'a class_t = 'a GIRepositoryRepositoryClass.t
    type enuminforecord_t = GIRepositoryEnumInfoRecord.t
    type baseinforecord_t = GIRepositoryBaseInfoRecord.t
    type typelibrecord_t = GIRepositoryTypelibRecord.t
    type repositoryloadflags_t = GIRepositoryRepositoryLoadFlags.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dump arg = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) dump_ (arg & [])
    fun getDefault () = (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()
    fun prependSearchPath directory = (FFI.String.C.withConstPtr ---> I) prependSearchPath_ directory
    fun findByErrorDomain self domain = (GObjectObjectClass.C.withPtr &&&> GLibQuark.C.withVal ---> GIRepositoryEnumInfoRecord.C.fromPtr true) findByErrorDomain_ (self & domain)
    fun findByName self namespace name =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        findByName_
        (
          self
           & namespace
           & name
        )
    fun getCPrefix self namespace = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getCPrefix_ (self & namespace)
    fun getInfo self namespace index =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        getInfo_
        (
          self
           & namespace
           & index
        )
    fun getNInfos self namespace = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int.C.fromVal) getNInfos_ (self & namespace)
    fun getSharedLibrary self namespace = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getSharedLibrary_ (self & namespace)
    fun getTypelibPath self namespace = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getTypelibPath_ (self & namespace)
    fun getVersion self namespace = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getVersion_ (self & namespace)
    fun isRegistered self namespace version =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
         ---> FFI.Bool.C.fromVal
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
         ---> FFI.String.C.fromPtr false
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
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
