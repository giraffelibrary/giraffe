signature GTK_SOURCE_STYLE_SCHEME =
  sig
    type 'a class
    type 'a style_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getAuthors : 'a class -> string list
    val getDescription : 'a class -> string
    val getFilename : 'a class -> string
    val getId : 'a class -> string
    val getName : 'a class -> string
    val getStyle :
      'a class
       -> string
       -> base style_class
    val descriptionProp : ('a class, string option) Property.readonly
    val filenameProp : ('a class, string option) Property.readonly
    val idProp : ('a class, string option, string option) Property.readwrite
    val nameProp : ('a class, string option) Property.readonly
  end
