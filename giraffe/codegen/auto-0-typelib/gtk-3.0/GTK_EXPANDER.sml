signature GTK_EXPANDER =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val newWithMnemonic : string option -> base class
    val getExpanded : 'a class -> bool
    val getLabel : 'a class -> string
    val getLabelFill : 'a class -> bool
    val getLabelWidget : 'a class -> base widget_class
    val getResizeToplevel : 'a class -> bool
    val getSpacing : 'a class -> LargeInt.int
    val getUseMarkup : 'a class -> bool
    val getUseUnderline : 'a class -> bool
    val setExpanded :
      'a class
       -> bool
       -> unit
    val setLabel :
      'a class
       -> string option
       -> unit
    val setLabelFill :
      'a class
       -> bool
       -> unit
    val setLabelWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val setResizeToplevel :
      'a class
       -> bool
       -> unit
    val setSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val setUseMarkup :
      'a class
       -> bool
       -> unit
    val setUseUnderline :
      'a class
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.signal
    val expandedProp : ('a class, bool, bool) Property.readwrite
    val labelProp : ('a class, string option, string option) Property.readwrite
    val labelFillProp : ('a class, bool, bool) Property.readwrite
    val labelWidgetProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val resizeToplevelProp : ('a class, bool, bool) Property.readwrite
    val spacingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val useMarkupProp : ('a class, bool, bool) Property.readwrite
    val useUnderlineProp : ('a class, bool, bool) Property.readwrite
  end
