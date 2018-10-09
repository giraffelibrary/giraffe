signature GTK_NUMERABLE_ICON =
  sig
    type 'a class
    type 'a style_context_class
    type t = base class
    val asIcon : 'a class -> base Gio.IconClass.class
    val getType : unit -> GObject.Type.t
    val new : 'a Gio.IconClass.class -> base Gio.IconClass.class
    val newWithStyleContext : 'a Gio.IconClass.class * 'b style_context_class -> base Gio.IconClass.class
    val getBackgroundGicon : 'a class -> base Gio.IconClass.class option
    val getBackgroundIconName : 'a class -> string option
    val getCount : 'a class -> LargeInt.int
    val getLabel : 'a class -> string option
    val getStyleContext : 'a class -> base style_context_class option
    val setBackgroundGicon :
      'a class
       -> 'b Gio.IconClass.class option
       -> unit
    val setBackgroundIconName :
      'a class
       -> string option
       -> unit
    val setCount :
      'a class
       -> LargeInt.int
       -> unit
    val setLabel :
      'a class
       -> string option
       -> unit
    val setStyleContext :
      'a class
       -> 'b style_context_class
       -> unit
    val backgroundIconProp :
      {
        get : 'a class -> base Gio.IconClass.class option,
        set :
          'b Gio.IconClass.class option
           -> 'a class
           -> unit,
        new : 'b Gio.IconClass.class option -> 'a class Property.t
      }
    val backgroundIconNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val countProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val labelProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val styleContextProp :
      {
        get : 'a class -> base style_context_class option,
        set :
          'b style_context_class option
           -> 'a class
           -> unit,
        new : 'b style_context_class option -> 'a class Property.t
      }
  end
