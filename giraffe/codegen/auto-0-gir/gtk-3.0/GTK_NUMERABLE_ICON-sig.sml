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
    val backgroundIconProp : ('a class, unit -> base Gio.IconClass.class option, 'b Gio.IconClass.class option -> unit, 'b Gio.IconClass.class option -> unit) Property.t
    val backgroundIconNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val countProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val labelProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val styleContextProp : ('a class, unit -> base style_context_class option, 'b style_context_class option -> unit, 'b style_context_class option -> unit) Property.t
  end
