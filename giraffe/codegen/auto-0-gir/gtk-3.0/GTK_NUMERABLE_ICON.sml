signature GTK_NUMERABLE_ICON =
  sig
    type 'a class
    type 'a style_context_class
    type t = base class
    val asIcon : 'a class -> base Gio.IconClass.class
    val getType : unit -> GObject.Type.t
    val new : 'a Gio.IconClass.class -> base Gio.IconClass.class
    val newWithStyleContext : 'a Gio.IconClass.class * 'b style_context_class -> base Gio.IconClass.class
    val getBackgroundGicon : 'a class -> base Gio.IconClass.class
    val getBackgroundIconName : 'a class -> string
    val getCount : 'a class -> LargeInt.int
    val getLabel : 'a class -> string
    val getStyleContext : 'a class -> base style_context_class
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
    val backgroundIconProp : ('a class, base Gio.IconClass.class option, 'b Gio.IconClass.class option) Property.readwrite
    val backgroundIconNameProp : ('a class, string option, string option) Property.readwrite
    val countProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val labelProp : ('a class, string option, string option) Property.readwrite
    val styleContextProp : ('a class, base style_context_class option, 'b style_context_class option) Property.readwrite
  end
