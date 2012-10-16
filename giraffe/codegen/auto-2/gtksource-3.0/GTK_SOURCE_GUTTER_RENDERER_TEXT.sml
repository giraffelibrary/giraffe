signature GTK_SOURCE_GUTTER_RENDERER_TEXT =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val setMarkup :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val setText :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val markupProp : ('a class_t, string option, string option) Property.readwrite
    val textProp : ('a class_t, string option, string option) Property.readwrite
  end
