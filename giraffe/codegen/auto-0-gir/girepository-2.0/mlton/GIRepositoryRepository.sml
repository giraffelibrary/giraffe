structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class = 'a GIRepositoryRepositoryClass.class
    where type enum_info_t = GIRepositoryEnumInfoRecord.t
    where type base_info_t = GIRepositoryBaseInfoRecord.t
    where type typelib_t = GIRepositoryTypelibRecord.t
    where type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t =
  struct
    val getType_ = _import "g_irepository_get_type" : unit -> GObjectType.FFI.val_;
    val dump_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_irepository_dump" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefault_ = _import "g_irepository_get_default" : unit -> GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p;
    val prependLibraryPath_ = _import "mlton_g_irepository_prepend_library_path" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val prependSearchPath_ = _import "mlton_g_irepository_prepend_search_path" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val findByErrorDomain_ = fn x1 & x2 => (_import "g_irepository_find_by_error_domain" : GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p * GLibQuark.FFI.val_ -> GIRepositoryEnumInfoRecord.FFI.non_opt GIRepositoryEnumInfoRecord.FFI.p;) (x1, x2)
    val findByGtype_ = fn x1 & x2 => (_import "g_irepository_find_by_gtype" : GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p * GObjectType.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val findByName_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_irepository_find_by_name" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getCPrefix_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_irepository_get_c_prefix" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDependencies_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_irepository_get_dependencies" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getImmediateDependencies_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_irepository_get_immediate_dependencies" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getInfo_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_irepository_get_info" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getLoadedNamespaces_ = _import "g_irepository_get_loaded_namespaces" : GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getNInfos_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_irepository_get_n_infos" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getSharedLibrary_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_irepository_get_shared_library" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getTypelibPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_irepository_get_typelib_path" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getVersion_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_irepository_get_version" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val isRegistered_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_irepository_is_registered" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val loadTypelib_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_irepository_load_typelib" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * GIRepositoryTypelibRecord.FFI.non_opt GIRepositoryTypelibRecord.FFI.p
               * GIRepositoryRepositoryLoadFlags.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val require_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_g_irepository_require" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GIRepositoryRepositoryLoadFlags.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GIRepositoryTypelibRecord.FFI.non_opt GIRepositoryTypelibRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val requirePrivate_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8
         & x9 =>
          (
            _import "mlton_g_irepository_require_private" :
              GIRepositoryRepositoryClass.FFI.non_opt GIRepositoryRepositoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GIRepositoryRepositoryLoadFlags.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GIRepositoryTypelibRecord.FFI.non_opt GIRepositoryTypelibRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    type 'a class = 'a GIRepositoryRepositoryClass.class
    type enum_info_t = GIRepositoryEnumInfoRecord.t
    type base_info_t = GIRepositoryBaseInfoRecord.t
    type typelib_t = GIRepositoryTypelibRecord.t
    type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun dump arg = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> ignore) dump_ (arg & [])
    fun getDefault () = (I ---> GIRepositoryRepositoryClass.FFI.fromPtr false) getDefault_ ()
    fun prependLibraryPath directory = (Utf8.FFI.withPtr 0 ---> I) prependLibraryPath_ directory
    fun prependSearchPath directory = (Utf8.FFI.withPtr 0 ---> I) prependSearchPath_ directory
    fun findByErrorDomain self domain = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> GLibQuark.FFI.withVal ---> GIRepositoryEnumInfoRecord.FFI.fromPtr true) findByErrorDomain_ (self & domain)
    fun findByGtype self gtype = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) findByGtype_ (self & gtype)
    fun findByName self (namespace, name) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true
      )
        findByName_
        (
          self
           & namespace
           & name
        )
    fun getCPrefix self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getCPrefix_ (self & namespace) before GIRepositoryRepositoryClass.FFI.touchPtr self before Utf8.FFI.touchPtr namespace
    fun getDependencies self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr ~1) getDependencies_ (self & namespace)
    fun getImmediateDependencies self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr ~1) getImmediateDependencies_ (self & namespace)
    fun getInfo self (namespace, index) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true
      )
        getInfo_
        (
          self
           & namespace
           & index
        )
    fun getLoadedNamespaces self = (GIRepositoryRepositoryClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) getLoadedNamespaces_ self
    fun getNInfos self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GInt.FFI.fromVal) getNInfos_ (self & namespace)
    fun getSharedLibrary self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getSharedLibrary_ (self & namespace) before GIRepositoryRepositoryClass.FFI.touchPtr self before Utf8.FFI.touchPtr namespace
    fun getTypelibPath self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getTypelibPath_ (self & namespace) before GIRepositoryRepositoryClass.FFI.touchPtr self before Utf8.FFI.touchPtr namespace
    fun getVersion self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getVersion_ (self & namespace) before GIRepositoryRepositoryClass.FFI.touchPtr self before Utf8.FFI.touchPtr namespace
    fun isRegistered self (namespace, version) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> GBool.FFI.fromVal
      )
        isRegistered_
        (
          self
           & namespace
           & version
        )
    fun loadTypelib self (typelib, flags) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> GIRepositoryTypelibRecord.FFI.withPtr false
         &&&> GIRepositoryRepositoryLoadFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 0
      )
        loadTypelib_
        (
          self
           & typelib
           & flags
           & []
        )
       before GIRepositoryRepositoryClass.FFI.touchPtr self
       before GIRepositoryTypelibRecord.FFI.touchPtr typelib
    fun require
      self
      (
        namespace,
        version,
        flags
      ) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GIRepositoryRepositoryLoadFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GIRepositoryTypelibRecord.FFI.fromPtr false
      )
        require_
        (
          self
           & namespace
           & version
           & flags
           & []
        )
       before GIRepositoryRepositoryClass.FFI.touchPtr self
       before Utf8.FFI.touchPtr namespace
       before Utf8.FFI.touchOptPtr version
    fun requirePrivate
      self
      (
        typelibDir,
        namespace,
        version,
        flags
      ) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GIRepositoryRepositoryLoadFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GIRepositoryTypelibRecord.FFI.fromPtr false
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
       before GIRepositoryRepositoryClass.FFI.touchPtr self
       before Utf8.FFI.touchPtr typelibDir
       before Utf8.FFI.touchPtr namespace
       before Utf8.FFI.touchOptPtr version
  end
