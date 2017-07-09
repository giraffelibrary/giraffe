structure GioVfs :>
  GIO_VFS
    where type 'a class = 'a GioVfsClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_vfs_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (getSymbol "g_vfs_get_default") (cVoid --> GioVfsClass.PolyML.cPtr)
      val getLocal_ = call (getSymbol "g_vfs_get_local") (cVoid --> GioVfsClass.PolyML.cPtr)
      val getFileForPath_ = call (getSymbol "g_vfs_get_file_for_path") (GioVfsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val getFileForUri_ = call (getSymbol "g_vfs_get_file_for_uri") (GioVfsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val getSupportedUriSchemes_ = call (getSymbol "g_vfs_get_supported_uri_schemes") (GioVfsClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val isActive_ = call (getSymbol "g_vfs_is_active") (GioVfsClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val parseName_ = call (getSymbol "g_vfs_parse_name") (GioVfsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
    end
    type 'a class = 'a GioVfsClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GioVfsClass.FFI.fromPtr false) getDefault_ ()
    fun getLocal () = (I ---> GioVfsClass.FFI.fromPtr false) getLocal_ ()
    fun getFileForPath self path = (GioVfsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getFileForPath_ (self & path)
    fun getFileForUri self uri = (GioVfsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getFileForUri_ (self & uri)
    fun getSupportedUriSchemes self = (GioVfsClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getSupportedUriSchemes_ self
    fun isActive self = (GioVfsClass.FFI.withPtr ---> GBool.FFI.fromVal) isActive_ self
    fun parseName self parseName = (GioVfsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) parseName_ (self & parseName)
  end
