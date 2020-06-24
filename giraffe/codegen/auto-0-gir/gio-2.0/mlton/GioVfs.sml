structure GioVfs :>
  GIO_VFS
    where type 'a class = 'a GioVfsClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    val getType_ = _import "g_vfs_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "g_vfs_get_default" : unit -> GioVfsClass.FFI.non_opt GioVfsClass.FFI.p;
    val getLocal_ = _import "g_vfs_get_local" : unit -> GioVfsClass.FFI.non_opt GioVfsClass.FFI.p;
    val getFileForPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_vfs_get_file_for_path" :
              GioVfsClass.FFI.non_opt GioVfsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
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
              GioVfsClass.FFI.non_opt GioVfsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getSupportedUriSchemes_ = _import "g_vfs_get_supported_uri_schemes" : GioVfsClass.FFI.non_opt GioVfsClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val isActive_ = _import "g_vfs_is_active" : GioVfsClass.FFI.non_opt GioVfsClass.FFI.p -> GBool.FFI.val_;
    val parseName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_vfs_parse_name" :
              GioVfsClass.FFI.non_opt GioVfsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val unregisterUriScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_vfs_unregister_uri_scheme" :
              GioVfsClass.FFI.non_opt GioVfsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioVfsClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GioVfsClass.FFI.fromPtr false) getDefault_ ()
    fun getLocal () = (I ---> GioVfsClass.FFI.fromPtr false) getLocal_ ()
    fun getFileForPath self path = (GioVfsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getFileForPath_ (self & path)
    fun getFileForUri self uri = (GioVfsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getFileForUri_ (self & uri)
    fun getSupportedUriSchemes self = (GioVfsClass.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 0) getSupportedUriSchemes_ self
    fun isActive self = (GioVfsClass.FFI.withPtr ---> GBool.FFI.fromVal) isActive_ self
    fun parseName self parseName = (GioVfsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) parseName_ (self & parseName)
    fun unregisterUriScheme self scheme = (GioVfsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) unregisterUriScheme_ (self & scheme)
  end
