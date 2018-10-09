signature GTK_SOURCE_FILE =
  sig
    type 'a class
    type compression_type_t
    type encoding_t
    type newline_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val checkFileOnDisk : 'a class -> unit
    val getCompressionType : 'a class -> compression_type_t
    val getEncoding : 'a class -> encoding_t
    val getLocation : 'a class -> base Gio.FileClass.class
    val getNewlineType : 'a class -> newline_type_t
    val isDeleted : 'a class -> bool
    val isExternallyModified : 'a class -> bool
    val isLocal : 'a class -> bool
    val isReadonly : 'a class -> bool
    val setLocation :
      'a class
       -> 'b Gio.FileClass.class option
       -> unit
    val compressionTypeProp : {get : 'a class -> compression_type_t}
    val encodingProp : {get : 'a class -> encoding_t option}
    val locationProp :
      {
        get : 'a class -> base Gio.FileClass.class option,
        set :
          'b Gio.FileClass.class option
           -> 'a class
           -> unit,
        new : 'b Gio.FileClass.class option -> 'a class Property.t
      }
    val newlineTypeProp : {get : 'a class -> newline_type_t}
    val readOnlyProp : {get : 'a class -> bool}
  end
