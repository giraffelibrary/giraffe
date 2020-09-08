signature GIO_ZLIB_COMPRESSOR =
  sig
    type 'a class
    type 'a converter_class
    type 'a file_info_class
    type zlib_compressor_format_t
    type t = base class
    val asConverter : 'a class -> base converter_class
    val getType : unit -> GObject.Type.t
    val new : zlib_compressor_format_t * LargeInt.int -> base class
    val getFileInfo : 'a class -> base file_info_class
    val setFileInfo :
      'a class
       -> 'b file_info_class option
       -> unit
    val fileInfoProp : ('a class, unit -> base file_info_class option, 'b file_info_class option -> unit, 'b file_info_class option -> unit) Property.t
    val formatProp : ('a class, unit -> zlib_compressor_format_t, unit, zlib_compressor_format_t -> unit) Property.t
    val levelProp : ('a class, unit -> LargeInt.int, unit, LargeInt.int -> unit) Property.t
  end
