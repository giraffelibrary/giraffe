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
    val bufferProp : ('a class, base buffer_class option, 'b buffer_class option) Property.readwrite
    val compressionTypeProp : ('a class, compression_type_t, compression_type_t) Property.readwrite
    val encodingProp : ('a class, encoding_t option, encoding_t option) Property.readwrite
    val fileProp : ('a class, base file_class option, 'b file_class option) Property.readwrite
    val flagsProp : ('a class, file_saver_flags_t, file_saver_flags_t) Property.readwrite
    val locationProp : ('a class, base Gio.FileClass.class option, 'b Gio.FileClass.class option) Property.readwrite
    val newlineTypeProp : ('a class, newline_type_t, newline_type_t) Property.readwrite
  end
