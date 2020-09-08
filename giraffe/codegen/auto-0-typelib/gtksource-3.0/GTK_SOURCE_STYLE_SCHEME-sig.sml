signature GTK_SOURCE_STYLE_SCHEME =
  sig
    type 'a class
    type 'a style_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getAuthors : 'a class -> Utf8CPtrArray.t option
    val getDescription : 'a class -> string option
    val getFilename : 'a class -> string option
    val getId : 'a class -> string
    val getName : 'a class -> string
    val getStyle :
      'a class
       -> string
       -> base style_class option
    val descriptionProp : ('a class, unit -> string option, unit, unit) Property.t
    val filenameProp : ('a class, unit -> string option, unit, unit) Property.t
    val idProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val nameProp : ('a class, unit -> string option, unit, unit) Property.t
  end
