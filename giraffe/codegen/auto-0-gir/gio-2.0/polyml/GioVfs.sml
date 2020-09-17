structure GioVfs :>
  GIO_VFS
    where type 'a class = 'a GioVfsClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_vfs_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (getSymbol "g_vfs_get_default") (cVoid --> GioVfsClass.PolyML.cPtr)
      val getLocal_ = call (getSymbol "g_vfs_get_local") (cVoid --> GioVfsClass.PolyML.cPtr)
      val getFileForPath_ = call (getSymbol "g_vfs_get_file_for_path") (GioVfsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val getFileForUri_ = call (getSymbol "g_vfs_get_file_for_uri") (GioVfsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val getSupportedUriSchemes_ = call (getSymbol "g_vfs_get_supported_uri_schemes") (GioVfsClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val isActive_ = call (getSymbol "g_vfs_is_active") (GioVfsClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val parseName_ = call (getSymbol "g_vfs_parse_name") (GioVfsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val unregisterUriScheme_ = call (getSymbol "g_vfs_unregister_uri_scheme") (GioVfsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioVfsClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GioVfsClass.FFI.fromPtr false) getDefault_ ()
    fun getLocal () = (I ---> GioVfsClass.FFI.fromPtr false) getLocal_ ()
    fun getFileForPath self path = (GioVfsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioFileClass.FFI.fromPtr true) getFileForPath_ (self & path)
    fun getFileForUri self uri = (GioVfsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioFileClass.FFI.fromPtr true) getFileForUri_ (self & uri)
    fun getSupportedUriSchemes self = (GioVfsClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) getSupportedUriSchemes_ self before GioVfsClass.FFI.touchPtr self
    fun isActive self = (GioVfsClass.FFI.withPtr false ---> GBool.FFI.fromVal) isActive_ self
    fun parseName self parseName = (GioVfsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioFileClass.FFI.fromPtr true) parseName_ (self & parseName)
    fun unregisterUriScheme self scheme = (GioVfsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) unregisterUriScheme_ (self & scheme)
  end
