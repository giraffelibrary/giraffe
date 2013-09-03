structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class_t = 'a GIRepositoryRepositoryClass.t
    where type baseinforecord_t = GIRepositoryBaseInfoRecord.t
    where type typelibrecord_t = GIRepositoryTypelibRecord.t
    where type repositoryloadflags_t = GIRepositoryRepositoryLoadFlags.t =
  struct
    val getType_ = _import "g_irepository_get_type" : unit -> GObjectType.C.val_;
    val dump_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_irepository_dump" :
              cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefault_ = _import "g_irepository_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val prependSearchPath_ = _import "mlton_g_irepository_prepend_search_path" : cstring * unit CPointer.t -> unit;
    val findByErrorDomain_ = fn x1 & x2 => (_import "g_irepository_find_by_error_domain" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val findByName_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_irepository_find_by_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
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
               * cstring
               * unit CPointer.t
               -> FFI.String.notnull FFI.String.out_p;
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
               * cstring
               * unit CPointer.t
               * FFI.Int32.val_
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
               * cstring
               * unit CPointer.t
               -> FFI.Int32.val_;
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
               * cstring
               * unit CPointer.t
               -> FFI.String.notnull FFI.String.out_p;
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
               * cstring
               * unit CPointer.t
               -> FFI.String.notnull FFI.String.out_p;
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
               * cstring
               * unit CPointer.t
               -> FFI.String.notnull FFI.String.out_p;
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
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> FFI.Bool.val_;
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
               -> FFI.String.notnull FFI.String.out_p;
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
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
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
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
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
    type baseinforecord_t = GIRepositoryBaseInfoRecord.t
    type typelibrecord_t = GIRepositoryTypelibRecord.t
    type repositoryloadflags_t = GIRepositoryRepositoryLoadFlags.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dump arg = (FFI.String.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.fromVal) dump_ (arg & [])
    fun getDefault () = (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()
    fun prependSearchPath directory = (FFI.String.withConstPtr ---> I) prependSearchPath_ directory
    fun findByErrorDomain self domain = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) findByErrorDomain_ (self & domain)
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
