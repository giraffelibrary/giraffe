signature GIO_ZLIB_DECOMPRESSOR =
  sig
    type 'a class_t
    type 'a converter_class_t
    type 'a file_info_class_t
    type zlib_compressor_format_t
    type t = base class_t
    val asConverter : 'a class_t -> base converter_class_t
    val getType : unit -> GObject.Type.t
    val new : zlib_compressor_format_t -> base class_t
    val getFileInfo : 'a class_t -> base file_info_class_t
    val fileInfoProp : ('a class_t, base file_info_class_t option) Property.readonly
    val formatProp : ('a class_t, zlib_compressor_format_t, zlib_compressor_format_t) Property.readwrite
  end
