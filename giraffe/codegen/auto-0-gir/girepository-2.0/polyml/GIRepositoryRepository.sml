structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class = 'a GIRepositoryRepositoryClass.class
    where type enum_info_t = GIRepositoryEnumInfoRecord.t
    where type base_info_t = GIRepositoryBaseInfoRecord.t
    where type typelib_t = GIRepositoryTypelibRecord.t
    where type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgirepository "g_irepository_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val dump_ = call (load_sym libgirepository "g_irepository_dump") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val getDefault_ = call (load_sym libgirepository "g_irepository_get_default") (FFI.PolyML.cVoid --> GIRepositoryRepositoryClass.PolyML.cPtr)
      val prependSearchPath_ = call (load_sym libgirepository "g_irepository_prepend_search_path") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val findByErrorDomain_ = call (load_sym libgirepository "g_irepository_find_by_error_domain") (GIRepositoryRepositoryClass.PolyML.cPtr &&> GLibQuark.PolyML.cVal --> GIRepositoryEnumInfoRecord.PolyML.cPtr)
      val findByName_ =
        call (load_sym libgirepository "g_irepository_find_by_name")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GIRepositoryBaseInfoRecord.PolyML.cPtr
          )
      val getCPrefix_ = call (load_sym libgirepository "g_irepository_get_c_prefix") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getInfo_ =
        call (load_sym libgirepository "g_irepository_get_info")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> GIRepositoryBaseInfoRecord.PolyML.cPtr
          )
      val getNInfos_ = call (load_sym libgirepository "g_irepository_get_n_infos") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val getSharedLibrary_ = call (load_sym libgirepository "g_irepository_get_shared_library") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getTypelibPath_ = call (load_sym libgirepository "g_irepository_get_typelib_path") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getVersion_ = call (load_sym libgirepository "g_irepository_get_version") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val isRegistered_ =
        call (load_sym libgirepository "g_irepository_is_registered")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.Bool.PolyML.cVal
          )
      val loadTypelib_ =
        call (load_sym libgirepository "g_irepository_load_typelib")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> GIRepositoryTypelibRecord.PolyML.cPtr
             &&> GIRepositoryRepositoryLoadFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val require_ =
        call (load_sym libgirepository "g_irepository_require")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GIRepositoryRepositoryLoadFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GIRepositoryTypelibRecord.PolyML.cPtr
          )
      val requirePrivate_ =
        call (load_sym libgirepository "g_irepository_require_private")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GIRepositoryRepositoryLoadFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GIRepositoryTypelibRecord.PolyML.cPtr
          )
    end
    type 'a class = 'a GIRepositoryRepositoryClass.class
    type enum_info_t = GIRepositoryEnumInfoRecord.t
    type base_info_t = GIRepositoryBaseInfoRecord.t
    type typelib_t = GIRepositoryTypelibRecord.t
    type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dump arg = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) dump_ (arg & [])
    fun getDefault () = (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()
    fun prependSearchPath directory = (Utf8.C.withPtr ---> I) prependSearchPath_ directory
    fun findByErrorDomain self domain = (GIRepositoryRepositoryClass.C.withPtr &&&> GLibQuark.C.withVal ---> GIRepositoryEnumInfoRecord.C.fromPtr true) findByErrorDomain_ (self & domain)
    fun findByName self namespace name =
      (
        GIRepositoryRepositoryClass.C.withPtr
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
    fun getCPrefix self namespace = (GIRepositoryRepositoryClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getCPrefix_ (self & namespace)
    fun getInfo self namespace index =
      (
        GIRepositoryRepositoryClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        getInfo_
        (
          self
           & namespace
           & index
        )
    fun getNInfos self namespace = (GIRepositoryRepositoryClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int.C.fromVal) getNInfos_ (self & namespace)
    fun getSharedLibrary self namespace = (GIRepositoryRepositoryClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getSharedLibrary_ (self & namespace)
    fun getTypelibPath self namespace = (GIRepositoryRepositoryClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getTypelibPath_ (self & namespace)
    fun getVersion self namespace = (GIRepositoryRepositoryClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getVersion_ (self & namespace)
    fun isRegistered self namespace version =
      (
        GIRepositoryRepositoryClass.C.withPtr
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
        GIRepositoryRepositoryClass.C.withPtr
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
        GIRepositoryRepositoryClass.C.withPtr
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
        GIRepositoryRepositoryClass.C.withPtr
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
