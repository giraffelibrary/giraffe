structure GioZlibDecompressor :>
  GIO_ZLIB_DECOMPRESSOR
    where type 'a class = 'a GioZlibDecompressorClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type zlib_compressor_format_t = GioZlibCompressorFormat.t =
  struct
    val getType_ = _import "g_zlib_decompressor_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_zlib_decompressor_new" : GioZlibCompressorFormat.FFI.val_ -> GioZlibDecompressorClass.FFI.notnull GioZlibDecompressorClass.FFI.p;
    val getFileInfo_ = _import "g_zlib_decompressor_get_file_info" : GioZlibDecompressorClass.FFI.notnull GioZlibDecompressorClass.FFI.p -> GioFileInfoClass.FFI.notnull GioFileInfoClass.FFI.p;
    type 'a class = 'a GioZlibDecompressorClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type zlib_compressor_format_t = GioZlibCompressorFormat.t
    type t = base class
    fun asConverter self = (GObjectObjectClass.FFI.withPtr ---> GioConverterClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new format = (GioZlibCompressorFormat.FFI.withVal ---> GioZlibDecompressorClass.FFI.fromPtr true) new_ format
    fun getFileInfo self = (GioZlibDecompressorClass.FFI.withPtr ---> GioFileInfoClass.FFI.fromPtr false) getFileInfo_ self
    local
      open Property
    in
      val fileInfoProp = {get = fn x => get "file-info" GioFileInfoClass.tOpt x}
      val formatProp =
        {
          get = fn x => get "format" GioZlibCompressorFormat.t x,
          new = fn x => new "format" GioZlibCompressorFormat.t x
        }
    end
  end
