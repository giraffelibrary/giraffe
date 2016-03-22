structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class = 'a GIRepositoryRepositoryClass.class
    where type base_info_t = GIRepositoryBaseInfoRecord.t
    where type typelib_t = GIRepositoryTypelibRecord.t
    where type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t =
  struct
    val getType_ = _import "g_irepository_get_type" : unit -> GObjectType.C.val_;
    val dump_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_irepository_dump" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefault_ = _import "g_irepository_get_default" : unit -> GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p;
    val prependSearchPath_ = _import "mlton_g_irepository_prepend_search_path" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> unit;
    val findByErrorDomain_ = fn x1 & x2 => (_import "g_irepository_find_by_error_domain" : GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p * FFI.UInt32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val findByName_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_irepository_find_by_name" :
              GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
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
              GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
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
              GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getNInfos_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_irepository_get_n_infos" :
              GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Int32.C.val_;
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
              GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
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
              GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
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
              GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
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
              GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> FFI.Bool.C.val_;
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
              GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p
               * GIRepositoryTypelibRecord.C.notnull GIRepositoryTypelibRecord.C.p
               * GIRepositoryRepositoryLoadFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> Utf8.C.notnull Utf8.C.out_p;
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
              GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GIRepositoryRepositoryLoadFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GIRepositoryTypelibRecord.C.notnull GIRepositoryTypelibRecord.C.p;
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
              GIRepositoryRepositoryClass.C.notnull GIRepositoryRepositoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GIRepositoryRepositoryLoadFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GIRepositoryTypelibRecord.C.notnull GIRepositoryTypelibRecord.C.p;
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
    type base_info_t = GIRepositoryBaseInfoRecord.t
    type typelib_t = GIRepositoryTypelibRecord.t
    type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dump arg = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) dump_ (arg & [])
    fun getDefault () = (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()
    fun prependSearchPath directory = (Utf8.C.withPtr ---> I) prependSearchPath_ directory
    fun findByErrorDomain self domain = (GIRepositoryRepositoryClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) findByErrorDomain_ (self & domain)
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
         &&&> FFI.Int32.C.withVal
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        getInfo_
        (
          self
           & namespace
           & index
        )
    fun getNInfos self namespace = (GIRepositoryRepositoryClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int32.C.fromVal) getNInfos_ (self & namespace)
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
