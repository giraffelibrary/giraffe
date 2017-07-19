signature GTK_SOURCE_GUTTER_RENDERER_TEXT =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val setMarkup :
      'a class
       -> string * LargeInt.int
       -> unit
    val setText :
      'a class
       -> string * LargeInt.int
       -> unit
    val markupProp : ('a class, string option, string option) Property.readwrite
    val textProp : ('a class, string option, string option) Property.readwrite
  end
