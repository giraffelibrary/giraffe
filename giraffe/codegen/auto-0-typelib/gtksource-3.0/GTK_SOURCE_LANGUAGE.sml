signature GTK_SOURCE_LANGUAGE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getGlobs : 'a class -> string list option
    val getHidden : 'a class -> bool
    val getId : 'a class -> string
    val getMetadata :
      'a class
       -> string
       -> string option
    val getMimeTypes : 'a class -> string list option
    val getName : 'a class -> string
    val getSection : 'a class -> string
    val getStyleFallback :
      'a class
       -> string
       -> string option
    val getStyleIds : 'a class -> string list option
    val getStyleName :
      'a class
       -> string
       -> string option
    val hiddenProp : {get : 'a class -> bool}
    val idProp : {get : 'a class -> string option}
    val nameProp : {get : 'a class -> string option}
    val sectionProp : {get : 'a class -> string option}
  end
