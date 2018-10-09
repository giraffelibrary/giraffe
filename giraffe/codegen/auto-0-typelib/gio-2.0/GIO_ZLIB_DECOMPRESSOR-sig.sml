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
    val fileInfoProp : {get : 'a class -> base file_info_class option}
    val formatProp :
      {
        get : 'a class -> zlib_compressor_format_t,
        new : zlib_compressor_format_t -> 'a class Property.t
      }
  end
