signature GTK_EXPANDER =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a widgetclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val newWithMnemonic : string option -> base class_t
    val getExpanded : 'a class_t -> bool
    val getLabel : 'a class_t -> string
    val getLabelFill : 'a class_t -> bool
    val getLabelWidget : 'a class_t -> base widgetclass_t
    val getResizeToplevel : 'a class_t -> bool
    val getSpacing : 'a class_t -> LargeInt.int
    val getUseMarkup : 'a class_t -> bool
    val getUseUnderline : 'a class_t -> bool
    val setExpanded :
      'a class_t
       -> bool
       -> unit
    val setLabel :
      'a class_t
       -> string option
       -> unit
    val setLabelFill :
      'a class_t
       -> bool
       -> unit
    val setLabelWidget :
      'a class_t
       -> 'b widgetclass_t option
       -> unit
    val setResizeToplevel :
      'a class_t
       -> bool
       -> unit
    val setSpacing :
      'a class_t
       -> LargeInt.int
       -> unit
    val setUseMarkup :
      'a class_t
       -> bool
       -> unit
    val setUseUnderline :
      'a class_t
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class_t Signal.signal
    val expandedProp : ('a class_t, bool, bool) Property.readwrite
    val labelProp : ('a class_t, string option, string option) Property.readwrite
    val labelFillProp : ('a class_t, bool, bool) Property.readwrite
    val labelWidgetProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
    val resizeToplevelProp : ('a class_t, bool, bool) Property.readwrite
    val spacingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val useMarkupProp : ('a class_t, bool, bool) Property.readwrite
    val useUnderlineProp : ('a class_t, bool, bool) Property.readwrite
  end
