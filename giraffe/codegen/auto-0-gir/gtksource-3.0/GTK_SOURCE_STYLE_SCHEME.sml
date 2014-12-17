signature GTK_SOURCE_STYLE_SCHEME =
  sig
    type 'a class_t
    type 'a styleclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getDescription : 'a class_t -> string
    val getFilename : 'a class_t -> string
    val getId : 'a class_t -> string
    val getName : 'a class_t -> string
    val getStyle :
      'a class_t
       -> string
       -> base styleclass_t
    val descriptionProp : ('a class_t, string option) Property.readonly
    val filenameProp : ('a class_t, string option) Property.readonly
    val idProp : ('a class_t, string option, string option) Property.readwrite
    val nameProp : ('a class_t, string option) Property.readonly
  end
