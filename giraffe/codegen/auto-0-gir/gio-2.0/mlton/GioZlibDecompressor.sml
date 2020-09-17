structure GioZlibDecompressor :>
  GIO_ZLIB_DECOMPRESSOR
    where type 'a class = 'a GioZlibDecompressorClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type zlib_compressor_format_t = GioZlibCompressorFormat.t =
  struct
    val getType_ = _import "g_zlib_decompressor_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_zlib_decompressor_new" : GioZlibCompressorFormat.FFI.val_ -> GioZlibDecompressorClass.FFI.non_opt GioZlibDecompressorClass.FFI.p;
    val getFileInfo_ = _import "g_zlib_decompressor_get_file_info" : GioZlibDecompressorClass.FFI.non_opt GioZlibDecompressorClass.FFI.p -> GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p;
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
