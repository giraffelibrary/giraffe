structure GioZlibDecompressor :>
  GIO_ZLIB_DECOMPRESSOR
    where type 'a class_t = 'a GioZlibDecompressorClass.t
    where type 'a converterclass_t = 'a GioConverterClass.t
    where type 'a fileinfoclass_t = 'a GioFileInfoClass.t
    where type zlibcompressorformat_t = GioZlibCompressorFormat.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_zlib_decompressor_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_zlib_decompressor_new") (GioZlibCompressorFormat.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getFileInfo_ = call (load_sym libgio "g_zlib_decompressor_get_file_info") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioZlibDecompressorClass.t
    type 'a converterclass_t = 'a GioConverterClass.t
    type 'a fileinfoclass_t = 'a GioFileInfoClass.t
    type zlibcompressorformat_t = GioZlibCompressorFormat.t
    type t = base class_t
    fun asConverter self = (GObjectObjectClass.C.withPtr ---> GioConverterClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new format = (GioZlibCompressorFormat.C.withVal ---> GioZlibDecompressorClass.C.fromPtr true) new_ format
    fun getFileInfo self = (GObjectObjectClass.C.withPtr ---> GioFileInfoClass.C.fromPtr false) getFileInfo_ self
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
