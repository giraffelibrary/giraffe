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
      val getType_ = call (getSymbol "g_zlib_compressor_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_zlib_compressor_new") (GioZlibCompressorFormat.PolyML.cVal &&> GInt.PolyML.cVal --> GioZlibCompressorClass.PolyML.cPtr)
      val getFileInfo_ = call (getSymbol "g_zlib_compressor_get_file_info") (GioZlibCompressorClass.PolyML.cPtr --> GioFileInfoClass.PolyML.cPtr)
      val setFileInfo_ = call (getSymbol "g_zlib_compressor_set_file_info") (GioZlibCompressorClass.PolyML.cPtr &&> GioFileInfoClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GioZlibCompressorClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type zlib_compressor_format_t = GioZlibCompressorFormat.t
    type t = base class
    fun asConverter self = (GObjectObjectClass.FFI.withPtr false ---> GioConverterClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (format, level) = (GioZlibCompressorFormat.FFI.withVal &&&> GInt.FFI.withVal ---> GioZlibCompressorClass.FFI.fromPtr true) new_ (format & level)
    fun getFileInfo self = (GioZlibCompressorClass.FFI.withPtr false ---> GioFileInfoClass.FFI.fromPtr false) getFileInfo_ self
    fun setFileInfo self fileInfo = (GioZlibCompressorClass.FFI.withPtr false &&&> GioFileInfoClass.FFI.withOptPtr false ---> I) setFileInfo_ (self & fileInfo)
    local
      open Property
    in
      val fileInfoProp =
        {
          get = fn x => get "file-info" GioFileInfoClass.tOpt x,
          set = fn x => set "file-info" GioFileInfoClass.tOpt x,
          new = fn x => new "file-info" GioFileInfoClass.tOpt x
        }
      val formatProp =
        {
          get = fn x => get "format" GioZlibCompressorFormat.t x,
          new = fn x => new "format" GioZlibCompressorFormat.t x
        }
      val levelProp =
        {
          get = fn x => get "level" int x,
          new = fn x => new "level" int x
        }
    end
  end
