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
    val styleSchemeProp :
      {
        get : 'a class -> base style_scheme_class option,
        set :
          'b style_scheme_class option
           -> 'a class
           -> unit,
        new : 'b style_scheme_class option -> 'a class Property.t
      }
  end
