structure GioZlibCompressor :>
  GIO_ZLIB_COMPRESSOR
    where type 'a class = 'a GioZlibCompressorClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type zlib_compressor_format_t = GioZlibCompressorFormat.t =
  struct
    val getType_ = _import "g_zlib_compressor_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_zlib_compressor_new" : GioZlibCompressorFormat.FFI.val_ * GInt.FFI.val_ -> GioZlibCompressorClass.FFI.non_opt GioZlibCompressorClass.FFI.p;) (x1, x2)
    val getFileInfo_ = _import "g_zlib_compressor_get_file_info" : GioZlibCompressorClass.FFI.non_opt GioZlibCompressorClass.FFI.p -> GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p;
    val setFileInfo_ = fn x1 & x2 => (_import "g_zlib_compressor_set_file_info" : GioZlibCompressorClass.FFI.non_opt GioZlibCompressorClass.FFI.p * GioFileInfoClass.FFI.opt GioFileInfoClass.FFI.p -> unit;) (x1, x2)
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
      open ValueAccessor
    in
      val fileInfoProp =
        {
          name = "file-info",
          gtype = fn () => C.gtype GioFileInfoClass.tOpt (),
          get = fn x => fn () => C.get GioFileInfoClass.tOpt x,
          set = fn x => C.set GioFileInfoClass.tOpt x,
          init = fn x => C.set GioFileInfoClass.tOpt x
        }
      val formatProp =
        {
          name = "format",
          gtype = fn () => C.gtype GioZlibCompressorFormat.t (),
          get = fn x => fn () => C.get GioZlibCompressorFormat.t x,
          set = ignore,
          init = fn x => C.set GioZlibCompressorFormat.t x
        }
      val levelProp =
        {
          name = "level",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = fn x => C.set int x
        }
    end
  end
