structure GioZlibDecompressor :>
  GIO_ZLIB_DECOMPRESSOR
    where type 'a class = 'a GioZlibDecompressorClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type zlib_compressor_format_t = GioZlibCompressorFormat.t =
  struct
    val getType_ = _import "g_zlib_decompressor_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_zlib_decompressor_new" : GioZlibCompressorFormat.C.val_ -> GioZlibDecompressorClass.C.notnull GioZlibDecompressorClass.C.p;
    val getFileInfo_ = _import "g_zlib_decompressor_get_file_info" : GioZlibDecompressorClass.C.notnull GioZlibDecompressorClass.C.p -> GioFileInfoClass.C.notnull GioFileInfoClass.C.p;
    type 'a class = 'a GioZlibDecompressorClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type zlib_compressor_format_t = GioZlibCompressorFormat.t
    type t = base class
    fun asConverter self = (GObjectObjectClass.C.withPtr ---> GioConverterClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new format = (GioZlibCompressorFormat.C.withVal ---> GioZlibDecompressorClass.C.fromPtr true) new_ format
    fun getFileInfo self = (GioZlibDecompressorClass.C.withPtr ---> GioFileInfoClass.C.fromPtr false) getFileInfo_ self
    local
      open Property
    in
      val fileInfoProp = {get = fn x => get "file-info" GioFileInfoClass.tOpt x}
      val formatProp =
        {
          get = fn x => get "format" GioZlibCompressorFormat.t x,
          set = fn x => set "format" GioZlibCompressorFormat.t x
        }
    end
  end
