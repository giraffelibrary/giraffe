structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class_t = 'a GIRepositoryRepositoryClass.t
    where type base_info_record_t = GIRepositoryBaseInfoRecord.t
    where type typelib_record_t = GIRepositoryTypelibRecord.t
    where type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgirepository "g_irepository_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val dump_ = call (load_sym libgirepository "g_irepository_dump") (Utf8.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.Bool.PolyML.VAL)
      val getDefault_ = call (load_sym libgirepository "g_irepository_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val prependSearchPath_ = call (load_sym libgirepository "g_irepository_prepend_search_path") (Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val findByErrorDomain_ = call (load_sym libgirepository "g_irepository_find_by_error_domain") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val findByName_ =
        call (load_sym libgirepository "g_irepository_find_by_name")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> Utf8.PolyML.INPTR
             --> GIRepositoryBaseInfoRecord.PolyML.PTR
          )
      val getCPrefix_ = call (load_sym libgirepository "g_irepository_get_c_prefix") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> Utf8.PolyML.RETPTR)
      val getInfo_ =
        call (load_sym libgirepository "g_irepository_get_info")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             --> GIRepositoryBaseInfoRecord.PolyML.PTR
          )
      val getNInfos_ = call (load_sym libgirepository "g_irepository_get_n_infos") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.Int32.PolyML.VAL)
      val getSharedLibrary_ = call (load_sym libgirepository "g_irepository_get_shared_library") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> Utf8.PolyML.RETPTR)
      val getTypelibPath_ = call (load_sym libgirepository "g_irepository_get_typelib_path") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> Utf8.PolyML.RETPTR)
      val getVersion_ = call (load_sym libgirepository "g_irepository_get_version") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> Utf8.PolyML.RETPTR)
      val isRegistered_ =
        call (load_sym libgirepository "g_irepository_is_registered")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> Utf8.PolyML.INOPTPTR
             --> FFI.Bool.PolyML.VAL
          )
      val loadTypelib_ =
        call (load_sym libgirepository "g_irepository_load_typelib")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GIRepositoryTypelibRecord.PolyML.PTR
             &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> Utf8.PolyML.RETPTR
          )
      val require_ =
        call (load_sym libgirepository "g_irepository_require")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> Utf8.PolyML.INOPTPTR
             &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GIRepositoryTypelibRecord.PolyML.PTR
          )
      val requirePrivate_ =
        call (load_sym libgirepository "g_irepository_require_private")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> Utf8.PolyML.INPTR
             &&> Utf8.PolyML.INOPTPTR
             &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GIRepositoryTypelibRecord.PolyML.PTR
          )
    end
    type 'a class_t = 'a GIRepositoryRepositoryClass.t
    type base_info_record_t = GIRepositoryBaseInfoRecord.t
    type typelib_record_t = GIRepositoryTypelibRecord.t
    type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dump arg = (Utf8.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) dump_ (arg & [])
    fun getDefault () = (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()
    fun prependSearchPath directory = (Utf8.C.withConstPtr ---> I) prependSearchPath_ directory
    fun findByErrorDomain self domain = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) findByErrorDomain_ (self & domain)
    fun findByName self namespace name =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> Utf8.C.withConstPtr
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        findByName_
        (
          self
           & namespace
           & name
        )
    fun getCPrefix self namespace = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> Utf8.C.fromPtr false) getCPrefix_ (self & namespace)
    fun getInfo self namespace index =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        getInfo_
        (
          self
           & namespace
           & index
        )
    fun getNInfos self namespace = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> FFI.Int32.C.fromVal) getNInfos_ (self & namespace)
    fun getSharedLibrary self namespace = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> Utf8.C.fromPtr false) getSharedLibrary_ (self & namespace)
    fun getTypelibPath self namespace = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> Utf8.C.fromPtr false) getTypelibPath_ (self & namespace)
    fun getVersion self namespace = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> Utf8.C.fromPtr false) getVersion_ (self & namespace)
    fun isRegistered self namespace version =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> Utf8.C.withConstOptPtr
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
         ---> Utf8.C.fromPtr false
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
         &&&> Utf8.C.withConstPtr
         &&&> Utf8.C.withConstOptPtr
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
         &&&> Utf8.C.withConstPtr
         &&&> Utf8.C.withConstPtr
         &&&> Utf8.C.withConstOptPtr
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
