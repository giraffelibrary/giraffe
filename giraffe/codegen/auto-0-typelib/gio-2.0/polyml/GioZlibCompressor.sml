structure GioZlibCompressor :>
  GIO_ZLIB_COMPRESSOR
    where type 'a class = 'a GioZlibCompressorClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type zlib_compressor_format_t = GioZlibCompressorFormat.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_zlib_compressor_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_zlib_compressor_new") (GioZlibCompressorFormat.PolyML.cVal &&> FFI.Int32.PolyML.cVal --> GioZlibCompressorClass.PolyML.cPtr)
      val getFileInfo_ = call (load_sym libgio "g_zlib_compressor_get_file_info") (GioZlibCompressorClass.PolyML.cPtr --> GioFileInfoClass.PolyML.cPtr)
      val setFileInfo_ = call (load_sym libgio "g_zlib_compressor_set_file_info") (GioZlibCompressorClass.PolyML.cPtr &&> GioFileInfoClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioZlibCompressorClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type zlib_compressor_format_t = GioZlibCompressorFormat.t
    type t = base class
    fun asConverter self = (GObjectObjectClass.C.withPtr ---> GioConverterClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new format level = (GioZlibCompressorFormat.C.withVal &&&> FFI.Int32.C.withVal ---> GioZlibCompressorClass.C.fromPtr true) new_ (format & level)
    fun getFileInfo self = (GioZlibCompressorClass.C.withPtr ---> GioFileInfoClass.C.fromPtr false) getFileInfo_ self
    fun setFileInfo self fileInfo = (GioZlibCompressorClass.C.withPtr &&&> GioFileInfoClass.C.withOptPtr ---> I) setFileInfo_ (self & fileInfo)
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
