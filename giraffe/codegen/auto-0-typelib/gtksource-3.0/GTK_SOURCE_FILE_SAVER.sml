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
    val bufferProp :
      {
        get : 'a class -> base buffer_class option,
        new : 'b buffer_class option -> 'a class Property.t
      }
    val compressionTypeProp :
      {
        get : 'a class -> compression_type_t,
        set :
          compression_type_t
           -> 'a class
           -> unit,
        new : compression_type_t -> 'a class Property.t
      }
    val encodingProp :
      {
        get : 'a class -> encoding_t option,
        set :
          encoding_t option
           -> 'a class
           -> unit,
        new : encoding_t option -> 'a class Property.t
      }
    val fileProp :
      {
        get : 'a class -> base file_class option,
        new : 'b file_class option -> 'a class Property.t
      }
    val flagsProp :
      {
        get : 'a class -> file_saver_flags_t,
        set :
          file_saver_flags_t
           -> 'a class
           -> unit,
        new : file_saver_flags_t -> 'a class Property.t
      }
    val locationProp :
      {
        get : 'a class -> base Gio.FileClass.class option,
        new : 'b Gio.FileClass.class option -> 'a class Property.t
      }
    val newlineTypeProp :
      {
        get : 'a class -> newline_type_t,
        set :
          newline_type_t
           -> 'a class
           -> unit,
        new : newline_type_t -> 'a class Property.t
      }
  end
