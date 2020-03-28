signature GTK_SOURCE_FILE_LOADER =
  sig
    type 'a class
    type compression_type_t
    type encoding_t
    type newline_type_t
    type 'a buffer_class
    type 'a file_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a buffer_class * 'b file_class -> base class
    val newFromStream :
      'a buffer_class
       * 'b file_class
       * 'c Gio.InputStreamClass.class
       -> base class
    val getBuffer : 'a class -> base buffer_class
    val getCompressionType : 'a class -> compression_type_t
    val getEncoding : 'a class -> encoding_t
    val getFile : 'a class -> base file_class
    val getInputStream : 'a class -> base Gio.InputStreamClass.class option
    val getLocation : 'a class -> base Gio.FileClass.class option
    val getNewlineType : 'a class -> newline_type_t
    val loadFinish :
      'a class
       -> 'b Gio.AsyncResultClass.class
       -> unit
    val bufferProp :
      {
        get : 'a class -> base buffer_class option,
        new : 'b buffer_class option -> 'a class Property.t
      }
    val fileProp :
      {
        get : 'a class -> base file_class option,
        new : 'b file_class option -> 'a class Property.t
      }
    val inputStreamProp :
      {
        get : 'a class -> base Gio.InputStreamClass.class option,
        new : 'b Gio.InputStreamClass.class option -> 'a class Property.t
      }
    val locationProp :
      {
        get : 'a class -> base Gio.FileClass.class option,
        new : 'b Gio.FileClass.class option -> 'a class Property.t
      }
  end