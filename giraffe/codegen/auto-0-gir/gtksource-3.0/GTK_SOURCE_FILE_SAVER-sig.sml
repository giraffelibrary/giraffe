signature GTK_SOURCE_FILE_SAVER =
  sig
    type 'a class
    type 'a buffer_class
    type compression_type_t
    type encoding_t
    type 'a file_class
    type file_saver_flags_t
    type newline_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a buffer_class * 'b file_class -> base class
    val newWithTarget :
      'a buffer_class
       * 'b file_class
       * 'c Gio.FileClass.class
       -> base class
    val getBuffer : 'a class -> base buffer_class
    val getCompressionType : 'a class -> compression_type_t
    val getEncoding : 'a class -> encoding_t
    val getFile : 'a class -> base file_class
    val getFlags : 'a class -> file_saver_flags_t
    val getLocation : 'a class -> base Gio.FileClass.class
    val getNewlineType : 'a class -> newline_type_t
    val saveFinish :
      'a class
       -> 'b Gio.AsyncResultClass.class
       -> unit
    val setCompressionType :
      'a class
       -> compression_type_t
       -> unit
    val setEncoding :
      'a class
       -> encoding_t option
       -> unit
    val setFlags :
      'a class
       -> file_saver_flags_t
       -> unit
    val setNewlineType :
      'a class
       -> newline_type_t
       -> unit
    val bufferProp : ('a class, unit -> base buffer_class option, unit, 'b buffer_class option -> unit) Property.t
    val compressionTypeProp : ('a class, unit -> compression_type_t, compression_type_t -> unit, compression_type_t -> unit) Property.t
    val encodingProp : ('a class, unit -> encoding_t option, encoding_t option -> unit, encoding_t option -> unit) Property.t
    val fileProp : ('a class, unit -> base file_class option, unit, 'b file_class option -> unit) Property.t
    val flagsProp : ('a class, unit -> file_saver_flags_t, file_saver_flags_t -> unit, file_saver_flags_t -> unit) Property.t
    val locationProp : ('a class, unit -> base Gio.FileClass.class option, unit, 'b Gio.FileClass.class option -> unit) Property.t
    val newlineTypeProp : ('a class, unit -> newline_type_t, newline_type_t -> unit, newline_type_t -> unit) Property.t
  end
