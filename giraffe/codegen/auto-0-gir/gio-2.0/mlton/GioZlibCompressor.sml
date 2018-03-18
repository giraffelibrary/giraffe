structure GioZlibCompressor :>
  GIO_ZLIB_COMPRESSOR
    where type 'a class = 'a GioZlibCompressorClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type zlib_compressor_format_t = GioZlibCompressorFormat.t =
  struct
    val getType_ = _import "g_zlib_compressor_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_zlib_compressor_new" : GioZlibCompressorFormat.FFI.val_ * GInt.FFI.val_ -> GioZlibCompressorClass.FFI.notnull GioZlibCompressorClass.FFI.p;) (x1, x2)
    val getFileInfo_ = _import "g_zlib_compressor_get_file_info" : GioZlibCompressorClass.FFI.notnull GioZlibCompressorClass.FFI.p -> GioFileInfoClass.FFI.notnull GioFileInfoClass.FFI.p;
    val setFileInfo_ = fn x1 & x2 => (_import "g_zlib_compressor_set_file_info" : GioZlibCompressorClass.FFI.notnull GioZlibCompressorClass.FFI.p * unit GioFileInfoClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GioZlibCompressorClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type zlib_compressor_format_t = GioZlibCompressorFormat.t
    type t = base class
    fun asConverter self = (GObjectObjectClass.FFI.withPtr ---> GioConverterClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (format, level) = (GioZlibCompressorFormat.FFI.withVal &&&> GInt.FFI.withVal ---> GioZlibCompressorClass.FFI.fromPtr true) new_ (format & level)
    fun getFileInfo self = (GioZlibCompressorClass.FFI.withPtr ---> GioFileInfoClass.FFI.fromPtr false) getFileInfo_ self
    fun setFileInfo self fileInfo = (GioZlibCompressorClass.FFI.withPtr &&&> GioFileInfoClass.FFI.withOptPtr ---> I) setFileInfo_ (self & fileInfo)
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
