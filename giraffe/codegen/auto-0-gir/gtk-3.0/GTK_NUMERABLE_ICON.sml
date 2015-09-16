signature GTK_NUMERABLE_ICON =
  sig
    type 'a class_t
    type 'a style_context_class_t
    type t = base class_t
    val asIcon : 'a class_t -> base Gio.IconClass.t
    val getType : unit -> GObject.Type.t
    val new : 'a Gio.IconClass.t -> base Gio.IconClass.t
    val newWithStyleContext :
      'a Gio.IconClass.t
       -> 'b style_context_class_t
       -> base Gio.IconClass.t
    val getBackgroundGicon : 'a class_t -> base Gio.IconClass.t
    val getBackgroundIconName : 'a class_t -> string
    val getCount : 'a class_t -> LargeInt.int
    val getLabel : 'a class_t -> string
    val getStyleContext : 'a class_t -> base style_context_class_t
    val setBackgroundGicon :
      'a class_t
       -> 'b Gio.IconClass.t option
       -> unit
    val setBackgroundIconName :
      'a class_t
       -> string option
       -> unit
    val setCount :
      'a class_t
       -> LargeInt.int
       -> unit
    val setLabel :
      'a class_t
       -> string option
       -> unit
    val setStyleContext :
      'a class_t
       -> 'b style_context_class_t
       -> unit
    val backgroundIconProp : ('a class_t, base Gio.IconClass.t option, 'b Gio.IconClass.t option) Property.readwrite
    val backgroundIconNameProp : ('a class_t, string option, string option) Property.readwrite
    val countProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val labelProp : ('a class_t, string option, string option) Property.readwrite
    val styleContextProp : ('a class_t, base style_context_class_t option, 'b style_context_class_t option) Property.readwrite
  end
