structure GioVfs :>
  GIO_VFS
    where type 'a class = 'a GioVfsClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_vfs_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (load_sym libgio "g_vfs_get_default") (PolyMLFFI.cVoid --> GioVfsClass.PolyML.cPtr)
      val getLocal_ = call (load_sym libgio "g_vfs_get_local") (PolyMLFFI.cVoid --> GioVfsClass.PolyML.cPtr)
      val getFileForPath_ = call (load_sym libgio "g_vfs_get_file_for_path") (GioVfsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val getFileForUri_ = call (load_sym libgio "g_vfs_get_file_for_uri") (GioVfsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val isActive_ = call (load_sym libgio "g_vfs_is_active") (GioVfsClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val parseName_ = call (load_sym libgio "g_vfs_parse_name") (GioVfsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
    end
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
