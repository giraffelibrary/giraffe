signature GIO_ZLIB_DECOMPRESSOR =
  sig
    type 'a class
    type 'a converter_class
    type 'a file_info_class
    type zlib_compressor_format_t
    type t = base class
    val asConverter : 'a class -> base converter_class
    val getType : unit -> GObject.Type.t
    val new : zlib_compressor_format_t -> base class
    val getFileInfo : 'a class -> base file_info_class
    val fileInfoProp : ('a class, base file_info_class option) Property.readonly
    val formatProp : ('a class, zlib_compressor_format_t, zlib_compressor_format_t) Property.readwrite
  end
