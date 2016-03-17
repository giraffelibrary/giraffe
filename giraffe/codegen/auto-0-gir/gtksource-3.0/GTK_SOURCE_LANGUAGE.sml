signature GTK_SOURCE_LANGUAGE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getHidden : 'a class -> bool
    val getId : 'a class -> string
    val getMetadata :
      'a class
       -> string
       -> string
    val getName : 'a class -> string
    val getSection : 'a class -> string
    val getStyleName :
      'a class
       -> string
       -> string
    val hiddenProp : ('a class, bool) Property.readonly
    val idProp : ('a class, string option) Property.readonly
    val nameProp : ('a class, string option) Property.readonly
    val sectionProp : ('a class, string option) Property.readonly
  end
