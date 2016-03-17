signature GTK_TOOL_BUTTON =
  sig
    type 'a class
    type 'a activatable_class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new :
      'a widget_class option
       -> string option
       -> base class
    val newFromStock : string -> base class
    val getIconName : 'a class -> string
    val getIconWidget : 'a class -> base widget_class
    val getLabel : 'a class -> string
    val getLabelWidget : 'a class -> base widget_class
    val getStockId : 'a class -> string
    val getUseUnderline : 'a class -> bool
    val setIconName :
      'a class
       -> string option
       -> unit
    val setIconWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val setLabel :
      'a class
       -> string option
       -> unit
    val setLabelWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val setStockId :
      'a class
       -> string option
       -> unit
    val setUseUnderline :
      'a class
       -> bool
       -> unit
    val clickedSig : (unit -> unit) -> 'a class Signal.signal
    val iconNameProp : ('a class, string option, string option) Property.readwrite
    val iconWidgetProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val labelProp : ('a class, string option, string option) Property.readwrite
    val labelWidgetProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val stockIdProp : ('a class, string option, string option) Property.readwrite
    val useUnderlineProp : ('a class, bool, bool) Property.readwrite
  end
