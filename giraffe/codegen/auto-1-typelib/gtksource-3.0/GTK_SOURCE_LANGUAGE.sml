signature GTK_SOURCE_LANGUAGE =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getHidden : 'a class_t -> bool
    val getId : 'a class_t -> string
    val getMetadata :
      'a class_t
       -> string
       -> string
    val getName : 'a class_t -> string
    val getSection : 'a class_t -> string
    val getStyleName :
      'a class_t
       -> string
       -> string
    val hiddenProp : ('a class_t, bool) Property.readonly
    val idProp : ('a class_t, string option) Property.readonly
    val nameProp : ('a class_t, string option) Property.readonly
    val sectionProp : ('a class_t, string option) Property.readonly
  end
