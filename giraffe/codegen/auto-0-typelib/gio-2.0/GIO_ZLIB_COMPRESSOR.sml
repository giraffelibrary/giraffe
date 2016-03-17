signature GIO_ZLIB_COMPRESSOR =
  sig
    type 'a class
    type 'a converter_class
    type 'a file_info_class
    type zlib_compressor_format_t
    type t = base class
    val asConverter : 'a class -> base converter_class
    val getType : unit -> GObject.Type.t
    val new :
      zlib_compressor_format_t
       -> LargeInt.int
       -> base class
    val getFileInfo : 'a class -> base file_info_class
    val setFileInfo :
      'a class
       -> 'b file_info_class option
       -> unit
    val fileInfoProp : ('a class, base file_info_class option, 'b file_info_class option) Property.readwrite
    val formatProp : ('a class, zlib_compressor_format_t, zlib_compressor_format_t) Property.readwrite
    val levelProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
