signature GTK_SOURCE_STYLE_SCHEME =
  sig
    type 'a class
    type 'a style_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getAuthors : 'a class -> Utf8CArray.t option
    val getDescription : 'a class -> string option
    val getFilename : 'a class -> string option
    val getId : 'a class -> string
    val getName : 'a class -> string
    val getStyle :
      'a class
       -> string
       -> base style_class option
    val descriptionProp : {get : 'a class -> string option}
    val filenameProp : {get : 'a class -> string option}
    val idProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val nameProp : {get : 'a class -> string option}
  end
