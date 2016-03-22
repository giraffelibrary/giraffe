structure GioZlibCompressor :>
  GIO_ZLIB_COMPRESSOR
    where type 'a class = 'a GioZlibCompressorClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type zlib_compressor_format_t = GioZlibCompressorFormat.t =
  struct
    val getType_ = _import "g_zlib_compressor_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_zlib_compressor_new" : GioZlibCompressorFormat.C.val_ * FFI.Int.C.val_ -> GioZlibCompressorClass.C.notnull GioZlibCompressorClass.C.p;) (x1, x2)
    val getFileInfo_ = _import "g_zlib_compressor_get_file_info" : GioZlibCompressorClass.C.notnull GioZlibCompressorClass.C.p -> GioFileInfoClass.C.notnull GioFileInfoClass.C.p;
    val setFileInfo_ = fn x1 & x2 => (_import "g_zlib_compressor_set_file_info" : GioZlibCompressorClass.C.notnull GioZlibCompressorClass.C.p * unit GioFileInfoClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GioZlibCompressorClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type zlib_compressor_format_t = GioZlibCompressorFormat.t
    type t = base class
    fun asConverter self = (GObjectObjectClass.C.withPtr ---> GioConverterClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new format level = (GioZlibCompressorFormat.C.withVal &&&> FFI.Int.C.withVal ---> GioZlibCompressorClass.C.fromPtr true) new_ (format & level)
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
