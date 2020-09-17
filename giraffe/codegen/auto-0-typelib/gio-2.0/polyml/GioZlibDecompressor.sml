structure GioZlibDecompressor :>
  GIO_ZLIB_DECOMPRESSOR
    where type 'a class = 'a GioZlibDecompressorClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type zlib_compressor_format_t = GioZlibCompressorFormat.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_zlib_decompressor_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_zlib_decompressor_new") (GioZlibCompressorFormat.PolyML.cVal --> GioZlibDecompressorClass.PolyML.cPtr)
      val getFileInfo_ = call (getSymbol "g_zlib_decompressor_get_file_info") (GioZlibDecompressorClass.PolyML.cPtr --> GioFileInfoClass.PolyML.cPtr)
    end
    type 'a class = 'a GioZlibDecompressorClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type zlib_compressor_format_t = GioZlibCompressorFormat.t
    type t = base class
    fun asConverter self = (GObjectObjectClass.FFI.withPtr false ---> GioConverterClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new format = (GioZlibCompressorFormat.FFI.withVal ---> GioZlibDecompressorClass.FFI.fromPtr true) new_ format
    fun getFileInfo self = (GioZlibDecompressorClass.FFI.withPtr false ---> GioFileInfoClass.FFI.fromPtr false) getFileInfo_ self before GioZlibDecompressorClass.FFI.touchPtr self
    local
      open ValueAccessor
    in
      val fileInfoProp =
        {
          name = "file-info",
          gtype = fn () => C.gtype GioFileInfoClass.tOpt (),
          get = fn x => fn () => C.get GioFileInfoClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val formatProp =
        {
          name = "format",
          gtype = fn () => C.gtype GioZlibCompressorFormat.t (),
          get = fn x => fn () => C.get GioZlibCompressorFormat.t x,
          set = ignore,
          init = fn x => C.set GioZlibCompressorFormat.t x
        }
    end
  end
