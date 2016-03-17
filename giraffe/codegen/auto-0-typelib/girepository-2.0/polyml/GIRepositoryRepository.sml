structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class = 'a GIRepositoryRepositoryClass.class
    where type base_info_t = GIRepositoryBaseInfoRecord.t
    where type typelib_t = GIRepositoryTypelibRecord.t
    where type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgirepository "g_irepository_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val dump_ = call (load_sym libgirepository "g_irepository_dump") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val getDefault_ = call (load_sym libgirepository "g_irepository_get_default") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val prependSearchPath_ = call (load_sym libgirepository "g_irepository_prepend_search_path") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val findByErrorDomain_ = call (load_sym libgirepository "g_irepository_find_by_error_domain") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val findByName_ =
        call (load_sym libgirepository "g_irepository_find_by_name")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GIRepositoryBaseInfoRecord.PolyML.cPtr
          )
      val getCPrefix_ = call (load_sym libgirepository "g_irepository_get_c_prefix") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getInfo_ =
        call (load_sym libgirepository "g_irepository_get_info")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> GIRepositoryBaseInfoRecord.PolyML.cPtr
          )
      val getNInfos_ = call (load_sym libgirepository "g_irepository_get_n_infos") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Int32.PolyML.cVal)
      val getSharedLibrary_ = call (load_sym libgirepository "g_irepository_get_shared_library") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getTypelibPath_ = call (load_sym libgirepository "g_irepository_get_typelib_path") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getVersion_ = call (load_sym libgirepository "g_irepository_get_version") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val isRegistered_ =
        call (load_sym libgirepository "g_irepository_is_registered")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.Bool.PolyML.cVal
          )
      val loadTypelib_ =
        call (load_sym libgirepository "g_irepository_load_typelib")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GIRepositoryTypelibRecord.PolyML.cPtr
             &&> GIRepositoryRepositoryLoadFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val require_ =
        call (load_sym libgirepository "g_irepository_require")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GIRepositoryRepositoryLoadFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GIRepositoryTypelibRecord.PolyML.cPtr
          )
      val requirePrivate_ =
        call (load_sym libgirepository "g_irepository_require_private")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GIRepositoryRepositoryLoadFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GIRepositoryTypelibRecord.PolyML.cPtr
          )
    end
    type 'a class = 'a GIRepositoryRepositoryClass.class
    type base_info_t = GIRepositoryBaseInfoRecord.t
    type typelib_t = GIRepositoryTypelibRecord.t
    type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dump arg = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) dump_ (arg & [])
    fun getDefault () = (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()
    fun prependSearchPath directory = (Utf8.C.withPtr ---> I) prependSearchPath_ directory
    fun findByErrorDomain self domain = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) findByErrorDomain_ (self & domain)
    fun findByName self namespace name =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        findByName_
        (
          self
           & namespace
           & name
        )
    fun getCPrefix self namespace = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getCPrefix_ (self & namespace)
    fun getInfo self namespace index =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        getInfo_
        (
          self
           & namespace
           & index
        )
    fun getNInfos self namespace = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int32.C.fromVal) getNInfos_ (self & namespace)
    fun getSharedLibrary self namespace = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getSharedLibrary_ (self & namespace)
    fun getTypelibPath self namespace = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getTypelibPath_ (self & namespace)
    fun getVersion self namespace = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getVersion_ (self & namespace)
    fun isRegistered self namespace version =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
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
         &&&> GLibErrorRecord.handleError
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
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GIRepositoryRepositoryLoadFlags.C.withVal
         &&&> GLibErrorRecord.handleError
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
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GIRepositoryRepositoryLoadFlags.C.withVal
         &&&> GLibErrorRecord.handleError
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
