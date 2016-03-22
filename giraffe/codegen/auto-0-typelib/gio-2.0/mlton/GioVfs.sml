structure GioVfs :>
  GIO_VFS
    where type 'a class = 'a GioVfsClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    val getType_ = _import "g_vfs_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "g_vfs_get_default" : unit -> GioVfsClass.C.notnull GioVfsClass.C.p;
    val getLocal_ = _import "g_vfs_get_local" : unit -> GioVfsClass.C.notnull GioVfsClass.C.p;
    val getFileForPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_vfs_get_file_for_path" :
              GioVfsClass.C.notnull GioVfsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioFileClass.C.notnull GioFileClass.C.p;
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
              GioVfsClass.C.notnull GioVfsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioFileClass.C.notnull GioFileClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val isActive_ = _import "g_vfs_is_active" : GioVfsClass.C.notnull GioVfsClass.C.p -> FFI.Bool.C.val_;
    val parseName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_vfs_parse_name" :
              GioVfsClass.C.notnull GioVfsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioFileClass.C.notnull GioFileClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioVfsClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioVfsClass.C.fromPtr false) getDefault_ ()
    fun getLocal () = (I ---> GioVfsClass.C.fromPtr false) getLocal_ ()
    fun getFileForPath self path = (GioVfsClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) getFileForPath_ (self & path)
    fun getFileForUri self uri = (GioVfsClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) getFileForUri_ (self & uri)
    fun isActive self = (GioVfsClass.C.withPtr ---> FFI.Bool.C.fromVal) isActive_ self
    fun parseName self parseName = (GioVfsClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) parseName_ (self & parseName)
  end
