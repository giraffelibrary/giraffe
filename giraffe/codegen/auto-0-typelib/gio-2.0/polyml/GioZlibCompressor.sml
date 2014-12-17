structure GioZlibCompressor :>
  GIO_ZLIB_COMPRESSOR
    where type 'a class_t = 'a GioZlibCompressorClass.t
    where type 'a converterclass_t = 'a GioConverterClass.t
    where type 'a fileinfoclass_t = 'a GioFileInfoClass.t
    where type zlibcompressorformat_t = GioZlibCompressorFormat.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_zlib_compressor_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_zlib_compressor_new") (GioZlibCompressorFormat.PolyML.VAL &&> FFI.Int32.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getFileInfo_ = call (load_sym libgio "g_zlib_compressor_get_file_info") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setFileInfo_ = call (load_sym libgio "g_zlib_compressor_set_file_info") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioZlibCompressorClass.t
    type 'a converterclass_t = 'a GioConverterClass.t
    type 'a fileinfoclass_t = 'a GioFileInfoClass.t
    type zlibcompressorformat_t = GioZlibCompressorFormat.t
    type t = base class_t
    fun asConverter self = (GObjectObjectClass.C.withPtr ---> GioConverterClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new format level = (GioZlibCompressorFormat.C.withVal &&&> FFI.Int32.C.withVal ---> GioZlibCompressorClass.C.fromPtr true) new_ (format & level)
    fun getFileInfo self = (GObjectObjectClass.C.withPtr ---> GioFileInfoClass.C.fromPtr false) getFileInfo_ self
    fun setFileInfo self fileInfo = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setFileInfo_ (self & fileInfo)
    local
      open Property
    in
      val fileInfoProp =
        {
          get = fn x => get "file-info" GioFileInfoClass.tOpt x,
          set = fn x => set "file-info" GioFileInfoClass.tOpt x
        }
      val formatProp =
        {
          get = fn x => get "format" GioZlibCompressorFormat.t x,
          set = fn x => set "format" GioZlibCompressorFormat.t x
        }
      val levelProp =
        {
          get = fn x => get "level" int x,
          set = fn x => set "level" int x
        }
    end
  end
