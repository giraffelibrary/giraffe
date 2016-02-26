structure GioVfs :>
  GIO_VFS
    where type 'a class_t = 'a GioVfsClass.t
    where type 'a file_class_t = 'a GioFileClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_vfs_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (load_sym libgio "g_vfs_get_default") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getLocal_ = call (load_sym libgio "g_vfs_get_local") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getFileForPath_ = call (load_sym libgio "g_vfs_get_file_for_path") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getFileForUri_ = call (load_sym libgio "g_vfs_get_file_for_uri") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val isActive_ = call (load_sym libgio "g_vfs_is_active") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val parseName_ = call (load_sym libgio "g_vfs_parse_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GioVfsClass.t
    type 'a file_class_t = 'a GioFileClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioVfsClass.C.fromPtr false) getDefault_ ()
    fun getLocal () = (I ---> GioVfsClass.C.fromPtr false) getLocal_ ()
    fun getFileForPath self path = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) getFileForPath_ (self & path)
    fun getFileForUri self uri = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) getFileForUri_ (self & uri)
    fun isActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isActive_ self
    fun parseName self parseName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) parseName_ (self & parseName)
  end
