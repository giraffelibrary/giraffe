structure GioVfs :>
  GIO_VFS
    where type 'a class_t = 'a GioVfsClass.t
    where type 'a file_class_t = 'a GioFileClass.t =
  struct
    val getType_ = _import "g_vfs_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "g_vfs_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getLocal_ = _import "g_vfs_get_local" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFileForPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_vfs_get_file_for_path" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getFileForUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_vfs_get_file_for_uri" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val isActive_ = _import "g_vfs_is_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val parseName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_vfs_parse_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioVfsClass.t
    type 'a file_class_t = 'a GioFileClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioVfsClass.C.fromPtr false) getDefault_ ()
    fun getLocal () = (I ---> GioVfsClass.C.fromPtr false) getLocal_ ()
    fun getFileForPath self path = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) getFileForPath_ (self & path)
    fun getFileForUri self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) getFileForUri_ (self & uri)
    fun isActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isActive_ self
    fun parseName self parseName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) parseName_ (self & parseName)
  end
