structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class_t = 'a GIRepositoryRepositoryClass.t
    where type base_info_record_t = GIRepositoryBaseInfoRecord.t
    where type typelib_record_t = GIRepositoryTypelibRecord.t
    where type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t =
  struct
    val getType_ = _import "g_irepository_get_type" : unit -> GObjectType.C.val_;
    val dump_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_irepository_dump" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefault_ = _import "g_irepository_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val prependSearchPath_ = _import "mlton_g_irepository_prepend_search_path" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> unit;
    val findByErrorDomain_ = fn x1 & x2 => (_import "g_irepository_find_by_error_domain" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val findByName_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_irepository_find_by_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GIRepositoryTypelibRecord.C.notnull GIRepositoryTypelibRecord.C.p
               * GIRepositoryRepositoryLoadFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
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
    type 'a class_t = 'a GIRepositoryRepositoryClass.t
    type base_info_record_t = GIRepositoryBaseInfoRecord.t
    type typelib_record_t = GIRepositoryTypelibRecord.t
    type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dump arg = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) dump_ (arg & [])
    fun getDefault () = (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()
    fun prependSearchPath directory = (FFI.String.C.withConstPtr ---> I) prependSearchPath_ directory
    fun findByErrorDomain self domain = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) findByErrorDomain_ (self & domain)
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
         &&&> FFI.Int32.C.withVal
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        getInfo_
        (
          self
           & namespace
           & index
        )
    fun getNInfos self namespace = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int32.C.fromVal) getNInfos_ (self & namespace)
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
