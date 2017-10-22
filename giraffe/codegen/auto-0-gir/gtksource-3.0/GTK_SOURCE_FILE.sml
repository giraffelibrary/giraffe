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
    val compressionTypeProp : ('a class, compression_type_t) Property.readonly
    val encodingProp : ('a class, encoding_t option) Property.readonly
    val locationProp : ('a class, base Gio.FileClass.class option, 'b Gio.FileClass.class option) Property.readwrite
    val newlineTypeProp : ('a class, newline_type_t) Property.readonly
    val readOnlyProp : ('a class, bool) Property.readonly
  end
