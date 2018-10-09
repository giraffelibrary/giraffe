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
    val fileInfoProp :
      {
        get : 'a class -> base file_info_class option,
        set :
          'b file_info_class option
           -> 'a class
           -> unit,
        new : 'b file_info_class option -> 'a class Property.t
      }
    val formatProp :
      {
        get : 'a class -> zlib_compressor_format_t,
        new : zlib_compressor_format_t -> 'a class Property.t
      }
    val levelProp :
      {
        get : 'a class -> LargeInt.int,
        new : LargeInt.int -> 'a class Property.t
      }
  end
