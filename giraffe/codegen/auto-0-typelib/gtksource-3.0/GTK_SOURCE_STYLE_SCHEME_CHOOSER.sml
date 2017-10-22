signature GTK_SOURCE_STYLE_SCHEME_CHOOSER =
  sig
    type 'a class
    type 'a style_scheme_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getStyleScheme : 'a class -> base style_scheme_class
    val setStyleScheme :
      'a class
       -> 'b style_scheme_class
       -> unit
    val styleSchemeProp : ('a class, base style_scheme_class option, 'b style_scheme_class option) Property.readwrite
  end
